package com.kh.spring.service;


import com.kh.spring.dto.InstagramChannelDto;
import com.kh.spring.dto.InstagramdashboardDto;
import com.kh.spring.mapper.InstagramChannelMapper;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class InstagramService {

    @Value("${instagram.access-token}")
    private String accessToken;

    @Value("${instagram.api-url}")
    private String apiUrl;

    private final RestTemplate restTemplate = new RestTemplate();
  private final InstagramChannelMapper instagramChannelMapper;

        public InstagramService(InstagramChannelMapper instagramChannelMapper) {
            this.instagramChannelMapper = instagramChannelMapper;
        }

    public List<InstagramdashboardDto> getInstagramAccounts(int memberId) {

        // DB 조회
        List<InstagramdashboardDto> dbList =
                instagramChannelMapper.findByPlatformTypeAndStatusInstagram(memberId);

        // 디버깅
        System.out.println("Instagram DB 조회 결과: " + dbList);

        // InstagramdashboardDto → InstagramChannelDto 변환
        return dbList.stream()
                .map(d -> new InstagramdashboardDto(
                        d.getChanelName(),                     // name
                        d.getChanelName(),                     // handle (일단 동일하게)
                        parseLongSafe(d.getChanelCount()),  // subs
                        0L,
                        parseIntSafe(d.getChanelFollower())        // posts
                ))
                .collect(Collectors.toList());
    }

    private long parseLongSafe(String v) {
        try { return Long.parseLong(v); }
        catch (Exception e) { return 0L; }
    }

    private int parseIntSafe(String v) {
        try { return Integer.parseInt(v); }
        catch (Exception e) { return 0; }
    }



    public InstagramChannelDto getAccountStats() {
        // 하드코딩된 토큰 사용
        String url = apiUrl + "/me?fields=id,username,account_type,media_count,followers_count&access_token=" + accessToken;

        JSONObject json = new JSONObject(restTemplate.getForObject(url, String.class));

        return new InstagramChannelDto(
                json.optString("username"),
                json.optString("username"),          // handle이 없으면 username 사용
                json.optLong("followers_count", 0),
                0,                                   // 조회수는 Instagram API에서 바로 못 가져옴
                json.optInt("media_count", 0)
        );
    }
}






