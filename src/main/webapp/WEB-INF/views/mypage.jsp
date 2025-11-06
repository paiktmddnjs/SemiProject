<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- ====================================================== --%>
<%-- [임시] 마이페이지 대시보드용 더미 데이터 (스크립틀릿) --%>
<%
    // (더미 데이터는 제공해주신 내용과 동일)
    java.util.Map<String, String> profileStats = new java.util.HashMap<>();
    profileStats.put("totalRevenue", "6,500만원");
    profileStats.put("avgEngagement", "7.5%");
    profileStats.put("totalViews", "159K");
    profileStats.put("sponsorshipCount", "3건");
    pageContext.setAttribute("profileStats", profileStats);

    java.util.Map<String, String> projectStats = new java.util.HashMap<>();
    projectStats.put("remainingSchedules", "4");
    projectStats.put("activeProjects", "8");
    pageContext.setAttribute("projectStats", projectStats);

    java.util.List<java.util.Map<String, String>> channelList = new java.util.ArrayList<>();

    java.util.Map<String, String> c1 = new java.util.HashMap<>();
    c1.put("platformIcon", "icon_youtube");
    c1.put("platformName", "YouTube");
    c1.put("channelName", "여름 장이란 애당초에 글러서");
    c1.put("categoryClass", "badge-review");
    c1.put("categoryName", "리뷰");
    c1.put("lastUploadDate", "2025-10-25");
    c1.put("totalViews", "15420");
    c1.put("totalLikes", "892");
    c1.put("totalComments", "156");
    c1.put("statusClass", "status-published");
    c1.put("statusName", "게시됨");
    channelList.add(c1);

    java.util.Map<String, String> c2 = new java.util.HashMap<>();
    c2.put("platformIcon", "icon_chzzk");
    c2.put("platformName", "치지직");
    c2.put("channelName", "장판은 벌써 쓸쓸하고");
    c2.put("categoryClass", "badge-entertainment");
    c2.put("categoryName", "엔터테인먼트");
    c2.put("lastUploadDate", "2025-10-23");
    c2.put("totalViews", "45200");
    c2.put("totalLikes", "3420");
    c2.put("totalComments", "234");
    c2.put("statusClass", "status-published");
    c2.put("statusName", "게시됨");
    channelList.add(c2);

    java.util.Map<String, String> c3 = new java.util.HashMap<>();
    c3.put("platformIcon", "icon_youtube");
    c3.put("platformName", "YouTube");
    c3.put("channelName", "해는 아직 중천에 있건만");
    c3.put("categoryClass", "badge-communication");
    c3.put("categoryName", "소통");
    c3.put("lastUploadDate", "2025-10-22");
    c3.put("totalViews", "12890");
    c3.put("totalLikes", "756");
    c3.put("totalComments", "198");
    c3.put("statusClass", "status-private");
    c3.put("statusName", "비공개");
    channelList.add(c3);

    java.util.Map<String, String> c4 = new java.util.HashMap<>();
    c4.put("platformIcon", "icon_instagram");
    c4.put("platformName", "Instagram");
    c4.put("channelName", "더운 햇발이 벌여놓은 전 휘장 밑으로");
    c4.put("categoryClass", "badge-tutorial");
    c4.put("categoryName", "튜토리얼");
    c4.put("lastUploadDate", "2025-10-21");
    c4.put("totalViews", "9870");
    c4.put("totalLikes", "1150");
    c4.put("totalComments", "92");
    c4.put("statusClass", "status-published");
    c4.put("statusName", "게시됨");
    channelList.add(c4);

    pageContext.setAttribute("channelList", channelList);
%>
<%-- 더미 데이터 끝 --%>
<%-- ====================================================== --%>

