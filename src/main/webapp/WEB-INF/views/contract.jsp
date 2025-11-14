<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/contractList.css">

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

    <%-- 더미 데이터 제거: DB에서 데이터를 가져옵니다 --%>

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
                                    <form action="${pageContext.request.contextPath}/contract/updateContract.do" method="post" style="display: inline;">
                                        <input type="hidden" name="contractId" value="${c.contractId}">
                                        <select name="paymentStatus" class="payment-status-select" onchange="this.form.submit()">
                                            <option value="reviewing" ${c.paymentStatus == 'reviewing' ? 'selected' : ''}>계약서 검토 중</option>
                                            <option value="pending" ${c.paymentStatus == 'pending' ? 'selected' : ''}>정산 대기</option>
                                            <option value="completed" ${c.paymentStatus == 'completed' ? 'selected' : ''}>정산 완료</option>
                                        </select>
                                    </form>
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

        <%-- 페이지네이션은 추후 구현 가능 --%>
    </div>
</div>

<div id="addContractModal" class="modal-backdrop">
    <div class="modal-content">
        <div class="modal-header">
            <h3>새 계약 추가하기</h3>
            <button type="button" class="close-btn" id="closeContractModalBtn">&times;</button>
        </div>
        <div class="modal-body">
            <form action="${pageContext.request.contextPath}/contract/saveContract.do" method="post">
                <div class="form-group">
                    <label for="contractName">계약 명칭 *</label>
                    <input type="text" id="contractName" name="contractName" placeholder="계약 명칭을 입력하세요">
                </div>
                <div class="form-group">
                    <label for="contractAmount">계약 금액</label>
                    <input type="number" id="contractAmount" name="contractAmount" placeholder="계약 금액을 입력하세요">
                </div>
                <div class="form-group">
                    <label for="companyId">계약 회사</label>
                    <select id="companyId" name="companyId">
                        <option value="">계약 회사를 선택하세요</option>
                        <c:forEach var="company" items="${companyList}">
                            <option value="${company.companyId}">${company.companyName}</option>
                        </c:forEach>
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
                        <option value="N">대기/협상</option>
                        <option value="Y" selected>진행중</option>
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
            <form action="${pageContext.request.contextPath}/contract/saveCompany.do" method="post">
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