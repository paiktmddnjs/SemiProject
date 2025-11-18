<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    :root{
        --brand:#f54900;
    }

    .mypage-wrapper{
        max-width: 960px;
        margin: 0 auto;
    }

    .mypage-title{
        color: var(--brand);
        font-weight: 700;
    }

    .mypage-subtitle{
        color:#6b7280;
        font-size: 0.95rem;
    }

    .mypage-card{
        border-radius: 16px;
        box-shadow: 0 1px 3px rgba(15,23,42,.08);
        border: 1px solid #e5e7eb;
    }

    .mypage-card-header{
        padding: 1.25rem 1.5rem 0.75rem;
    }

    .mypage-card-title{
        font-size: 1.05rem;
        font-weight: 600;
    }

    .mypage-card-desc{
        font-size: .875rem;
        color:#6b7280;
    }

    .mypage-card-body{
        padding: 0 1.5rem 1.5rem;
    }

    .platform-item{
        border:1px solid #e5e7eb;
        border-radius:12px;
        padding:.85rem 1rem;
        display:flex;
        align-items:center;
        justify-content:space-between;
        transition: background-color .15s ease;
    }
    .platform-item:hover{
        background:#f9fafb;
    }

    .platform-icon-box{
        width:40px;
        height:40px;
        border-radius:12px;
        background:#f3f4f6;
        display:flex;
        align-items:center;
        justify-content:center;
        font-size:18px;
    }

    .stat-pill{
        border-radius: 12px;
        background:#fff7ed;
        border:1px solid #fed7aa;
        padding:.75rem 1rem;
    }

    .stat-pill-label{
        font-size:.75rem;
        color:#6b7280;
    }

    .stat-pill-value{
        font-weight:600;
        color:#ea580c;
        font-size:1.1rem;
    }

    .danger-card{
        border-color:#fecaca;
    }

    .danger-title{
        color:#dc2626;
    }
</style>

