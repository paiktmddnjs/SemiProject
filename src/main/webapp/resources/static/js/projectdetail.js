document.addEventListener('DOMContentLoaded', function() {
    const createProjectButton = document.getElementById('createProjectButton');
    const modalOverlay = document.getElementById('modalOverlay');
    const newProjectModal = document.getElementById('newProjectModal');
    const newProjectContent = document.getElementById('newProjectContent');
    const modalCloseButton = newProjectModal.querySelector('.modal-close-button');


     function openNewProjectModal() {
        modalOverlay.classList.add('show');
        newProjectModal.classList.add('show');

        if (newProjectContent.innerHTML.trim() === '') {
            fetch('project/new')
                .then(response => response.text())
                .then(html => {
                    const parser = new DOMParser();
                    const doc = parser.parseFromString(html, 'text/html');
                    const containerBody = doc.querySelector('.container_body');
                    if (containerBody) {
                        newProjectContent.innerHTML = containerBody.innerHTML;
                    } else {
                        newProjectContent.innerHTML = '<p>Error: Could not load project form.</p>';
                    }
                })
                .catch(error => {
                    console.error('Error loading new_project.jsp:', error);
                    newProjectContent.innerHTML = '<p>Error loading content.</p>';
                });
        }
    }
   
    // 새 프로젝트 모달 닫기 함수
    function closeNewProjectModal() {
        modalOverlay.classList.remove('show');
        newProjectModal.classList.remove('show');
    }

    // 이벤트 리스너 연결
    createProjectButton.addEventListener('click', openNewProjectModal);
    modalCloseButton.addEventListener('click', closeNewProjectModal);
    modalOverlay.addEventListener('click', closeNewProjectModal); // 오버레이 클릭 시 모달 닫기
});
