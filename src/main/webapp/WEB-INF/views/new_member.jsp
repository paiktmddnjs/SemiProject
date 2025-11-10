<%@ page language="java" contentType ="text/html; charset=UTF-8"
    pageEncoding ="UTF-8"%>
    <!DOCTYPE html>
    <html>
        <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="css/new.css">
        <link rel="stylesheet" href="css/invite.css">
        </head>
        <body>
        <div class = "content">
            <div class="container">
                <div class="container_body">
                <div class = "header">
                    <div class = "header_title">
                        <div class = "header_title_main">
                            팀원 초대하기
                        </div>
                        <div class = "header_title_sub">
                            초대할 팀원의 ID를 이용해 팀원을 초대하세요
                        </div>
                    </div>  
                </div>
                <div class ="input">
                <div class ="input_title">
                        팀원 ID
                    </div>
                    <div class = "input_body">
                            <input type="text" placeholder="초대할 팀원의 ID를 입력하세요">   
                        </div>
                        </div>
                        <div class="input">
                        <div class="input_title">권한</div>
                        <div class = "input_body">
                            <select name="" id="" aria-placeholder="팀원에게 부여할 권한을 선택하세요">
                                <option value="">편집자</option>  
                                <option value="">썸네일러</option> 
                                </select>
                        </div>
                        </div>
                        <div class="input">
                        <div class = "input_body">
                            <div class="role_decribe">
                            <div class="role_decribe_title">역할 관련 안내</div>
                            <div class="role_decribe_body">
                            <ul>
                            <li>관리자: 프로젝트 설정, 멤버 초대/제거, 모든 콘텐츠 관리</li>
                            <li>편집자: 콘텐츠 생성/편집/삭제</li>
                            <li>뷰어: 콘텐츠 읽기만 가능</li>
                            </ul>

                            </div></div>
                        </div>
                        </div>
                       
                        <div class="input">
                        <div class="input_body">
                            <button>초대</button>
                        </div>
                        </div>
                    </div>
                </div>
                </div>
            </body>
            </html>