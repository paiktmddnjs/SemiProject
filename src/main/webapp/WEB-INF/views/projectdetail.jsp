<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType ="text/html; charset=UTF-8"
    pageEncoding ="UTF-8"%>
    <!DOCTYPE html>
    <html>
        <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="<c:url value="/resources/static/css/projectdetail.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/static/css/default.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/static/css/new.css"/>">
        <%-- 스크립트 참조 수정 --%>
        <script src="<c:url value="/resources/static/js/newProject.js"/>" defer></script>
        <script src="<c:url value="/resources/static/js/setProject.js"/>" defer></script>
        </head>
        <body>
        <div class ="navigator">
            <jsp:include page="/WEB-INF/views/components/header.jsp"/>
        </div>
        <div class ="body">
            <div class ="sidebar">
                <jsp:include page="/WEB-INF/views/components/sidebar.jsp"/>
            </div>
            <div class = "content">
                <div class="container" data-project-id="${project.projectId}" data-workspace-id="${project.workspaceId}">
                    <div class = "header">
                        <div class = "header_title">
                            <div class = "header_title_main">
                                <c:out value="${project.projectName}"/>
                            </div>
                            <div class = "header_title_sub">
                                <c:out value="${project.projectExplain}"/>
                            </div>
                        </div>
                        <div class ="header_button">
                            <input type="button" value ="프로젝트 설정" class = "button" id="setProjectButton">
                        </div>
                    </div>
                    
                    <div class = "content_box">
                        <div class ="detail_box">
                            <div class = "box_body">
                                    <div class = "title">
                                        <div>진행률</div>
                                    </div>
                                    <div class ="worksapce_describe">
                                    
                                            <div>65%</div>
                                            <div>상세설명</div>
                                    </div>
                                </div>
                            </div>
                        
                        <div class ="detail_box">
                            <div class = "box_body">
                                    <div class = "title">
                                        <div>작일</div>
                                    </div>
                                    <div class ="describe">
                                    
                                            <div>65%</div>
                                            <div>상세설명</div>
                                    </div>
                                </div>
                            </div>
                                <div class ="detail_box">
                            <div class = "box_body">
                                    <div class = "title">
                                        <div>마감일</div>
                                    </div>
                                    <div class ="describe">
                                    
                                            <div>65%</div>
                                            <div>상세설명</div>
                                    </div>
                                </div>
                            </div>
                                    <div class ="detail_box">
                            <div class = "box_body">
                                    <div class = "title">
                                        <div>플랫폼</div>
                                    </div>
                                    <div class ="describe">
                                    
                                            <div>65%</div>
                                            <div>상세설명</div>
                                    </div>
                                </div>
                            </div>
                    </div>
                    </div>
                    <div class = "content">
                    <div class="container">
                    
                    <div class = "header">
                        <div class = "header_title">
                            <div class = "header_title_main">
                                작업 목록
                            </div>
                            <div class = "header_title_sub">
                               4개 작업 1개 완료
                            </div>
                        </div>
                        <div class ="header_button">
                            <input type="button" value ="+ 새 프로젝트" class = "button" id="createProjectButton">
                        </div>
                    </div>
                    <div class ="projectmenu">
                   
                 <div class ="detail_box">
                            <div class = "box_body">
                                    <div class = "task_title">
                                        <div>시작일</div>
                                    </div>
                                    <div class ="detail_box">
                            <div class = "box_body">
                                    <div class = "title">
                                        <div>시작일</div>
                                    </div>
                                    <div class ="worksapce_describe">
                                    
                                            <div>65%</div>
                                            <div> <select name="" id="">
                                                    <option>멤버 1</option>
                                                    <option>멤버 2</option>
                                                    <option>멤버 3</option>
                                                </select></div>
                                    </div>
                                </div>
                            </div>
                            <div class ="detail_box">
                            <div class = "box_body">
                                    <div class = "title">
                                        <div>시작일</div>
                                    </div>
                                    <div class ="detaildetail_box">
                                    <div class ="worksapce_describe">
                                    
                                            <div>65%</div>
                                            <div class ="enddate">
                                                <select>
                                                    <option>멤버 1</option>
                                                    <option>멤버 2</option>
                                                    <option>멤버 3</option>
                                                </select>
                                            
                                             <div>
                                        마감일
                                   
                                    </div>
                                    </div>
                                     </div>
                                   
                                    </div>
                                </div>
                            </div>
                                </div>
                            </div>
                        
                        <div class ="detail_box">
                            <div class = "box_body">
                                    <div class = "task_title">
                                        <div>시작일</div>
                                    </div>
                                    <div class ="detail_box">
                            <div class = "box_body">
                                    <div class = "title">
                                        <div>시작일</div>
                                    </div>
                                    <div class ="worksapce_describe">
                                    
                                            <div>65%</div>
                                            <div>
                                                 <select name="" id="">
                                                    <option>멤버 1</option>
                                                    <option>멤버 2</option>
                                                    <option>멤버 3</option>
                                                </select>
                                            </div>
                                    </div>
                                </div>
                            </div>
                            <div class ="detail_box">
                            <div class = "box_body">
                                    <div class = "title">
                                        <div>시작일</div>
                                    </div>
                                    <div class ="worksapce_describe">
                                    
                                            <div>65%</div>
                                            <div>
                                                 <select name="" id="">
                                                    <option>멤버 1</option>
                                                    <option>멤버 2</option>
                                                    <option>멤버 3</option>
                                                </select>
                                            </div>
                                    </div>
                                </div>
                            </div>
                                </div>
                            </div>
                               <div class ="detail_box">
                            <div class = "box_body">
                                    <div class = "task_title">
                                        <div>시작일</div>
                                    </div>
                                    <div class ="detail_box">
                            <div class = "box_body">
                                    <div class = "title">
                                        <div>시작일</div>
                                    </div>
                                    <div class ="worksapce_describe">
                                    
                                            <div>65%</div>
                                            <div>
                                                <select name="" id="">
                                                    <option>멤버 1</option>
                                                    <option>멤버 2</option>
                                                    <option>멤버 3</option>
                                                </select>
                                            </div>
                                    </div>
                                </div>
                            </div>
                            <div class ="detail_box">
                            <div class = "box_body">
                                    <div class = "title">
                                        <div>시작일</div>
                                    </div>
                                    <div class ="worksapce_describe">
                                    
                                            <div>65%</div>
                                            <div>
                                                 <select name="" id="">
                                                    <option>멤버 1</option>
                                                    <option>멤버 2</option>
                                                    <option>멤버 3</option>
                                                </select>
                                            </div>
                                    </div>
                                </div>
                            </div>
                                </div>
                            </div>
                    </div>
                    </div>
                    </div>
                    </div>  
                </div>  
                </div>
            </div>
        
            <div class ="footer">
                <jsp:include page="/WEB-INF/views/components/footer.jsp"/>
            </div>
            <div id ="modalOverlay" class="modal-overlay"></div>
                 <div id="setProjectModal" class="modal-container">
                <div class="modal-content">
                    <button class ="modal-close-button">&times;</button>
                    <div id = "setProjectContent" class="new_Content"></div>
                </div>
</div>
            <div id="newProjectModal" class="modal-container">
                <div class="modal-content">
                    <button class ="modal-close-button">&times;</button>
                    <div id = "newProjectContent" class="new_Content"></div>
                </div>
</div>
        </body>
    </html>