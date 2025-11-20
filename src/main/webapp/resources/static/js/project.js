// Global functions
function deleteProject(event, projectId, workspaceId) {
    event.preventDefault();
    event.stopPropagation();

    if (confirm('정말 이 프로젝트를 삭제하시겠습니까?')) {
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = CONTEXT_PATH + '/project/delete';
        
        const projectIdInput = document.createElement('input');
        projectIdInput.type = 'hidden';
        projectIdInput.name = 'projectId';
        projectIdInput.value = projectId;
        form.appendChild(projectIdInput);

        const workspaceIdInput = document.createElement('input');
        workspaceIdInput.type = 'hidden';
        workspaceIdInput.name = 'workspaceId';
        workspaceIdInput.value = workspaceId;
        form.appendChild(workspaceIdInput);

        document.body.appendChild(form);
        form.submit();
    }
}

async function reloadTeamList(workspaceId) {
    try {
        const response = await fetch(`/workspace/members?workspaceId=${workspaceId}`);
        if (!response.ok) throw new Error('Failed to reload team list.');
        const html = await response.text();
        document.getElementById('teamMemberListBody').innerHTML = html;
    } catch (error) {
        console.error('Error reloading team list:', error);
    }
}

async function removeMember(workspaceId, memberId) {
    if (confirm('정말 이 멤버를 추방하시겠습니까?')) {
        const formData = new FormData();
        formData.append('workspaceId', workspaceId);
        formData.append('memberId', memberId);

        try {
            const response = await fetch('/workspace/member/remove', {
                method: 'POST',
                body: formData
            });
            const result = await response.json();
            alert(result.message);

            if (result.success) {
                await reloadTeamList(workspaceId);
            }
        } catch (error) {
            console.error('Error removing member:', error);
            alert('멤버 추방 중 오류가 발생했습니다.');
        }
    }
}

async function updateRole(workspaceId, memberId, newRole) {
    if (confirm('이 멤버의 역할을 ' + newRole + '(으)로 변경하시겠습니까?')) {
        const formData = new FormData();
        formData.append('workspaceId', workspaceId);
        formData.append('memberId', memberId);
        formData.append('role', newRole);

        try {
            const response = await fetch('/workspace/member/updateRole', {
                method: 'POST',
                body: formData
            });
            const result = await response.json();
            alert(result.message);

            if (result.success) {
                await reloadTeamList(workspaceId);
            } else {
                // 역할 변경 실패 시, 화면을 다시 로드하여 원래 역할로 되돌림
                await reloadTeamList(workspaceId);
            }
        } catch (error) {
            console.error('Error updating role:', error);
            alert('역할 변경 중 오류가 발생했습니다.');
        }
    } else {
        // 사용자가 '취소'를 누르면 목록을 다시 로드하여 원래 역할로 되돌림
        await reloadTeamList(workspaceId);
    }
}

// 팀원 검색 함수
async function searchTeamMembers() {
    const searchQuery = document.getElementById('teamSearchInput').value;
    const workspaceId = document.querySelector('.container').dataset.workspaceId;

    console.log('Client-side: Searching team members with query:', searchQuery);

    try {
        const response = await fetch(`/workspace/members?workspaceId=${workspaceId}&searchQuery=${encodeURIComponent(searchQuery)}`);
        if (!response.ok) throw new Error('Failed to search team members.');
        const html = await response.text();
        document.getElementById('teamMemberListBody').innerHTML = html;
    } catch (error) {
        console.error('Client-side: Error searching team members:', error);
    }
}

document.addEventListener('DOMContentLoaded', function () {
    // --- 탭 기능 ---
    const projectTab = document.getElementById('projectTab');
    const teamManageTab = document.getElementById('teamManageTab');
    const projectContent = document.getElementById('projectContent');
    const teamManageContent = document.getElementById('teamManageContent');

    // 탭 관련 요소들이 페이지에 없을 경우를 대비한 null 체크
    if (projectTab && teamManageTab && projectContent && teamManageContent) {
        projectTab.addEventListener('click', () => {
            projectTab.classList.add('choice');
            teamManageTab.classList.remove('choice');
            projectContent.style.display = 'flex';
            teamManageContent.style.display = 'none';
        });

        teamManageTab.addEventListener('click', () => {
            teamManageTab.classList.add('choice');
            projectTab.classList.remove('choice');
            teamManageContent.style.display = 'block';
            projectContent.style.display = 'none';
        });
        
        // 기본으로 프로젝트 탭을 선택
        projectTab.click();
    }

    // Messages from server
    const successMessage = SUCCESS_MESSAGE;
    const errorMessage = ERROR_MESSAGE;

    if (successMessage) {
        alert(successMessage);
    }
    if (errorMessage) {
        alert(errorMessage);
    }

    // Attach search listener
    const teamSearchInput = document.getElementById('teamSearchInput');
    if (teamSearchInput) {
        teamSearchInput.addEventListener('keyup', searchTeamMembers);
    }
});