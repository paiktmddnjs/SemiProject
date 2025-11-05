<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회사 및 담당자 관리 시스템</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/contractList.css">
</head>
<body>
<div class="container">
    <div class="header">
        <p class="header-subtitle">브랜드 협찬 및 광고 계약 현황을 관리하세요</p>
        <div class="header-buttons">
            <button type="button" id="addCompanyBtn" class="btn-primary">
                <jsp:include page="/WEB-INF/views/common/icons/icon_plus.jsp"/>
                새 회사 추가
            </button>
            <button type="button" id="addContractBtn" class="btn-primary">
                <jsp:include page="/WEB-INF/views/common/icons/icon_plus.jsp"/>
                새 계약 추가
            </button>
        </div>
    </div>

    <div class="stats-grid">
        <div class="stat-card">
            <div class="stat-card-header">
                <span class="stat-card-title">활성 계약</span>
                <jsp:include page="/WEB-INF/views/common/icons/icon_document.jsp" />
            </div>
            <div class="stat-card-content">
                <div class="stat-value">${contractSummary.activeContracts}<span class="unit">건</span></div>
                <div class="stat-description">현재 진행중인 계약</div>
            </div>
        </div>
        <div class="stat-card">
            <div class="stat-card-header">
                <span class="stat-card-title">총 계약금액</span>
                <jsp:include page="/WEB-INF/views/common/icons/icon_money.jsp" />
            </div>
            <div class="stat-card-content">
                <div class="stat-value">
                    <fmt:formatNumber value="${contractSummary.totalAmount}" pattern="#,##0" />
                    <span class="unit">원</span>
                </div>
                <div class="stat-description">모든 계약의 총액</div>
            </div>
        </div>
        <div class="stat-card">
            <div class="stat-card-header">
                <span class="stat-card-title">이번 달 계약</span>
                <jsp:include page="/WEB-INF/views/common/icons/icon_calendar.jsp" />
            </div>
            <div class="stat-card-content">
                <div class="stat-value">${contractSummary.newContractsThisMonth}<span class="unit">건</span></div>
                <div class="stat-description">
                    <span class="stat-highlight">+${contractSummary.newContractsGrowthRate}%</span> 전월 대비
                </div>
            </div>
        </div>
        <div class="stat-card">
            <div class="stat-card-header">
                <span class="stat-card-title">정산 대기</span>
                <jsp:include page="/WEB-INF/views/common/icons/icon_clock.jsp" />
            </div>
            <div class="stat-card-content">
                <div class="stat-value">${contractSummary.pendingPayments}<span class="unit">건</span></div>
                <div class="stat-description">
                    '정산 대기' 상태인 계약
                </div>
            </div>
        </div>
    </div>

    <%-- ====================================================== --%>
    <%-- [임시] 더미 데이터 생성 (DB 연결 전 테스트용) --%>
    <%
        java.util.List<java.util.Map<String, String>> dummyList = new java.util.ArrayList<>();

        java.util.Map<String, String> item1 = new java.util.HashMap<>();
        item1.put("contractNo", "1");
        item1.put("contractName", "브랜드 A - 뷰티 제품");
        item1.put("amount", "2000000");
        item1.put("startDate", "2025-10-15");
        item1.put("endDate", "2025-11-15");
        item1.put("status", "active"); // '진행중' 배지
        item1.put("deliverables", "영상 1개, 포스트 2개");
        item1.put("paymentStatusName", "계약서 검토 중"); // 간략 보기에 표시될 이름
        item1.put("paymentStatus", "reviewing"); // select 박스 선택값
        item1.put("companyEmail", "manager@branda.com");
        item1.put("companyName", "(주) KH");
        item1.put("companyContact", "02-7777-8888");
        item1.put("managerName", "백승원");
        item1.put("businessLicenseNumber", "125158-121548");
        item1.put("managerContact", "010-1234-1178");
        item1.put("ceoContact", "010-4845-4812");
        item1.put("memo", "성실히 임할 것\n전화 금지\n쇼츠 금지\n위약금 있음\n모니터링 함\n여기까지");
        dummyList.add(item1);

        java.util.Map<String, String> item2 = new java.util.HashMap<>();
        item2.put("contractNo", "2");
        item2.put("contractName", "브랜드 B - 패션 의류");
        item2.put("amount", "1500000");
        item2.put("startDate", "2025-10-20");
        item2.put("endDate", "2025-11-20");
        item2.put("status", "pending");
        item2.put("deliverables", "릴스 3개");
        item2.put("paymentStatusName", "정산 대기");
        item2.put("paymentStatus", "pending");
        item2.put("companyEmail", "manager@brandb.com");
        item2.put("companyName", "(주) 패션월드");
        item2.put("companyContact", "02-1111-2222");
        item2.put("managerName", "김철수");
        item2.put("businessLicenseNumber", "111-22-33333");
        item2.put("managerContact", "010-2222-3333");
        item2.put("ceoContact", "010-4444-5555");
        item2.put("memo", "협의된 내용 없음.");
        dummyList.add(item2);

        pageContext.setAttribute("list", dummyList);
    %>
    <%-- 더미 데이터 끝 --%>
    <%-- ====================================================== --%>

    <div class="contract-section">
        <div class="section-header">
            <h2 class="section-title">
                전체 회사 현황
            </h2>
            <p class="section-subtitle">모든 회사 목록 및 담당자 정보</p>
        </div>

        <div class="contract-list" id="companyList">

            <c:forEach var="c" items="${list}">
                <div class="contract-card">

                    <div class="contract-header">
                        <div class="contract-info">
                            <h3 class="contract-brand">${c.contractName}</h3>
                            <div class="contract-meta">
                                <div class="meta-item">
                                    <svg class="meta-icon" ...>...</svg>
                                    <span><fmt:formatNumber value="${c.amount}" pattern="#,##0" />원</span>
                                </div>
                                <div class="meta-item">
                                    <svg class="meta-icon" ...>...</svg>
                                    <span>${c.startDate} ~ ${c.endDate}</span>
                                </div>
                            </div>
                        </div>
                        <c:if test="${c.status == 'active'}">
                            <span class="status-badge status-active">진행중</span>
                        </c:if>
                    </div>
                    <div class="contract-details">
                        <div class="detail-item">
                            <span class="detail-label">제공 콘텐츠</span>
                            <span class="detail-value-large">${c.deliverables}</span>
                        </div>
                        <div class="detail-item">
                            <span class="detail-label">정산 상태 (간략)</span>
                            <span class="detail-value-large">${c.paymentStatusName}</span>
                        </div>
                    </div>
                    <div class="contract-footer">
                        <button type="button" class="btn-outline btn-toggle-detail"
                                data-target-id="detail-${c.contractNo}">
                            상세보기
                        </button>
                    </div>

                    <div class="contract-detail-expanded" id="detail-${c.contractNo}">
                        <div class="detail-content-grid">

                            <div class="detail-left-column">
                                <div class="detail-item">
                                    <span class="detail-label">회사 이메일</span>
                                    <span class="detail-value-medium">${c.companyEmail}</span>
                                </div>

                                <div class="detail-company-grid">
                                    <div class="detail-item">
                                        <span class="detail-label">계약 회사</span>
                                        <span class="detail-value-medium">${c.companyName}</span>
                                    </div>
                                    <div class="detail-item">
                                        <span class="detail-label">회사 연락처</span>
                                        <span class="detail-value-medium">${c.companyContact}</span>
                                    </div>
                                    <div class="detail-item">
                                        <span class="detail-label">계약 담당자</span>
                                        <span class="detail-value-medium">${c.managerName}</span>
                                    </div>
                                    <div class="detail-item">
                                        <span class="detail-label">회사 사업자 번호</span>
                                        <span class="detail-value-medium">${c.businessLicenseNumber}</span>
                                    </div>
                                    <div class="detail-item">
                                        <span class="detail-label">담당자 연락처</span>
                                        <span class="detail-value-medium">${c.managerContact}</span>
                                    </div>
                                    <div class="detail-item">
                                        <span class="detail-label">회사 대표 연락처</span>
                                        <span class="detail-value-medium">${c.ceoContact}</span>
                                    </div>
                                </div>
                            </div>

                            <div class="detail-right-column">
                                <div class="detail-item">
                                    <span class="detail-label">정산 상태 변경</span>
                                    <select name="paymentStatus" class="payment-status-select">
                                        <option value="reviewing" ${c.paymentStatus == 'reviewing' ? 'selected' : ''}>계약서 검토 중</option>
                                        <option value="pending" ${c.paymentStatus == 'pending' ? 'selected' : ''}>정산 대기</option>
                                        <option value="completed" ${c.paymentStatus == 'completed' ? 'selected' : ''}>정산 완료</option>
                                    </select>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">계약 상세</span>
                                    <div class="detail-memo-box">
                                            ${c.memo}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </c:forEach>

            <c:if test="${empty list}">
                <div class="empty-list-message">
                    표시할 계약이 없습니다.
                </div>
            </c:if>
        </div>

        <div class="pagination">
            <c:url var="pageUrl" value="${pageContext.request.contextPath}/list.co">
            </c:url>

            <c:forEach var="p" begin="1" end="${pi.maxPage}">
                <a href="${pageUrl}?cpage=${p}">
                    <div class="pagination-dot ${p == pi.currentPage ? 'active' : ''}"></div>
                </a>
            </c:forEach>
        </div>
    </div>