<div class="mypage-wrapper py-4">

    <!-- Header -->
    <div class="mb-4">
        <h1 class="h3 mypage-title">마이페이지</h1>
        <p class="mypage-subtitle mt-1">
            프로필 및 계정 설정을 관리하세요
        </p>
    </div>

    <!-- 프로필 정보 (DB에서 불러온 개인정보) -->
    <div class="card mypage-card mb-4">
        <div class="mypage-card-header">
            <div class="mypage-card-title">프로필 정보</div>
            <div class="mypage-card-desc">
                회원정보를 확인하고 수정합니다
            </div>
        </div>
        <div class="mypage-card-body">
            <%-- 나중에 action="/mypageUpdate.me" method="post" 로 연결 예정 --%>
            <form>
                <!-- 아이디 -->
                <div class="mb-3">
                    <label class="form-label">아이디</label>
                    <input type="text"
                           class="form-control bg-light"
                           readonly
                           name="memberId"
                           value="${sessionScope.loginMember.memberId}">
                </div>

                <!-- 이름 -->
                <div class="mb-3">
                    <label class="form-label">이름</label>
                    <input type="text"
                           class="form-control"
                           name="memberName"
                           value="${sessionScope.loginMember.memberName}">
                </div>

                <!-- 이메일 (읽기 전용 – 아래 보안 설정에서 변경) -->
                <div class="mb-3">
                    <label class="form-label">이메일</label>
                    <input type="email"
                           class="form-control bg-light"
                           name="email"
                           readonly
                           value="${sessionScope.loginMember.email}">
                    <div class="form-text small">
                        이메일은 아래 보안 설정에서 변경할 수 있습니다
                    </div>
                </div>

                <!-- 전화번호 -->
                <div class="mb-3">
                    <label class="form-label">전화번호</label>
                    <input type="tel"
                           class="form-control"
                           name="phone"
                           value="${sessionScope.loginMember.phone}">
                </div>

                <div class="d-flex justify-content-end mt-3">
                    <button type="button" class="btn btn-primary">
                        프로필 저장
                    </button>
                </div>
            </form>
        </div>
    </div>

    <!-- 보안 설정 -->
    <div class="card mypage-card mb-4">
        <div class="mypage-card-header">
            <div class="mypage-card-title d-flex align-items-center gap-2">
                <i class="bi bi-shield-lock text-warning"></i>
                보안 설정
            </div>
            <div class="mypage-card-desc">
                계정의 보안을 관리하고 비밀번호를 변경합니다
            </div>
        </div>
        <div class="mypage-card-body">

            <!-- 이메일 변경 -->
            <div class="mb-4">
                <h6 class="mb-1 d-flex align-items-center gap-2">
                    <i class="bi bi-envelope text-warning"></i>
                    이메일 변경
                </h6>
                <p class="small text-muted mb-2">
                    현재 이메일:
                    <strong>${sessionScope.loginMember.email}</strong>
                </p>
                <label class="form-label small">새 이메일</label>
                <input type="email"
                       class="form-control mb-2"
                       placeholder="new@example.com">
                <button type="button"
                        class="btn btn-sm btn-outline-primary">
                    이메일 변경
                </button>
            </div>

            <hr/>

            <!-- 비밀번호 변경 -->
            <div class="mt-4">
                <h6 class="mb-1 d-flex align-items-center gap-2">
                    <i class="bi bi-lock text-warning"></i>
                    비밀번호 변경
                </h6>
                <p class="small text-muted mb-3">
                    보안을 위해 주기적으로 비밀번호를 변경하세요
                </p>

                <div class="mb-3">
                    <label class="form-label small">현재 비밀번호</label>
                    <input type="password" class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label small">새 비밀번호</label>
                    <input type="password" class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label small">새 비밀번호 확인</label>
                    <input type="password" class="form-control">
                </div>

                <button type="button" class="btn btn-primary">
                    비밀번호 변경
                </button>
            </div>
        </div>
    </div>

    <!-- 플랫폼 연동 -->
    <div class="card mypage-card mb-4">
        <div class="mypage-card-header">
            <div class="mypage-card-title">플랫폼 연동</div>
            <div class="mypage-card-desc">
                콘텐츠를 게시하는 플랫폼을 연동하고 관리하세요
            </div>
        </div>
        <div class="mypage-card-body">
            <%-- 지금은 더미 데이터, 나중에 DB/연동 정보로 교체 예정 --%>

            <div class="platform-item mb-2">
                <div class="d-flex align-items-center gap-3">
                    <div class="platform-icon-box text-danger">
                        <i class="bi bi-youtube"></i>
                    </div>
                    <div>
                        <div class="fw-semibold">
                            YouTube
                            <span class="text-success small ms-1">
                                <i class="bi bi-check-circle-fill"></i>
                            </span>
                        </div>
                        <div class="small text-muted">@creator123</div>
                    </div>
                </div>
                <button type="button"
                        class="btn btn-sm btn-outline-danger">
                    연동 해제
                </button>
            </div>

            <div class="platform-item mb-2">
                <div class="d-flex align-items-center gap-3">
                    <div class="platform-icon-box" style="color:#db2777;">
                        <i class="bi bi-instagram"></i>
                    </div>
                    <div>
                        <div class="fw-semibold">
                            Instagram
                            <span class="text-success small ms-1">
                                <i class="bi bi-check-circle-fill"></i>
                            </span>
                        </div>
                        <div class="small text-muted">@creator_official</div>
                    </div>
                </div>
                <button type="button"
                        class="btn btn-sm btn-outline-danger">
                    연동 해제
                </button>
            </div>

            <div class="platform-item mb-2">
                <div class="d-flex align-items-center gap-3">
                    <div class="platform-icon-box">
                        <i class="bi bi-play-btn"></i>
                    </div>
                    <div>
                        <div class="fw-semibold">TikTok</div>
                        <div class="small text-muted">연동되지 않음</div>
                    </div>
                </div>
                <button type="button"
                        class="btn btn-sm btn-primary">
                    연동하기
                </button>
            </div>

            <hr class="my-4"/>

            <!-- 연동 통계 -->
            <h6 class="mb-3">연동 통계</h6>
            <div class="row g-3">
                <div class="col-md-4">
                    <div class="stat-pill">
                        <div class="stat-pill-label">연동된 플랫폼</div>
                        <div class="stat-pill-value mt-1">3개</div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="stat-pill">
                        <div class="stat-pill-label">전체 구독자</div>
                        <div class="stat-pill-value mt-1">125.4K</div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="stat-pill">
                        <div class="stat-pill-label">이번 달 업로드</div>
                        <div class="stat-pill-value mt-1">24개</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 위험 구역 -->
    <div class="card mypage-card danger-card mb-4">
        <div class="mypage-card-header">
            <div class="mypage-card-title danger-title d-flex align-items-center gap-2">
                <i class="bi bi-trash"></i>
                위험 구역
            </div>
            <div class="mypage-card-desc">
                계정 삭제는 되돌릴 수 없습니다
            </div>
        </div>
        <div class="mypage-card-body">
            <button type="button"
                    class="btn btn-danger"
                    onclick="if(confirm('정말 계정을 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.')){ alert('계정이 삭제되었습니다. (추후 서버 연동)'); }">
                계정 삭제
            </button>
        </div>
    </div>

</div>
