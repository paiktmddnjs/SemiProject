package com.kh.spring.Controller;

import com.kh.spring.service.RequestService;
import com.kh.spring.model.vo.Member;
import com.kh.spring.vo.RequestVo;
import jakarta.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/request")
public class RequestController {

    private static final Logger log = LoggerFactory.getLogger(RequestController.class);

    @Autowired
    private RequestService requestService;

    @GetMapping("")
    public String getRequests(HttpSession session, Model model) {
        Member loginUser = (Member) session.getAttribute("loginMember");
        if (loginUser == null) {
            return "redirect:/loginForm.me";
        }

        List<RequestVo> requests = requestService.getPendingRequests(loginUser.getMemberId());
        model.addAttribute("requests", requests);
        return "requests";
    }

    @PostMapping("/accept")
    public String acceptRequest(@RequestParam("requestId") int requestId, HttpSession session, RedirectAttributes redirectAttributes) {
        log.info("--- 초대 수락 요청 수신 ---");
        log.info("요청 ID: {}", requestId);

        Member loginUser = (Member) session.getAttribute("loginMember");
        if (loginUser == null) {
            log.warn("로그인되지 않은 사용자의 접근입니다.");
            return "redirect:/loginForm.me";
        }
        log.info("요청 사용자 ID: {}", loginUser.getMemberId());

        try {
            requestService.acceptRequest(requestId, loginUser.getMemberId());
            redirectAttributes.addFlashAttribute("successMessage", "워크스페이스에 참여했습니다.");
            log.info("초대 수락 성공. requestId: {}", requestId);
        } catch (Exception e) {
            log.error("초대 수락 중 오류 발생. requestId: {}", requestId, e);
            redirectAttributes.addFlashAttribute("errorMessage", "요청 처리 중 오류가 발생했습니다.");
        }
        return "redirect:/request";
    }

    @PostMapping("/reject")
    public String rejectRequest(@RequestParam("requestId") int requestId, HttpSession session, RedirectAttributes redirectAttributes) {
        Member loginUser = (Member) session.getAttribute("loginMember");
        if (loginUser == null) {
            return "redirect:/loginForm.me";
        }

        try {
            requestService.rejectRequest(requestId, loginUser.getMemberId());
        } catch (Exception e) {
            log.error("초대 거절 중 오류 발생", e);
            redirectAttributes.addFlashAttribute("errorMessage", "요청 처리 중 오류가 발생했습니다.");
        }
        return "redirect:/request";
    }

    @GetMapping("/invite")
    public String showInviteForm(@RequestParam("workspaceId") int workspaceId, Model model) {
        model.addAttribute("workspaceId", workspaceId);
        return "invite_member"; // /WEB-INF/views/invite_member.jsp
    }

    @PostMapping("/invite")
    public String sendInvite(@RequestParam("workspaceId") int workspaceId,
                             @RequestParam("email") String email,
                             HttpSession session,
                             RedirectAttributes redirectAttributes) {
        Member loginUser = (Member) session.getAttribute("loginMember");
        if (loginUser == null) {
            return "redirect:/loginForm.me";
        }

        try {
            requestService.sendInvite(workspaceId, loginUser.getMemberId(), email);
            // addFlashAttribute 대신 addAttribute 사용
            redirectAttributes.addAttribute("successMessage", "초대를 보냈습니다.");
            log.info("RedirectAttributes에 'successMessage' 추가: 초대를 보냈습니다.");
        } catch (IllegalStateException e) {
            log.warn("초대 보내기 실패: {}", e.getMessage());
            // addFlashAttribute 대신 addAttribute 사용
            redirectAttributes.addAttribute("errorMessage", e.getMessage());
            log.info("RedirectAttributes에 'errorMessage' 추가: {}", e.getMessage());
        } catch (Exception e) {
            log.error("초대 보내기 중 오류 발생", e);
            // addFlashAttribute 대신 addAttribute 사용
            redirectAttributes.addAttribute("errorMessage", "초대 중 오류가 발생했습니다.");
            log.info("RedirectAttributes에 'errorMessage' 추가: 초대 중 오류가 발생했습니다.");
        }

        return "redirect:/project?workspaceId=" + workspaceId;
    }
}
