<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CREP 시작하기</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arimo', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen',
            'Ubuntu', 'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue',
            sans-serif;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        .gradient-bg {
            background: linear-gradient(135deg, #FFF7ED 0%, white 50%, #FFEDD4 100%);
        }

        .input-field {
            transition: all 0.2s ease;
        }

        .input-field:focus {
            outline: none;
            border-color: #F54900;
            box-shadow: 0 0 0 1px #F54900;
        }

        .btn-primary {
            transition: all 0.2s ease;
        }

        .btn-primary:hover:not(:disabled) {
            background-color: #D94000;
            transform: translateY(-1px);
        }

        .btn-primary:disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }

        .back-link {
            transition: color 0.2s ease;
        }

        .back-link:hover {
            color: #F54900;
        }

        .link-orange {
            color: #F54900;      /* 글자 색상 */
            text-decoration: none; /* 밑줄 제거 */
            cursor: default;      /* 손가락 커서 대신 기본 커서 */
        }

        .link-orange:hover {
            color: #F54900;       /* 색상 변화 방지 */
            text-decoration: none; /* 밑줄 생기지 않게 */
            cursor: default;       /* 커서 변화 방지 */
        }

        .checkbox-custom {
            width: 16px;
            height: 16px;
            border: 1px solid #99A1AF;
            border-radius: 4px;
            cursor: pointer;
            accent-color: #F54900;
        }

        .eye-button {
            transition: color 0.2s ease;
        }

        .eye-button:hover {
            color: #F54900;
        }

        .card-shadow {
            box-shadow: 0px 25px 50px -12px rgba(0, 0, 0, 0.25);
        }

        .logo-gradient {
            background: linear-gradient(135deg, #FB923C 0%, #EA580C 100%);
        }
    </style>
</head>
<body class="gradient-bg min-h-screen flex items-center justify-center p-4">
<div class="w-full max-w-md">
    <!-- Back to Home Link -->
    <button class="back-link flex items-center gap-2 mb-5 text-[#364153]" onclick="location.href='landing'">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="m15 18-6-6 6-6"/>
        </svg>
        <span class="text-sm">홈으로 돌아가기</span>
    </button>

    <!-- Main Card -->
    <div class="bg-white rounded-xl card-shadow border-2 border-gray-200 overflow-hidden">
        <!-- Header Section -->
        <div class="px-6 pt-6 pb-8">
            <div class="flex flex-col items-center gap-6">
                <!-- Logo -->
                <div class="w-16 h-16 logo-gradient rounded-2xl flex items-center justify-center">
                    <div class="text-white text-2xl font-bold">C</div>
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
        <form id="signupForm" class="px-6 pb-8 space-y-6" onsubmit="handleSubmit(event)">
            <!-- Name Field -->
            <div class="space-y-2">
                <label class="text-sm text-[#364153]">이름</label>
                <div class="relative">
                    <svg class="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-[#99A1AF]" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"/>
                        <circle cx="12" cy="7" r="4"/>
                    </svg>
                    <input
                            type="text"
                            id="name"
                            placeholder="홍길동"
                            class="input-field w-full h-[50px] pl-10 pr-4 bg-[#F3F3F5] border border-[#D1D5DC] rounded-lg text-sm"
                            required
                    />
                </div>
            </div>

            <!-- Email Field -->
            <div class="space-y-2">
                <label class="text-sm text-[#364153]">이메일</label>
                <div class="relative">
                    <svg class="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-[#99A1AF]" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <rect width="20" height="16" x="2" y="4" rx="2"/>
                        <path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"/>
                    </svg>
                    <input
                            type="email"
                            id="email"
                            placeholder="example@email.com"
                            class="input-field w-full h-[50px] pl-10 pr-4 bg-[#F3F3F5] border border-[#D1D5DC] rounded-lg text-sm"
                            required
                    />
                </div>
            </div>

            <!-- Phone Field -->
            <div class="space-y-2">
                <label class="text-sm text-[#364153]">전화 번호</label>
                <div class="relative">
                    <svg class="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-[#99A1AF]" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/>
                    </svg>
                    <input
                            type="tel"
                            id="phone"
                            placeholder="010-xxxx-xxxx"
                            pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
                            class="input-field w-full h-[50px] pl-10 pr-4 bg-[#F3F3F5] border border-[#D1D5DC] rounded-lg text-sm"
                            required
                    />
                </div>
            </div>

            <!-- Password Field -->
            <div class="space-y-2">
                <label class="text-sm text-[#364153]">비밀번호</label>
                <div class="relative">
                    <svg class="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-[#99A1AF]" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <rect width="18" height="11" x="3" y="11" rx="2" ry="2"/>
                        <path d="M7 11V7a5 5 0 0 1 10 0v4"/>
                    </svg>
                    <input
                            type="password"
                            id="password"
                            placeholder="최소 8자 이상"
                            minlength="8"
                            class="input-field w-full h-[50px] pl-10 pr-12 bg-[#F3F3F5] border border-[#D1D5DC] rounded-lg text-sm"
                            required
                    />
                    <button
                            type="button"
                            class="eye-button absolute right-3 top-1/2 -translate-y-1/2 text-[#99A1AF]"
                            onclick="togglePassword('password', this)"
                    >
                        <svg class="eye-open w-5 h-5" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M2 12s3-7 10-7 10 7 10 7-3 7-10 7-10-7-10-7Z"/>
                            <circle cx="12" cy="12" r="3"/>
                        </svg>
                        <svg class="eye-closed w-5 h-5 hidden" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
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
                <label class="text-sm text-[#364153]">비밀번호 확인</label>
                <div class="relative">
                    <svg class="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-[#99A1AF]" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <rect width="18" height="11" x="3" y="11" rx="2" ry="2"/>
                        <path d="M7 11V7a5 5 0 0 1 10 0v4"/>
                    </svg>
                    <input
                            type="password"
                            id="confirmPassword"
                            placeholder="비밀번호를 다시 입력하세요"
                            minlength="8"
                            class="input-field w-full h-[50px] pl-10 pr-12 bg-[#F3F3F5] border border-[#D1D5DC] rounded-lg text-sm"
                            required
                    />
                    <button
                            type="button"
                            class="eye-button absolute right-3 top-1/2 -translate-y-1/2 text-[#99A1AF]"
                            onclick="togglePassword('confirmPassword', this)"
                    >
                        <svg class="eye-open w-5 h-5" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M2 12s3-7 10-7 10 7 10 7-3 7-10 7-10-7-10-7Z"/>
                            <circle cx="12" cy="12" r="3"/>
                        </svg>
                        <svg class="eye-closed w-5 h-5 hidden" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
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
                    <input
                            type="checkbox"
                            id="agreeToTerms"
                            class="checkbox-custom mt-0.5"
                            required
                    />
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
            <button
                    type="submit"
                    id="submitBtn"
                    class="btn-primary w-full h-12 bg-[#F54900] text-white rounded-lg flex items-center justify-center gap-2"
            >
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"/>
                    <circle cx="12" cy="7" r="4"/>
                </svg>
                <span class="text-lg">회원가입</span>
            </button>

            <!-- Login Link -->
            <div class="text-center text-sm">
                <span class="text-[#4A5565]">이미 계정이 있으신가요? </span>
                <a href="#" class="text-[#F54900] hover:underline">로그인</a>
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

    // Handle form submission
    function handleSubmit(event) {
        event.preventDefault();

        const name = document.getElementById('name').value;
        const email = document.getElementById('email').value;
        const phone = document.getElementById('phone').value;
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('confirmPassword').value;
        const agreeToTerms = document.getElementById('agreeToTerms').checked;

        // Validate passwords match
        if (password !== confirmPassword) {
            alert('비밀번호가 일치하지 않습니다.');
            return;
        }

        // Validate password length
        if (password.length < 8) {
            alert('비밀번호는 최소 8자 이상이어야 합니다.');
            return;
        }

        // Validate terms agreement
        if (!agreeToTerms) {
            alert('이용약관 및 개인정보처리방침에 동의해주세요.');
            return;
        }

        // Form data object
        const formData = {
            name: name,
            email: email,
            phone: phone,
            password: password
        };

        // Log form data (in production, this would be sent to a server)
        console.log('회원가입 정보:', formData);

        // Show success message
        alert('회원가입이 완료되었습니다!');

        // Reset form
        document.getElementById('signupForm').reset();
    }



    // Real-time validation for submit button
    function validateForm() {
        const name = document.getElementById('name').value;
        const email = document.getElementById('email').value;
        const phone = document.getElementById('phone').value;
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('confirmPassword').value;
        const agreeToTerms = document.getElementById('agreeToTerms').checked;
        const submitBtn = document.getElementById('submitBtn');

        const isValid = name && email && phone &&
            password.length >= 8 &&
            password === confirmPassword &&
            agreeToTerms;

        submitBtn.disabled = !isValid;
    }

    // Add event listeners for real-time validation
    document.addEventListener('DOMContentLoaded', function() {
        const formInputs = document.querySelectorAll('#signupForm input');
        formInputs.forEach(input => {
            input.addEventListener('input', validateForm);
            input.addEventListener('change', validateForm);
        });

        // Initial validation
        validateForm();
    });

    // Add phone number formatting
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
