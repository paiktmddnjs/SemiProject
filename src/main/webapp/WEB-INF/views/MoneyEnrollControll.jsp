<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/MoneyEnroll.css" />
    <title>새 수익 등록 팝업</title>

</head>

<body>

<button type="button" class="btn-open-modal" onclick="openProfitModal()">수익 추가</button>

<div id="profitRegistrationModal" class="modal-backdrop hidden">
    <div class="modal-content-custom">
        
        <div class="modal-header-custom">
            <div class="modal-content-title">
                <h5 class="modal-title-custom">새 수익 등록</h5>
                <p class="modal-description">새로운 수익 내역을 등록하세요</p>
            </div>
            <button type="button" class="btn-close-custom" onclick="closeProfitModal()">
                &times; 
            </button>
        </div>

        <form id="newProfitForm" onsubmit="event.preventDefault(); submitNewProfit();">
            
            <div class="form-group">
                <label for="profitCategory">카테고리</label>
                <select class="custom-form-control1" id="profitCategory" name="category" required>
                    <option value="" disabled selected>카테고리 선택</option>
                    <option value="협찬">협찬</option>
                    <option value="광고수익">광고 수익</option>
                </select>
            </div>

            <div class="form-group">
                <label for="profitDescription">내역</label>
                <input type="text" class="custom-form-control2" id="profitDescription" name="description" placeholder="수익 내역을 입력하세요" required>
            </div>

            <div class="form-group">
                <label for="profitAmount">금액 (원)</label>
                <input type="number" class="custom-form-control3" id="profitAmount" name="amount" placeholder="100000" min="0" required>
            </div>

            <div class="form-group" style="margin-bottom: 30px;">
                <label for="profitDate">날짜</label>
                <input type="date" class="custom-form-control4" id="profitDate" name="profitDate" required>
            </div>

            <button type="submit" class="btn-custom-save">저장</button>
        </form>
        
    </div>
</div>
<script src="MoneyEnroll.js"></script>    
</body>
</html>