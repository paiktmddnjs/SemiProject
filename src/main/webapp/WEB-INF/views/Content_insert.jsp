<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>콘텐츠 등록 폼</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/insert.css">
</head>


<body>
<div class="container">
    <div id="successMessage" class="success-message">
        ✓ 콘텐츠가 성공적으로 등록되었습니다!
    </div>

    <button class="demo-btn" onclick="openModal()">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <line x1="12" y1="5" x2="12" y2="19"></line>
            <line x1="5" y1="12" x2="19" y2="12"></line>
        </svg>
        새 콘텐츠 등록
    </button>
</div>

<!-- Modal -->
<div id="modalOverlay" class="modal-overlay" onclick="handleOverlayClick(event)">
    <div class="modal-content">
        <!-- Header -->
        <div class="modal-header">
            <button class="close-btn" onclick="closeModal()">
                <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="2">
                    <line x1="4" y1="4" x2="12" y2="12"></line>
                    <line x1="12" y1="4" x2="4" y2="12"></line>
                </svg>
            </button>

            <h2 class="modal-title">새 콘텐츠 등록</h2>
            <p class="modal-subtitle">업로드한 콘텐츠를 등록하세요</p>
        </div>

        <!-- Form -->
        <form id="contentForm" class="modal-form" action="${pageContext.request.contextPath}/insert.c"  onsubmit="handleSubmit(event)">
            <!-- Platform -->
            <div class="form-group">
                <label class="form-label">플랫폼</label>
                <select name="platform" class="form-select" required>
                    <option value="">플랫폼 선택</option>
                    <option value="YouTube">YouTube</option>
                    <option value="Instagram">Instagram</option>
                    <option value="TikTok">TikTok</option>
                    <option value="Facebook">Facebook</option>
                </select>
            </div>

            <!-- Title -->
            <div class="form-group">
                <label class="form-label">콘텐츠 제목</label>
                <input
                        type="text"
                        name="title"
                        class="form-input"
                        placeholder="제목을 입력하세요"
                        required
                >
            </div>

            <!-- Category -->
            <div class="form-group">
                <label class="form-label">카테고리</label>
                <select name="category" class="form-select" required>
                    <option value="">카테고리 선택</option>
                    <option value="리뷰">리뷰</option>
                    <option value="브이로그">브이로그</option>
                    <option value="튜토리얼">튜토리얼</option>
                    <option value="소통">소통</option>
                    <option value="엔터테인먼트">엔터테인먼트</option>
                </select>
            </div>

            <!-- Upload Date -->
            <div class="form-group">
                <label class="form-label">업로드 날짜</label>
                <input
                        type="date"
                        name="uploadDate"
                        class="form-input"
                        required
                >
            </div>

            <!-- Status -->
            <div class="form-group">
                <label class="form-label">상태</label>
                <select name="status" class="form-select" required>
                    <option value="">상태 선택</option>
                    <option value="게시됨">게시됨</option>
                    <option value="임시저장">임시저장</option>
                    <option value="예약">예약</option>
                </select>
            </div>

            <!-- URL -->
            <div class="form-group">
                <label class="form-label">콘텐츠 URL</label>
                <input
                        type="url"
                        name="url"
                        class="form-input"
                        placeholder="https://..."
                        required
                >
            </div>

            <!-- Memo -->
            <div class="form-group large">
                <label class="form-label">메모</label>
                <textarea
                        name="memo"
                        class="form-textarea"
                        placeholder="콘텐츠 관련 메모"
                        rows="3"
                ></textarea>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="submit-btn">저장</button>
        </form>
    </div>
</div>

<script>
    // Modal functions
    function openModal() {
        const overlay = document.getElementById('modalOverlay');
        overlay.classList.add('active');
        document.body.style.overflow = 'hidden';
    }

    function closeModal() {
        const overlay = document.getElementById('modalOverlay');
        overlay.classList.remove('active');
        document.body.style.overflow = '';

        // Reset form
        document.getElementById('contentForm').reset();
    }

    function handleOverlayClick(event) {
        // Close modal when clicking outside the modal content
        if (event.target === event.currentTarget) {
            closeModal();
        }
    }

    // Form submission
    function handleSubmit(event) {
        event.preventDefault();

        // Get form data
        const formData = new FormData(event.target);
        const data = Object.fromEntries(formData.entries());

        // Log the data (in a real app, you would send this to a server)
        console.log('등록된 콘텐츠:', data);

        // Show success message
        const successMsg = document.getElementById('successMessage');
        successMsg.classList.add('show');

        // Hide success message after 3 seconds
        setTimeout(() => {
            successMsg.classList.remove('show');
        }, 3000);

        // Close modal
        closeModal();
    }

    // Close modal on ESC key
    document.addEventListener('keydown', function(event) {
        if (event.key === 'Escape') {
            const overlay = document.getElementById('modalOverlay');
            if (overlay.classList.contains('active')) {
                closeModal();
            }
        }
    });

    // Set today's date as default
    document.addEventListener('DOMContentLoaded', function() {
        const dateInput = document.querySelector('input[type="date"]');
        const today = new Date().toISOString().split('T')[0];
        dateInput.value = today;
    });
</script>
</body>
</html>
