<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="settings-container">

    <aside class="settings-sidebar">
        <h1 class="settings-title">개인 정보 수정</h1>

        <div class="profile-card">
            <div class="profile-image-placeholder">
                <%-- <img src="path/to/profile.jpg" alt="프로필 이미지"> --%>
            </div>
            <button class="btn btn-primary">프로필 이미지 변경</button>
        </div>

        <div class="danger-zone">
            <button class="btn btn-delete">계정 삭제</button>
        </div>
    </aside>

    <main class="settings-form-content">
        <form action="/updateMember" method="post">

            <div class="form-grid">
                <div class="form-group">
                    <label for="accountId">계정</label>
                    <input type="text" id="accountId" name="accountId" value="creater01" disabled>
                </div>

                <div class="form-group">
                    <label for="username">유저명</label>
                    <input type="text" id="username" name="username" placeholder="변경하실 이름을 입력해주세요.">
                </div>

                <div class="form-group">
                    <label for="password">비밀번호</label>
                    <input type="password" id="password" name="password" placeholder="변경하실 비밀번호를 입력해주세요.">
                </div>

                <div class="form-group">
                    <label for="password-confirm">비밀번호 확인</label>
                    <input type="password" id="password-confirm" name="passwordConfirm" placeholder="변경하실 비밀번호를 다시 입력해주세요.">
                </div>

                <div class="form-group">
                    <label for="phone">전화 번호</label>
                    <input type="tel" id="phone" name="phone" placeholder="변경하실 전화번호를 입력해주세요">
                </div>

                <div class="form-group">
                    <label for="email">메일 주소</label>
                    <input type="email" id="email" name="email" placeholder="변경하실 이메일주소를 입력해주세요">
                </div>
            </div>

            <div class="form-check">
                <input type="checkbox" id="marketing-agree">
                <label for="marketing-agree">마케팅 정보 수신 동의</label>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-submit">변경사항 저장</button>
            </div>

        </form>
    </main>

</div>