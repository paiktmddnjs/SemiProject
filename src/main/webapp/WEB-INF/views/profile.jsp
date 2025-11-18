<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="profile-container">
    <h1>개인 정보 수정</h1>

    <div class="profile-content">
        <aside class="profile-sidebar">
            <div class="profile-image-area">
                <div class="profile-image-placeholder"></div>
                <button type="button" class="btn btn-primary">프로필 이미지 변경</button>
            </div>
            <button type="button" class="btn btn-danger">계정 삭제</button>
        </aside>

        <main class="profile-form">
            <form action="/updateProfile" method="post">

                <div class="form-group">
                    <label for="accountId">● 계정</label>
                    <input type="text" id="accountId" name="accountId" value="creater01" readonly>
                </div>

                <div class="form-group">
                    <label for="username">● 유저명</label>
                    <input type="text" id="username" name="username" placeholder="크리에이터">
                </div>

                <div class="form-group">
                    <label for="password">● 비밀번호</label>
                    <input type="password" id="password" name="password" placeholder="************">
                </div>

                <div class="form-group">
                    <label for="password-confirm">● 비밀번호 확인</label>
                    <input type="password" id="password-confirm" name="password-confirm" placeholder="************">
                </div>

                <div class="form-group">
                    <label for="phone">● 전화 번호</label>
                    <input type="tel" id="phone" name="phone" placeholder="010-****-7873">
                </div>

                <div class="form-group">
                    <label for="email">● 메일 주소</label>
                    <input type="email" id="email" name="email" placeholder="creator@example.com">
                </div>

                <div class="form-check">
                    <input type="checkbox" id="marketing-agree" name="marketing-agree">
                    <label for="marketing-agree">마케팅 정보 수신 동의</label>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-save">변경사항 저장</button>
                </div>

            </form>
        </main>
    </div>
</div>