<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>

    /* --- 모달 백드롭 및 컨테이너 --- */
    .modal3-backdrop {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        display: flex;
        align-items: center;
        justify-content: center;
        z-index: 1000;
    }

    .modal3-backdrop.hidden {
        display: none; /* 숨김 처리 */
    }

    .modal3-content-custom {

        background-color: white;
        border-radius: 8px;
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        width: 100%;
        max-width: 550px;
        padding: 15px 30px 25px 30px; /* 내부 여백 */
    }


    /* --- 헤더 및 제목 스타일 --- */
    .modal3-header-custom {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        margin-bottom: 15px;

    }

    .modal3-title-custom {
        color: #e75d06 !important; /* 주황색 제목 */
        font-size: 1.25rem; /* 이미지와 유사한 크기 */
        font-weight: bold;
        margin-top : 5px;
        margin-bottom: 0px;
    }

    .modal3-description {
        color: #666;
        font-size: 0.9rem;
        margin-top: 0px; /* 상단 마진도 0으로 설정하여 제목에 더 붙도록 함 */

    }
    .btn-close-custom {
        background: none;
        border: none;
        font-size: 1.8rem;
        color: #aaa;
        cursor: pointer;
        line-height: 1;
        padding: 0;
    }
    .btn-close-custom:hover {
        color: #777;
    }

    /* --- 폼 요소 스타일 --- */
    .form3-group {
        margin-bottom: 15px;
    }

    .form3-group label {
        display: block;
        margin-bottom: 8px;
        font-size: 0.95rem;
        font-weight: 500;
    }


    .custom-form3-control1 {
        appearance: none;
        -webkit-appearance: none;
        -moz-appearance: none;
        background-image: url('/down.png');
        background-repeat: no-repeat;
        background-position: right 12px center;
        background-size: 12px;
        background-color: #f8f8f8;
        border: 1px solid #e0e0e0;
        border-radius: 4px;
        height: 50px;
        width: 100%;
        padding: 10px 40px 10px 12px; /* 오른쪽 여백 추가! */
        box-sizing: border-box;
    }

    .custom-form3-control4 {
        width: 100%;
        padding: 10px 12px;
        height: 50px; /* 이미지와 동일한 높이 */
        background-color: #f8f8f8; /* 밝은 회색 배경 */
        border: 1px solid #e0e0e0;
        border-radius: 4px;
        box-sizing: border-box;
        /* 드롭다운 화살표 색상 조정 */
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
    }

    .custom-form3-control2  {

        width: 100%;
        padding: 10px 12px;
        height: 50px; /* 이미지와 동일한 높이 */
        background-color: #f8f8f8; /* 밝은 회색 배경 */
        border: 1px solid #e0e0e0;
        border-radius: 4px;
        box-sizing: border-box;
        /* 드롭다운 화살표 색상 조정 */
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;

    }

    .custom-form3-control3{

        width: 100%;
        padding: 10px 12px;
        height: 50px; /* 이미지와 동일한 높이 */
        background-color: #f8f8f8; /* 밝은 회색 배경 */
        border: 1px solid #e0e0e0;
        border-radius: 4px;
        box-sizing: border-box;
        /* 드롭다운 화살표 색상 조정 */
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
    }



    /* --- 저장 버튼 스타일 --- */
    .btn-custom1-save {
        width: 100%;
        margin-bottom: 0px; /* 이미지의 여백에 맞게 조정 */
        padding: 12px 20px;
        background-color: #ff4d00; /* 주황색 */
        border: none;
        color: white;
        font-size: 1.1rem;
        font-weight: bold;
        height: 50px;
        border-radius: 4px;
        cursor: pointer;

    }
    .btn-custom-save:hover {
        background-color: #e64500;
    }

</style>

<div id="profitRegistrationModal" class="modal3-backdrop hidden">

    <div class="modal3-content-custom">

        <div class="modal3-header-custom">
            <div class="modal3-content-title">
                <h5 class="modal3-title-custom">새 수익 등록</h5>
                <p class="modal3-description">새로운 수익 내역을 등록하세요</p>
            </div>
            <button type="button" class="btn-close-custom" onclick="closeProfitModal()">
                &times;
            </button>

        </div>

        <form id="newProfitForm" action="${pageContext.request.contextPath}/insert.f" method="post">

            <div class="form3-group">
                <label for="profitCategory">카테고리</label>
                <select class="custom-form3-control1" id="profitCategory" name="category" required>
                    <option value="" disabled selected>카테고리 선택</option>
                    <option value="협찬">협찬</option>
                    <option value="광고수익">광고</option>
                    <option value="굿즈">굿즈</option>
                    <option value="후원">후원</option>
                    <option value="기타">기타</option>
                </select>
            </div>

            <div class="form3-group">
                <label for="profitDescription">내역</label>
                <input type="text" class="custom-form3-control2" id="profitDescription" name="financialName" placeholder="수익 내역을 입력하세요" required>
            </div>

            <div class="form3-group">
                <label for="profitAmount">금액 (원)</label>
                <input type="number" class="custom-form3-control3" id="profitAmount" name="financialAmount" placeholder="100000" min="0" required>
            </div>

            <div class="form3-group" style="margin-bottom: 30px;">
                <label for="profitDate">날짜</label>
                <input type="date" class="custom-form3-control4" id="profitDate" name="financialDate" required>
            </div>

            <button type="submit" class="btn-custom1-save">저장</button>
        </form>

    </div>
</div>

