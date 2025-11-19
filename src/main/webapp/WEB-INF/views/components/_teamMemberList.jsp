<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="member" items="${workspaceMembers}">
    <tr>
        <td>
            <div class="team_account">
                <div class="team_account_info">
                    <div class="team_account_name"><c:out value="${member.memberVo.memberName}"/></div>
                    <div class="team_account_email"><c:out value="${member.memberVo.email}"/></div>
                </div>
            </div>
        </td>
        <td>
            <select name="role" 
                    onchange="updateRole('${workspace.workspaceId}', '${member.memberId}', this.value)"
                    ${currentUserRole != 'ADMIN' or member.workspaceMemberRole == 'ADMIN' or currentUserRole == 'VIEWER' ? 'disabled' : ''}>
                <option value="EDITOR" ${member.workspaceMemberRole == 'EDITOR' ? 'selected' : ''}>편집자</option>
                <option value="VIEWER" ${member.workspaceMemberRole == 'VIEWER' ? 'selected' : ''}>뷰어</option>
                <c:if test="${member.workspaceMemberRole == 'ADMIN'}">
                    <option value="ADMIN" selected>관리자</option>
                </c:if>
            </select>
        </td>
        <td><c:out value="${member.memberVo.enrollDate}"/></td>
        <td>활성</td>
        <td>
            <c:if test="${currentUserRole == 'ADMIN' and sessionScope.loginMember.memberId != member.memberId and currentUserRole != 'VIEWER'}">
                <button class="remove-member-btn" onclick="removeMember('${workspace.workspaceId}', '${member.memberId}')">추방</button>
            </c:if>
        </td>
    </tr>
</c:forEach>
<c:if test="${empty workspaceMembers}">
    <tr>
        <td colspan="5" style="text-align: center; padding: 20px;">이 워크스페이스에는 아직 팀 멤버가 없습니다.</td>
    </tr>
</c:if>
