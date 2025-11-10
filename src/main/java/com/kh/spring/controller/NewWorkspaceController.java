/*
package com.kh.spring.controller;

import com.kh.spring.model.dao.ChannelDAO; // (새로 만들 DAO)
import com.kh.spring.model.vo.ChannelVo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/workspace/new")
public class NewWorkspaceController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. DAO를 통해 DB에서 채널 목록을 가져옵니다.
        ChannelDAO channelDAO = new ChannelDAO();
        List<ChannelVo> channelList = channelDAO.getAllChannels(); // 모든 채널을 가져오는 메소드

        // 2. 조회된 채널 목록을 request attribute에 저장합니다.
        request.setAttribute("channels", channelList);

        // 3. 채널 목록 데이터를 포함하여 new_workspace.jsp로 포워딩합니다.
        // new_workspace.jsp가 모달 창의 일부이므로, 해당 모달을 여는 메인 페이지로 포워딩해야 할 수 있습니다.
        // 여기서는 직접 JSP를 렌더링한다고 가정합니다.
        request.getRequestDispatcher("/WEB-INF/views/new_workspace.jsp").forward(request, response);
    }
}
*/
