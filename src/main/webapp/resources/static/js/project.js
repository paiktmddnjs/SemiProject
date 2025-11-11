document.addEventListener('DOMContentLoaded', function () {
    // --- 탭 기능 ---
    const projectTab = document.getElementById('projectTab');
    const teamManageTab = document.getElementById('teamManageTab');
    const projectContent = document.getElementById('projectContent');
    const teamManageContent = document.getElementById('teamManageContent');

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
    
    projectTab.click();

    // --- 새 프로젝트 모달 기능 ---
    const createProjectButton = document.getElementById('createProjectButton');
    const modalOverlay = document.getElementById('modalOverlay');
    const newProjectModal = document.getElementById('newProjectModal');
    const modalCloseButton = newProjectModal.querySelector('.modal-close-button');
    const newProjectContent = document.getElementById('newProjectContent');
    const container = document.querySelector('.container');

    createProjectButton.addEventListener('click', () => {
        const workspaceId = container.dataset.workspaceId;

        if (!workspaceId) {
            alert('워크스페이스 ID를 찾을 수 없습니다.');
            return;
        }

        fetch(`/project/new?workspaceId=${workspaceId}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error(`서버 응답 오류: ${response.status}`);
                }
                return response.text();
            })
            .then(html => {
                newProjectContent.innerHTML = html;
                modalOverlay.style.display = 'block';
                newProjectModal.style.display = 'block';
            })
            .catch(error => {
                console.error('새 프로젝트 폼 로딩 오류:', error);
                alert('새 프로젝트 양식을 불러오는 데 실패했습니다. 콘솔을 확인하세요.');
            });
    });

    function closeModal() {
        modalOverlay.style.display = 'none';
        newProjectModal.style.display = 'none';
        newProjectContent.innerHTML = '';
    }

    modalCloseButton.addEventListener('click', closeModal);
    modalOverlay.addEventListener('click', closeModal);
});
