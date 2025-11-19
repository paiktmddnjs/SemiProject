<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>로그인 페이지</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-container {
            background: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 5px 20px rgba(0,0,0,0.1);
            text-align: center;
        }
        .login-container h1 {
            margin-bottom: 20px;
        }
        .btn-youtube {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 10px 20px;
            background-color: #FF0000;
            color: #fff;
            text-decoration: none;
            font-weight: bold;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .btn-youtube:hover {
            background-color: #cc0000;
        }
        .btn-youtube svg {
            width: 20px;
            height: 20px;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h1>내 YouTube 통계 보기</h1>
    <p>계정 연결 후 통계를 확인하세요.</p>
    <a href="/youtube/login2" class="btn-youtube">
        <svg viewBox="0 0 24 24" fill="white">
            <path d="M10 15l5-3-5-3v6z"/>
            <path d="M21.8 8s-.2-1.4-1-2c-.9-.7-2-.7-2-.7H5c-.9 0-2 .1-2 .7-.8.6-1 2-1 2s-.2 1.5-.2 3v1c0 1.5.2 3 .2 3s.2 1.4 1 2c.9.7 2 .7 2 .7h13.8s1.1 0 2-.7c.8-.6 1-2 1-2s.2-1.5.2-3v-1c0-1.5-.2-3-.2-3z"/>
        </svg>
        YouTube 계정 연결
    </a>
</div>
</body>
</html>