</div>

<div id="addContractModal" class="modal-backdrop">
    <div class="modal-content">
        <div class="modal-header">
            <h3>새 계약 추가하기</h3>
            <button type="button" class="close-btn" id="closeContractModalBtn">&times;</button>
        </div>
        <div class="modal-body">
            <form action="saveContract.do" method="post">
                <div class="form-group">
                    <label for="contractName">계약 명칭 *</label>
                    <input type="text" id="contractName" name="contractName" placeholder="계약 명칭을 입력하세요">
                </div>
                <div class="form-group">
                    <label for="contractAmount">계약 금액</label>
                    <input type="number" id="contractAmount" name="contractAmount" placeholder="계약 금액을 입력하세요">
                </div>
                <div class="form-group">
                    <label for="companyId">계약 확정</label>
                    <select id="companyId" name="companyId">
                        <option value="">계약 회사를 선택하세요</option>
                        <option value="1">A회사</option>
                        <option value="2">B회사</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="contractPeriod">계약 기간 *</label>
                    <div class="date-range">
                        <input type="date" id="startDate" name="startDate">
                        <span>~</span>
                        <input type="date" id="endDate" name="endDate">
                    </div>
                </div>
                <div class="form-group">
                    <label for="contractStatus">계약 상태</label>
                    <select id="contractStatus" name="contractStatus">
                        <option value="pending">대기/협상</option>
                        <option value="active">진행중</option>
                        <option value="completed">완료</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="memo">메모</label>
                    <textarea id="memo" name="memo" placeholder="메모를 입력하세요"></textarea>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn-cancel" id="cancelContractModalBtn">취소</button>
                    <button type="submit" class="btn-submit">저장</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div id="addCompanyModal" class="modal-backdrop">
    <div class="modal-content">
        <div class="modal-header">
            <h3>새 회사 추가하기</h3>
            <button type="button" class="close-btn" id="closeCompanyModalBtn">&times;</button>
        </div>
        <p class="modal-subtitle">새 회사 정보를 추가하세요</p>
        <div class="modal-body">
            <form action="saveCompany.do" method="post">
                <div class="form-group">
                    <input type="text" id="companyName" name="companyName" placeholder="회사 이름을 입력하세요" required>
                </div>
                <div class="form-group">
                    <input type="tel" id="companyCall" name="companyCall" placeholder="회사 연락처를 입력하세요">
                </div>
                <div class="form-group">
                    <input type="text" id="companyManager" name="companyManager" placeholder="계약 담당자 이름을 입력하세요">
                </div>
                <div class="form-group">
                    <input type="tel" id="companyManagerCall" name="companyManagerCall" placeholder="계약 담당자 연락처를 입력하세요">
                </div>
                <div class="form-group">
                    <input type="tel" id="companyBusinessCall" name="companyBusinessCall" placeholder="사업자 연락처를 입력하세요">
                </div>
                <div class="form-group">
                    <input type="tel" id="companyRepresentaiveCall" name="companyRepresentaiveCall" placeholder="회사 대표 연락처를 입력해주세요">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn-cancel" id="cancelCompanyModalBtn">취소</button>
                    <button type="submit" class="btn-submit">회사 추가하기</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    const openContractBtn = document.getElementById("addContractBtn");
    const contractModal = document.getElementById("addContractModal");
    const closeContractBtn = document.getElementById("closeContractModalBtn");
    const cancelContractBtn = document.getElementById("cancelContractModalBtn");

    openContractBtn.onclick = function() {
        contractModal.classList.add("active");
    }
    closeContractBtn.onclick = function() {
        contractModal.classList.remove("active");
    }
    cancelContractBtn.onclick = function() {
        contractModal.classList.remove("active");
    }
    contractModal.onclick = function(event) {
        if (event.target == contractModal) {
            contractModal.classList.remove("active");
        }
    }

    const openCompanyBtn = document.getElementById("addCompanyBtn");
    const companyModal = document.getElementById("addCompanyModal");
    const closeCompanyBtn = document.getElementById("closeCompanyModalBtn");
    const cancelCompanyBtn = document.getElementById("cancelCompanyModalBtn");

    openCompanyBtn.onclick = function() {
        companyModal.classList.add("active");
    }
    closeCompanyBtn.onclick = function() {
        companyModal.classList.remove("active");
    }
    cancelCompanyBtn.onclick = function() {
        companyModal.classList.remove("active");
    }
    companyModal.onclick = function(event) {
        if (event.target == companyModal) {
            companyModal.classList.remove("active");
        }
    }

    const toggleButtons = document.querySelectorAll('.btn-toggle-detail');

    toggleButtons.forEach(button => {
        button.addEventListener('click', function() {

            const targetId = this.getAttribute('data-target-id');
            const detailView = document.getElementById(targetId);

            if (detailView) {
                const isActive = detailView.classList.contains('active');

                closeAllOtherDetails();

                if (!isActive) {
                    detailView.classList.add('active');
                    this.textContent = "상세닫기";
                }
            }
        });
    });

    function closeAllOtherDetails() {
        document.querySelectorAll('.contract-detail-expanded').forEach(view => {
            view.classList.remove('active');
        });

        toggleButtons.forEach(btn => {
            btn.textContent = "상세보기";
        });
    }
</script>
</body>
</html>