<div class="dashboard-container">

    <header class="dashboard-header">
        <div class="card profile-card">
            <div class="profile-main">
                <div class="profile-image-placeholder">
                    <%-- <img src="path/to/profile.jpg" alt="프로필 이미지"> --%>
                </div>
                <div class="profile-divider"></div>
                <div class="profile-info">
                    <h2>환영합니다, 크리에이터</h2>
                    <p class="email">creator@example.com</p>
                    <p class="user-info">
                        사용자 : 크리에이터<br/>
                        가입일 : 2025. 10. 30<br/>
                        최근 수정 날짜 : 2025.10.30
                    </p>
                </div>

                <%-- [수정] <a> 태그에서 <button> 태그로 변경 (팝업 호출용) --%>
                <button type="button" id="showPasswordModalBtn" class="btn btn-secondary">개인 정보 수정</button>

            </div>
            <div class="profile-stats">
                <%-- ... (프로필 스탯 4개, 내용은 동일) ... --%>
                <div class="stat-box">
                    <div class="stat-header">
                        <span class="stat-title">총 수익</span>
                        <span class="icon-wrapper">
                            <jsp:include page="/WEB-INF/views/common/icons/icon_money.jsp" />
                        </span>
                    </div>
                    <div class="stat-value">${profileStats.totalRevenue}</div>
                </div>
                <div class="stat-box">
                    <div class="stat-header">
                        <span class="stat-title">평균 참여율</span>
                        <span class="icon-wrapper">
                            <jsp:include page="/WEB-INF/views/common/icons/icon_like.jsp" />
                        </span>
                    </div>
                    <div class="stat-value">${profileStats.avgEngagement}</div>
                </div>
                <div class="stat-box">
                    <div class="stat-header">
                        <span class="stat-title">종합 조회수</span>
                        <span class="icon-wrapper">
                            <jsp:include page="/WEB-INF/views/common/icons/icon_user.jsp" />
                        </span>
                    </div>
                    <div class="stat-value">${profileStats.totalViews}</div>
                </div>
                <div class="stat-box">
                    <div class="stat-header">
                        <span class="stat-title">진행한 협찬 수</span>
                        <span class="icon-wrapper">
                            <jsp:include page="/WEB-INF/views/common/icons/icon_sponsorships.jsp" />
                        </span>
                    </div>
                    <div class="stat-value">${profileStats.sponsorshipCount}</div>
                </div>
            </div>
        </div>

        <div class="card project-card">
            <%-- ... (프로젝트/일정 카드, 내용은 동일) ... --%>
            <div class="project-column">
                <h3 class="project-title">남은 일정</h3>
                <div class="project-count">
                    <span class="project-number">${projectStats.remainingSchedules}</span>
                    <span class="project-unit">개</span>
                </div>
            </div>
            <div class="project-divider"></div>
            <div class="project-column">
                <h3 class="project-title">진행 중인 프로젝트</h3>
                <div class="project-count">
                    <span class="project-number">${projectStats.activeProjects}</span>
                    <span class="project-unit">개</span>
                </div>
            </div>
        </div>
    </header>

    <main class="dashboard-content">
        <%-- ... (연동 중인 채널 테이블, 내용은 동일) ... --%>
        <div class="card channels-card">
            <div class="card-header">
                <h3 class="card-title">연동 중인 채널</h3>
                <button class="btn btn-primary">
                    <span class="icon-wrapper">
                        <jsp:include page="/WEB-INF/views/common/icons/icon_plus.jsp" />
                    </span>
                    새로운 계정 연동
                </button>
            </div>
            <div class="table-container">
                <table class="channels-table">
                    <thead>
                    <tr>
                        <th>플랫폼</th>
                        <th>채널명</th>
                        <th>카테고리</th>
                        <th>최근 업로드일</th>
                        <th>총 조회수</th>
                        <th>총 좋아요</th>
                        <th>총 댓글</th>
                        <th>상태</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="channel" items="${channelList}">
                        <tr>
                            <td>
                                    <span class="icon-wrapper platform-icon">
                                        <jsp:include page="/WEB-INF/views/common/icons/${channel.platformIcon}.jsp" />
                                    </span>
                                    ${channel.platformName}
                            </td>
                            <td>${channel.channelName}</td>
                            <td>
                                <span class="badge ${channel.categoryClass}">${channel.categoryName}</span>
                            </td>
                            <td>${channel.lastUploadDate}</td>
                            <td>
                                    <span class="icon-wrapper stat-icon">
                                        <jsp:include page="/WEB-INF/views/common/icons/icon_view.jsp" />
                                    </span>
                                <fmt:formatNumber value="${channel.totalViews}" pattern="#,##0" />
                            </td>
                            <td>
                                    <span class="icon-wrapper stat-icon">
                                        <jsp:include page="/WEB-INF/views/common/icons/icon_like.jsp" />
                                    </span>
                                <fmt:formatNumber value="${channel.totalLikes}" pattern="#,##0" />
                            </td>
                            <td>
                                    <span class="icon-wrapper stat-icon">
                                        <jsp:include page="/WEB-INF/views/common/icons/icon_comments.jsp" />
                                    </span>
                                <fmt:formatNumber value="${channel.totalComments}" pattern="#,##0" />
                            </td>
                            <td>
                                <span class="status-badge ${channel.statusClass}">${channel.statusName}</span>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</div> <%-- .dashboard-container 끝 --%>


