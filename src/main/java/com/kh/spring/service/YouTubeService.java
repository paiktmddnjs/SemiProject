package com.kh.spring.service;

import com.kh.spring.dto.YoutubedashboardDto;
import com.kh.spring.mapper.YoutubeChannelMapper;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class YouTubeService {

    @Value("${youtube.client-id}")
    private String clientId;

    @Value("${youtube.client-secret}")
    private String clientSecret;

    @Value("${youtube.redirect-uri}")
    private String redirectUri;

    @Value("${youtube.scope}")
    private String scope;

    private final RestTemplate restTemplate = new RestTemplate();

    // 1. Authorization URL
    public String getAuthorizationUrl() {
        return "https://accounts.google.com/o/oauth2/v2/auth" +
                "?client_id=" + clientId +
                "&redirect_uri=" + redirectUri +
                "&response_type=code" +
                "&scope=" + scope +
                "&access_type=offline" +
                "&prompt=consent";
    }

    // 2. Authorization code → Access token 교환
    public String getAccessToken(String code) {
        String url = "https://oauth2.googleapis.com/token";

        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("code", code);
        params.add("client_id", clientId);
        params.add("client_secret", clientSecret);
        params.add("redirect_uri", redirectUri);
        params.add("grant_type", "authorization_code");

        JSONObject response = new JSONObject(restTemplate.postForObject(url, params, String.class));
        return response.getString("access_token");
    }

    // 3. 내 채널 통계 가져오기
    public JSONObject getMyChannelStats(String accessToken) {
        HttpHeaders headers = new HttpHeaders();
        headers.setBearerAuth(accessToken);
        HttpEntity<String> entity = new HttpEntity<>(headers);

        // 1️⃣ 채널 정보 + 통계
        String channelUrl = "https://youtube.googleapis.com/youtube/v3/channels?part=snippet,statistics&mine=true";
        String channelResponse = restTemplate.exchange(channelUrl, HttpMethod.GET, entity, String.class).getBody();
        JSONObject channelJson = new JSONObject(channelResponse);

        if (!channelJson.has("items") || channelJson.getJSONArray("items").length() == 0) {
            throw new RuntimeException("채널 정보를 가져올 수 없습니다.");
        }

        JSONObject channelItem = channelJson.getJSONArray("items").getJSONObject(0);
        JSONObject snippet = channelItem.getJSONObject("snippet");
        JSONObject statistics = channelItem.getJSONObject("statistics");

        String channelName = snippet.getString("title");
        String channelHandle = snippet.optString("customUrl", snippet.getString("title"));
        long subs = statistics.optLong("subscriberCount", 0);
        int videoCount = statistics.optInt("videoCount", 0);
        long totalViews = statistics.optLong("viewCount", 0);

        // 2️⃣ 영상별 좋아요/댓글 계산 (기존 코드 재사용)
        double avgLikes = 0;
        double avgComments = 0;

        String searchUrl = "https://youtube.googleapis.com/youtube/v3/search?part=id&forMine=true&type=video&maxResults=50";
        String searchResponse = restTemplate.exchange(searchUrl, HttpMethod.GET, entity, String.class).getBody();
        JSONObject searchJson = new JSONObject(searchResponse);

        if (searchJson.has("items")) {
            JSONArray videoItems = searchJson.getJSONArray("items");
            StringBuilder videoIds = new StringBuilder();

            for (int i = 0; i < videoItems.length(); i++) {
                JSONObject idObj = videoItems.getJSONObject(i).getJSONObject("id");
                if (idObj.has("videoId")) {
                    if (videoIds.length() > 0) videoIds.append(",");
                    videoIds.append(idObj.getString("videoId"));
                }
            }

            if (videoIds.length() > 0) {
                String videoStatsUrl = "https://youtube.googleapis.com/youtube/v3/videos?part=statistics&id=" + videoIds;
                String videoStatsResponse = restTemplate.exchange(videoStatsUrl, HttpMethod.GET, entity, String.class).getBody();
                JSONObject videoStatsJson = new JSONObject(videoStatsResponse);
                JSONArray statsArray = videoStatsJson.getJSONArray("items");

                long totalLikes = 0;
                long totalComments = 0;
                for (int i = 0; i < statsArray.length(); i++) {
                    JSONObject videoStats = statsArray.getJSONObject(i).getJSONObject("statistics");
                    if (videoStats.has("likeCount")) totalLikes += videoStats.getLong("likeCount");
                    if (videoStats.has("commentCount")) totalComments += videoStats.getLong("commentCount");
                }

                if (statsArray.length() > 0) {
                    avgLikes = (double) totalLikes / statsArray.length();
                    avgComments = (double) totalComments / statsArray.length();
                }
            }
        }

        JSONObject result = new JSONObject();
        result.put("name", channelName);
        result.put("handle", channelHandle);
        result.put("subs", subs);
        result.put("videoCount", videoCount);
        result.put("totalViews", totalViews);
        result.put("avgLikes", String.format("%.2f", avgLikes));
        result.put("avgComments", String.format("%.2f", avgComments));

        return result;
    }

    private final YoutubeChannelMapper youtubeChannelMapper;

    public YouTubeService(YoutubeChannelMapper youtubeChannelMapper) {
        this.youtubeChannelMapper = youtubeChannelMapper;
    }

    public List<YoutubedashboardDto> getChannelByMemberId(int memberId) {

        // DB 조회
        List<YoutubedashboardDto> dbList2 =
                youtubeChannelMapper.findByMemberId(memberId);

        // 디버깅
        System.out.println("Instagram DB 조회 결과: " + dbList2);

        // InstagramdashboardDto → InstagramChannelDto 변환
        return dbList2.stream()
                .map(d -> new YoutubedashboardDto(
                        d.getChanelName(),          // name
                        d.getChanelName(),          // handle (임시로 name 사용)
                        d.getPlatfromSubscribe(),   // subs
                        d.getChanelCount(),         // views
                        d.getChanelFollower()       // videos
                ))
                .collect(Collectors.toList());
    }

}
