document.addEventListener('DOMContentLoaded', function () {
    // --- "+ 새 프로젝트" 버튼 관련 모달 기능 ---
    const createProjectButton = document.getElementById('createProjectButton');
    const newProjectModal = document.getElementById('newProjectModal');
    
    // 관련 요소들이 페이지에 없을 수도 있으므로 null 체크
    if (createProjectButton && newProjectModal) {
        const modalOverlay = document.getElementById('modalOverlay');
        const modalCloseButton = newProjectModal.querySelector('.modal-close-button');
        const newProjectContent = document.getElementById('newProjectContent');
        const container = document.querySelector('.container');

        createProjectButton.addEventListener('click', () => {
            const workspaceId = container.dataset.workspaceId;

            if (!workspaceId) {
                alert('워크스페이스 ID를 찾을 수 없습니다. 페이지에 data-workspace-id 속성이 있는지 확인하세요.');
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

        function closeNewProjectModal() {
            modalOverlay.style.display = 'none';
            newProjectModal.style.display = 'none';
            newProjectContent.innerHTML = '';
        }

        modalCloseButton.addEventListener('click', closeNewProjectModal);
        
        modalOverlay.addEventListener('click', () => {
            if (newProjectModal.style.display === 'block') {
                closeNewProjectModal();
            }
        });
    }
});
