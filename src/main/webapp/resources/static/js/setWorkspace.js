document.addEventListener('DOMContentLoaded', function() {
    const setWorkspaceButton = document.getElementById('setWorkspaceButton');
    const modalOverlay = document.getElementById('modalOverlay');
    const setWorkspaceModal = document.getElementById('setWorkspaceModal');
    const setWorkspaceContent = document.getElementById('setWorkspaceContent');
    const modalCloseButton = setWorkspaceModal.querySelector('.modal-close-button');

     function openSetWorkspaceModal() {
        modalOverlay.classList.add('show');
        setWorkspaceModal.classList.add('show');

        if (setWorkspaceContent.innerHTML.trim() === '') { // 모달 내용이 비어있을 때만 fetch
            fetch('workspace/set')
                .then(response => response.text())
                .then(html => {
                    const parser = new DOMParser();
                    const doc = parser.parseFromString(html, 'text/html');
                    const containerBody = doc.querySelector('.container_body');
                    if (containerBody) {
                        setWorkspaceContent.innerHTML = containerBody.innerHTML;
                    } else {
                        setWorkspaceContent.innerHTML = '<p>Error: Could not load project form.</p>';
                    }
                })
                .catch(error => {
                    console.error('Error loading new_project.jsp:', error);
                    setWorkspaceContent.innerHTML = '<p>Error loading content.</p>';
                });
        }
    }

    // 새 프로젝트 모달 닫기 함수
    function closeSetWorkspaceModal() {
        modalOverlay.classList.remove('show');
        setWorkspaceModal.classList.remove('show');
    }

    // 이벤트 리스너 연결
    setWorkspaceButton.addEventListener('click', openSetWorkspaceModal);
    modalCloseButton.addEventListener('click', closeSetWorkspaceModal);
    modalOverlay.addEventListener('click', closeSetWorkspaceModal); // 오버레이 클릭 시 모달 닫기
});
