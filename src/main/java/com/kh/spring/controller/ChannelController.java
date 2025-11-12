package com.kh.spring.controller;

import com.kh.spring.model.dao.ChannelDAO;
import com.kh.spring.model.vo.ChannelVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class ChannelController {

    private static final Logger log = LoggerFactory.getLogger(ChannelController.class);

    @Autowired
    private ChannelDAO channelDAO;

    @GetMapping("/channels")
    public String getChannelList(Model model) {
        log.info("GET /channels 요청 확인");

        try {
            List<ChannelVo> channelList = channelDAO.getAllChannels();

            // --- 여기가 가장 중요합니다! ---
            // DAO가 반환한 리스트의 크기를 로그로 출력합니다.
            log.info("DAO가 반환한 채널 수: {}", channelList.size());
            // --------------------------------

            model.addAttribute("channels", channelList);
            return "channel_list";

        } catch (Exception e) {
            log.error("채널 목록 조회 중 예외 발생", e);
            throw e;
        }
    }
}