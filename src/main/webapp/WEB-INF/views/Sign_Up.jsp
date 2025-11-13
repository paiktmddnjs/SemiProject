<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CREP 시작하기</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        * { margin:0; padding:0; box-sizing:border-box; }
        body {
            font-family:'Arimo',-apple-system,BlinkMacSystemFont,'Segoe UI','Roboto','Oxygen','Ubuntu','Cantarell','Fira Sans','Droid Sans','Helvetica Neue',sans-serif;
            -webkit-font-smoothing:antialiased; -moz-osx-font-smoothing:grayscale;
        }
        .gradient-bg { background: linear-gradient(135deg,#FFF7ED 0%, #fff 50%, #FFEDD4 100%); }
        .input-field { transition: all .2s ease; }
        .input-field:focus { outline:none; border-color:#F54900; box-shadow:0 0 0 1px #F54900; }
        .btn-primary { transition: all .2s ease; }
        .btn-primary:hover:not(:disabled) { background:#D94000; transform: translateY(-1px); }
        .btn-primary:disabled { opacity:.5; cursor:not-allowed; }
        .back-link { transition: color .2s ease; }
        .back-link:hover { color:#F54900; }
        .link-orange { color:#F54900; text-decoration:none; cursor:default; }
        .link-orange:hover { color:#F54900; text-decoration:none; cursor:default; }
        .checkbox-custom { width:16px; height:16px; border:1px solid #99A1AF; border-radius:4px; cursor:pointer; accent-color:#F54900; }
        .eye-button { transition: color .2s ease; }
        .eye-button:hover { color:#F54900; }
        .card-shadow { box-shadow:0 25px 50px -12px rgba(0,0,0,.25); }
        .logo-gradient { background:linear-gradient(135deg,#FB923C 0%, #EA580C 100%); }
    </style>
</head>
<body class="gradient-bg min-h-screen flex items-center justify-center p-4">
<div class="w-full max-w-md">

    <!-- Back to Home Link -->
    <button type="button" class="back-link flex items-center gap-2 mb-5 text-[#364153]"
            onclick="location.href='/'" aria-label="홈으로 돌아가기">
        <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" viewBox="0 0 24 24" fill="none"
             stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <polyline points="15 18 9 12 15 6"></polyline>
        </svg>
        <span class="text-sm">홈으로 돌아가기</span>
    </button>

    <!-- Main Card -->
    <div class="bg-white rounded-xl card-shadow border-2 border-gray-200 overflow-hidden">
        <!-- Header Section -->
        <div class="px-6 pt-6 pb-8">
            <div class="flex flex-col items-center gap-6">
                <!-- Logo -->
                <div class="w-16 h-16 flex items-center justify-center">
                    <img src="<c:url value='/resources/images/logo.png'/>" alt="CREP 로고"/>
                </div>

                <!-- Title -->
                <div class="text-center">
                    <h1 class="text-[30px] leading-9">
                        <span class="text-[#F54900]">CREP</span>
                        <span class="text-[#101828]"> 시작하기</span>
                    </h1>
                    <p class="text-[#4A5565] text-base mt-2">무료로 가입하고 크리에이터로서 성장하세요</p>
                </div>
            </div>
        </div>

        <!-- Form Section -->
        <form id="signupForm"
              class="px-6 pb-8 space-y-6"
              action="${pageContext.request.contextPath}/insert.me"
              method="post"
              onsubmit="return handleSubmit(event)"
              novalidate>

            <!-- Name Field -->
            <div class="space-y-2">
                <label for="name" class="text-sm text-[#364153]">이름</label>
                <div class="relative">
                    <svg class="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-[#99A1AF]" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"/>
                        <circle cx="12" cy="7" r="4"/>
                    </svg>
                    <input type="text" id="name" name="memberName" autocomplete="name"
                           placeholder="홍길동"
                           class="input-field w-full h-[50px] pl-10 pr-4 bg-[#F3F3F5] border border-[#D1D5DC] rounded-lg text-sm"
                           required/>
                </div>
            </div>

            <!-- Email Field -->
            <div class="space-y-2">
                <label for="email" class="text-sm text-[#364153]">이메일</label>

                <div class="relative flex gap-2">
                    <!-- 이메일 입력창 -->
                    <div class="relative flex-1">
                        <svg class="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-[#99A1AF]"
                             xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none"
                             stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <rect width="20" height="16" x="2" y="4" rx="2"/>
                            <path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"/>
                        </svg>

                        <input type="email" id="email" name="email" autocomplete="email"
                               placeholder="example@email.com"
                               class="input-field w-full h-[50px] pl-10 pr-4 bg-[#F3F3F5] border border-[#D1D5DC]
                          rounded-lg text-sm"
                               required/>
                    </div>

                    <!-- 중복확인 버튼 -->
                    <button type="button"
                            id="checkEmailBtn"

                            class="w-[110px] h-[50px] bg-[#F54900] text-white rounded-lg text-sm hover:bg-[#D94000]">
                        중복확인
                    </button>
                </div>

                <!-- 상태 메시지 -->
                <p id="emailCheckMsg" class="text-sm mt-1"></p>
            </div>

            <!-- Phone Field -->
            <div class="space-y-2">
                <label for="phone" class="text-sm text-[#364153]">전화 번호</label>
                <div class="relative">
                    <svg class="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-[#99A1AF]" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/>
                    </svg>
                    <input type="tel" id="phone" name="phone" autocomplete="tel"
                           placeholder="010-xxxx-xxxx" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
                           class="input-field w-full h-[50px] pl-10 pr-4 bg-[#F3F3F5] border border-[#D1D5DC] rounded-lg text-sm"
                           required/>
                </div>
            </div>

            <!-- Password Field -->
            <div class="space-y-2">
                <label for="password" class="text-sm text-[#364153]">비밀번호</label>
                <div class="relative">
                    <svg class="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-[#99A1AF]" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <rect width="18" height="11" x="3" y="11" rx="2" ry="2"/>
                        <path d="M7 11V7a5 5 0 0 1 10 0v4"/>
                    </svg>
                    <input type="password" id="password" name="memberPwd" autocomplete="new-password"
                           placeholder="최소 8자 이상" minlength="8"
                           class="input-field w-full h-[50px] pl-10 pr-12 bg-[#F3F3F5] border border-[#D1D5DC] rounded-lg text-sm"
                           required/>
                    <button type="button"
                            class="eye-button absolute right-3 top-1/2 -translate-y-1/2 text-[#99A1AF]"
                            onclick="togglePassword('password', this)" aria-label="비밀번호 표시 토글">
                        <svg class="eye-open w-5 h-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none"
                             stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M2 12s3-7 10-7 10 7 10 7-3 7-10 7-10-7-10-7Z"/>
                            <circle cx="12" cy="12" r="3"/>
                        </svg>
                        <svg class="eye-closed w-5 h-5 hidden" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
                             fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M9.88 9.88a3 3 0 1 0 4.24 4.24"/>
                            <path d="M10.73 5.08A10.43 10.43 0 0 1 12 5c7 0 10 7 10 7a13.16 13.16 0 0 1-1.67 2.68"/>
                            <path d="M6.61 6.61A13.526 13.526 0 0 0 2 12s3 7 10 7a9.74 9.74 0 0 0 5.39-1.61"/>
                            <line x1="2" x2="22" y1="2" y2="22"/>
                        </svg>
                    </button>
                </div>
            </div>

            <!-- Confirm Password Field -->
            <div class="space-y-2">
                <label for="confirmPassword" class="text-sm text-[#364153]">비밀번호 확인</label>
                <div class="relative">
                    <svg class="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-[#99A1AF]" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <rect width="18" height="11" x="3" y="11" rx="2" ry="2"/>
                        <path d="M7 11V7a5 5 0 0 1 10 0v4"/>
                    </svg>
                    <input type="password" id="confirmPassword" name="confirmPassword" autocomplete="new-password"
                           placeholder="비밀번호를 다시 입력하세요" minlength="8"
                           class="input-field w-full h-[50px] pl-10 pr-12 bg-[#F3F3F5] border border-[#D1D5DC] rounded-lg text-sm"
                           required/>
                    <button type="button"
                            class="eye-button absolute right-3 top-1/2 -translate-y-1/2 text-[#99A1AF]"
                            onclick="togglePassword('confirmPassword', this)" aria-label="비밀번호 확인 표시 토글">
                        <svg class="eye-open w-5 h-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none"
                             stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M2 12s3-7 10-7 10 7 10 7-3 7-10 7-10-7-10-7Z"/>
                            <circle cx="12" cy="12" r="3"/>
                        </svg>
                        <svg class="eye-closed w-5 h-5 hidden" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
                             fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M9.88 9.88a3 3 0 1 0 4.24 4.24"/>
                            <path d="M10.73 5.08A10.43 10.43 0 0 1 12 5c7 0 10 7 10 7a13.16 13.16 0 0 1-1.67 2.68"/>
                            <path d="M6.61 6.61A13.526 13.526 0 0 0 2 12s3 7 10 7a9.74 9.74 0 0 0 5.39-1.61"/>
                            <line x1="2" x2="22" y1="2" y2="22"/>
                        </svg>
                    </button>
                </div>
            </div>

            <!-- Terms Checkbox -->
            <div class="pt-2">
                <label class="flex items-start gap-2 cursor-pointer">
                    <input type="checkbox" id="agreeToTerms" name="agreeToTerms" class="checkbox-custom mt-0.5" required/>
                    <span class="text-sm text-[#364153] leading-5">
            <span class="text-[#F54900]">(필수) </span>
            <a class="link-orange">이용약관</a>
            <span> 및 </span>
            <a class="link-orange">개인정보처리방침</a>
            <span>에 동의합니다</span>
          </span>
                </label>
            </div>

            <!-- Submit Button -->
            <button type="submit" id="submitBtn"
                    class="btn-primary w-full h-12 bg-[#F54900] text-white rounded-lg flex items-center justify-center gap-2">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                     viewBox="0 0 24 24" fill="none" stroke="currentColor"
                     stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"/>
                    <circle cx="12" cy="7" r="4"/>
                </svg>
                <span class="text-lg">회원가입</span>
            </button>

            <!-- Login Link -->
            <div class="text-center text-sm">
                <span class="text-[#4A5565]">이미 계정이 있으신가요? </span>
                <a  href="<c:url value='/loginForm.me'/>" class="text-[#F54900] hover:underline">로그인</a>
            </div>
        </form>
    </div>
</div>

<script>
    // Toggle password visibility
    function togglePassword(inputId, button) {
        const input = document.getElementById(inputId);
        const eyeOpen = button.querySelector('.eye-open');
        const eyeClosed = button.querySelector('.eye-closed');

        if (input.type === 'password') {
            input.type = 'text';
            eyeOpen.classList.add('hidden');
            eyeClosed.classList.remove('hidden');
        } else {
            input.type = 'password';
            eyeOpen.classList.remove('hidden');
            eyeClosed.classList.add('hidden');
        }
    }

    // 간단 이메일 정규식
    function isValidEmail(email) {
        const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return re.test(String(email).toLowerCase());
    }

    // (선택) 비밀번호 복잡도 검사: 8자+, 숫자+영문
    function isStrongPassword(pwd) {
        if (pwd.length < 8) return false;
        const hasNum = /\d/.test(pwd);
        const hasLetter = /[a-zA-Z]/.test(pwd);
        return hasNum && hasLetter;
    }

    let submitting = false;

    // onsubmit 핸들러: 유효하면 true를 반환하여 기본 제출 진행
    function handleSubmit(event) {
        if (submitting) return false;

        const form = document.getElementById('signupForm');
        const name = document.getElementById('name').value.trim();
        const email = document.getElementById('email').value.trim();
        const phone = document.getElementById('phone').value.trim();
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('confirmPassword').value;
        const agreeToTerms = document.getElementById('agreeToTerms').checked;
        const submitBtn = document.getElementById('submitBtn');

        if (!name) { alert('이름을 입력하세요.'); return false; }
        if (!isValidEmail(email)) { alert('올바 있는 이메일 주소를 입력하세요.'); return false; }
        if (password !== confirmPassword) { alert('비밀번호가 일치하지 않습니다.'); return false; }
        if (!isStrongPassword(password)) { alert('비밀번호는 8자 이상, 숫자와 영문을 조합해주세요.'); return false; }
        if (!agreeToTerms) { alert('이용약관 및 개인정보처리방침에 동의해주세요.'); return false; }

        // 로딩/중복 제출 방지
        submitting = true;
        submitBtn.disabled = true;
        submitBtn.innerHTML = `
      <svg class="animate-spin w-4 h-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
           fill="none" stroke="currentColor" stroke-width="2">
        <path d="M21 12a9 9 0 1 1-6.219-8.56"/>
      </svg>
      <span class="text-lg">처리 중...</span>
    `;

        // true를 반환하면 브라우저가 form을 정상 제출함
        return true;
    }

    // 실시간 유효성 검사 (버튼 활성/비활성)
    function validateForm() {
        const agreeToTerms = document.getElementById('agreeToTerms').checked;
        const submitBtn = document.getElementById('submitBtn');


        submitBtn.disabled = !agreeToTerms || submitting;
    }

    document.addEventListener('DOMContentLoaded', function() {
        const formInputs = document.querySelectorAll('#signupForm input');
        formInputs.forEach(input => {
            input.addEventListener('input', validateForm);
            input.addEventListener('change', validateForm);
        });
        validateForm();
    });

    // 전화번호 자동 포맷(010-0000-0000)
    document.getElementById('phone').addEventListener('input', function(e) {
        let value = e.target.value.replace(/\D/g, '');
        if (value.length > 3 && value.length <= 7) {
            value = value.slice(0, 3) + '-' + value.slice(3);
        } else if (value.length > 7) {
            value = value.slice(0, 3) + '-' + value.slice(3, 7) + '-' + value.slice(7, 11);
        }
        e.target.value = value;
    });
</script>
</body>
</html>
