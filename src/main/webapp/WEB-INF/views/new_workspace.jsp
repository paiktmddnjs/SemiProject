<%@ page language="java" contentType ="text/html; charset=UTF-8"
    pageEncoding ="UTF-8"%>
    <!DOCTYPE html>
    <html>
        <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="css/new.css">
        </head>
        <body>
        <div class = "content">
            <div class="container">
                <div class="container_body">
                <div class = "header">
                    <div class = "header_title">
                        <div class = "header_title_main">
                            새 워크스페이스 등록
                        </div>
                        <div class = "header_title_sub">
                            새로운 워크스페이스 내역을 등록하세요
                        </div>
                    </div>  
                </div>
                <div class ="input">
                <div class ="input_title">
                        워크스페이스 이름
                    </div>
                    <div class = "input_body">
                            <input type="text" placeholder="워크스페이스의 이름을 입력하세요">   
                        </div>
                        </div>
                        <div class="input">
                        <div class="input_title">채널</div>
                        <div class = "input_body">
                            <select name="channel" id="channelSelect" aria-placeholder="채널 선택">
                                <option value="채널 1">채널 1</option>
                                <option value="채널 2">채널 2</option>
                            </select>
                        </div>
                        </div>
                        <div class ="input">
                        <div class="input_title">메모</div>
                        <div class = "input_body">
                            <textarea rows="2" placeholder="추가 메모"></textarea>
                            </div>
                        </div>
                        <div class="input">
                        <div class="input_body">
                            <button>저장</button>
                        </div>
                        </div>
                    </div>
                </div>
                </div>
            </body>
            </html>