package com.kh.spring.Controller;

import com.kh.spring.dto.ChzzkChanelDto;
import com.kh.spring.mapper.ChzzkChanelMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {
    
    private static final Logger log = LoggerFactory.getLogger(DashboardController.class);
    
    @Autowired
    private ChzzkChanelMapper chzzkChanelMapper;
    
    /**
     * 대시보드 메인 페이지
     */
    @GetMapping
    public String dashboard(Model model) {
        try {
            // 치지직 채널 목록 조회 (활성 채널만)
            List<ChzzkChanelDto> chzzkChanels = chzzkChanelMapper.findByPlatformTypeAndStatus("CHZZK", "Y");
            model.addAttribute("chzzkChanels", chzzkChanels);
            
            // YouTube 채널 목록 조회 (활성 채널만)
            List<ChzzkChanelDto> youtubeChanels = chzzkChanelMapper.findByPlatformTypeAndStatus("YOUTUBE", "Y");
            model.addAttribute("youtubeChanels", youtubeChanels);
            
            // Instagram 채널 목록 조회 (활성 채널만)
            List<ChzzkChanelDto> instagramChanels = chzzkChanelMapper.findByPlatformTypeAndStatus("INSTAGRAM", "Y");
            model.addAttribute("instagramChanels", instagramChanels);
            
            // 전체 활성 채널 목록 (모든 플랫폼)
            List<ChzzkChanelDto> allChanels = chzzkChanelMapper.findAll();
            // 활성 채널만 필터링
            allChanels = allChanels.stream()
                .filter(chanel -> "Y".equals(chanel.getChanelStatus()))
                .collect(Collectors.toList());
            model.addAttribute("allChanels", allChanels);
            
            log.info("대시보드 데이터 로드 완료 - 전체: {}개, 치지직: {}개, YouTube: {}개, Instagram: {}개", 
                allChanels.size(), chzzkChanels.size(), youtubeChanels.size(), instagramChanels.size());
            
            return "dashboard";
            
        } catch (Exception e) {
            log.error("대시보드 데이터 로드 실패", e);
            model.addAttribute("error", "대시보드 데이터를 불러오는 중 오류가 발생했습니다.");
            return "error";
        }
    }
    
    /**
     * 채널 상세 페이지
     */
    @GetMapping("/channel/{chanelId}")
    public String channelDetail(@PathVariable Long chanelId, Model model) {
        try {
            ChzzkChanelDto chanel = chzzkChanelMapper.findById(chanelId);
            if (chanel == null) {
                throw new RuntimeException("채널을 찾을 수 없습니다.");
            }
            
            model.addAttribute("chanel", chanel);
            
            return "channel-detail";
            
        } catch (Exception e) {
            log.error("채널 상세 정보 로드 실패", e);
            model.addAttribute("error", "채널 정보를 불러오는 중 오류가 발생했습니다.");
            return "error";
        }
    }
    
    /**
     * 채널 삭제 (status를 'N'으로 변경)
     */
    @PostMapping("/channel/{chanelId}/delete")
    @ResponseBody
    public Map<String, Object> deleteChannel(@PathVariable Long chanelId) {
        Map<String, Object> response = new HashMap<>();
        try {
            int result = chzzkChanelMapper.updateStatus(chanelId, "N");
            if (result > 0) {
                response.put("success", true);
                response.put("message", "채널이 삭제되었습니다.");
                log.info("채널 삭제 완료: {}", chanelId);
            } else {
                response.put("success", false);
                response.put("message", "채널을 찾을 수 없습니다.");
                log.warn("채널 삭제 실패: 채널을 찾을 수 없음 - {}", chanelId);
            }
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "채널 삭제 중 오류가 발생했습니다.");
            log.error("채널 삭제 중 오류 발생", e);
        }
        return response;
    }
}