<%-- [추가] 비밀번호 확인 팝업(모달) 코드 --%>
<div class="modal-overlay hidden" id="passwordModalOverlay">
    <div class="modal-container password-modal">

        <%-- 닫기 버튼 (X) --%>
        <%-- [수정] icon_plus.jsp -> icon_close.jsp 로 변경 --%>
        <button type="button" class="modal-close-btn" id="closePasswordModalBtn">
            <jsp:include page="/WEB-INF/views/common/icons/icon_plus.jsp" />
        </button>

        <h3 class="modal-title">비밀번호를 입력하세요</h3>

        <%--
          [!] 나중에 컨트롤러 연결 시 <form> 태그에 action과 method를 추가하세요.
          (예: <form action="${contextPath}/mypage/checkPw" method="post" class="modal-form">)
        --%>
        <form class="modal-form" id="passwordCheckForm">
            <div class="form-group">
                <input type="password" id="passwordCheck" name="passwordCheck" placeholder="**** **" required>
            </div>
            <button type="submit" class="btn btn-submit">저장</button>
        </form>
    </div>
</div>


<%-- [추가] 팝업(모달) 제어 스크립트 --%>
<script>
    // [수정] DOMContentLoaded 이벤트를 다시 추가합니다.
    // JSP 조각(fragment)으로 로드될 때, HTML 요소가 준비되기 전에
    // 스크립트가 실행되는 것을 방지합니다.
    document.addEventListener("DOMContentLoaded", function() {

        // 1. 필요한 요소 선택
        const showModalBtn = document.getElementById("showPasswordModalBtn");
        const closeModalBtn = document.getElementById("closePasswordModalBtn");
        const modalOverlay = document.getElementById("passwordModalOverlay");
        const passwordForm = document.getElementById("passwordCheckForm");

        // [중요] null 체크
        // 요소가 없는 페이지에서 스크립트 오류가 나는 것을 방지합니다.
        if (!showModalBtn || !modalOverlay) {
            // 이 페이지에 해당 모달 버튼이나 오버레이가 없으면
            // 아무 작업도 하지 않고 스크립트를 종료합니다.
            // console.warn("마이페이지 모달 요소를 찾을 수 없습니다.");
            return;
        }

        // 2. '개인 정보 수정' 버튼 클릭 시
        if (showModalBtn) {
            showModalBtn.addEventListener("click", function() {
                modalOverlay.classList.remove("hidden");
                document.getElementById("passwordCheck").focus();
            });
        }

        // 3. '닫기(X)' 버튼 클릭 시
        if (closeModalBtn) {
            closeModalBtn.addEventListener("click", function() {
                modalOverlay.classList.add("hidden");
            });
        }

        // 4. 팝업 바깥 (검은 배경) 클릭 시
        if (modalOverlay) {
            modalOverlay.addEventListener("click", function(event) {
                if (event.target === modalOverlay) {
                    modalOverlay.classList.add("hidden");
                }
            });
        }

        // 5. '저장' 버튼(폼 제출) 클릭 시
        if (passwordForm) {
            passwordForm.addEventListener("submit", function(event) {
                event.preventDefault();
                alert("비밀번호 확인 완료! (임시) \n'profileEdit.jsp' 페이지로 이동합니다.");
                modalOverlay.classList.add("hidden");
            });
        }

    }); // <-- DOMContentLoaded 래퍼 닫기
</script>