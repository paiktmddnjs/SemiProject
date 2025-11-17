package com.example.demo.Service;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.ResponseEntity;
import org.json.JSONArray;
import org.json.JSONObject;

@Service
public class YouTubeService {

    @Value("${youtube.api.key}")
    private String apiKey;

    @Value("${youtube.channel.id}")
    private String channelId;

    public JSONObject getChannelStats() {
        String url = "https://www.googleapis.com/youtube/v3/channels"
                + "?part=statistics"
                + "&id=" + channelId
                + "&key=" + apiKey;

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);

        JSONObject json = new JSONObject(response.getBody());
        JSONArray items = json.getJSONArray("items");
        JSONObject statistics = items.getJSONObject(0).getJSONObject("statistics");

        return statistics;
    }
}


