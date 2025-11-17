<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 25. 11. 17.
  Time: 오전 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="whitebox" style="width: 99%;">
    <h3>진행현황</h3>

    <p>'유튜브 채널 운영' 현황</p>
    <div class="dataCollection">
        <div class="dataBlock" style="height:100px; width: 32%; background-color:#fff7ed;">
            <div class="dataBlockType" style="background-color:#f54900">
                <div class="imageContainer"><img src="<%= request.getContextPath() %>/images/aleart.PNG" alt="경고"></div>
            </div>
            <div class="dataBlockText">
                <p>진행중</p>
                <h1 id="whole-progress" style="color:#f54900">${todo}건</h1>
            </div>
        </div>
        <div class="dataBlock" style="height:100px; width: 32%; background-color:#f9fafb;">
            <div class="dataBlockType" style="background-color:#4a5565">
                <div class="imageContainer"><img src="<%= request.getContextPath() %>/images/circle.PNG" alt="빈원"></div>
            </div>
            <div class="dataBlockText">
                <p>예정</p>
                <h1 id="whole-expected" style="color:#4a5565">${progress}건</h1>
            </div>
        </div>
        <div class="dataBlock" style="height:100px; width: 32%; background-color:#f0fdf4;">
            <div class="dataBlockType" style="background-color:#00a63e">
                <div class="imageContainer"><img src="<%= request.getContextPath() %>/images/checke.PNG" alt="체크"></div>
            </div>
            <div class="dataBlockText">
                <p>완료</p>
                <h1 id="whole-completed" style="color:#00a63e">${complete}건</h1>
            </div>
        </div>
    </div>
</div>