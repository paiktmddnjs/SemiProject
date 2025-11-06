document.addEventListener('DOMContentLoaded', function() {
    // 탭 및 콘텐츠 요소 가져오기
    const projectTab = document.getElementById('projectTab');
    const teamManageTab = document.getElementById('teamManageTab');
    const projectContent = document.getElementById('projectContent');
    const teamManageContent = document.getElementById('teamManageContent');

    // 모달 관련 요소 가져오기
    const createProjectButton = document.getElementById('createProjectButton');
    const modalOverlay = document.getElementById('modalOverlay');
    const newProjectModal = document.getElementById('newProjectModal');
    const newProjectContent = document.getElementById('newProjectContent');
    const modalCloseButton = newProjectModal.querySelector('.modal-close-button');

    
    // 탭 관련 로직은 해당 요소들이 존재할 때만 실행
    if (projectTab && teamManageTab && projectContent && teamManageContent) {
        // 초기 상태 설정: 프로젝트 탭 활성화
        projectContent.style.display = 'block';
        teamManageContent.style.display = 'none';
    
        // 탭 활성화 및 콘텐츠 전환 함수
        function activateTab(tabElement, contentElement) {
            projectTab.classList.remove('choice');
            teamManageTab.classList.remove('choice');
            tabElement.classList.add('choice');
    
            projectContent.style.display = 'none';
            teamManageContent.style.display = 'none';
            contentElement.style.display = 'block';
        }
    
        // 각 탭에 클릭 이벤트 리스너 추가
        projectTab.addEventListener('click', () => activateTab(projectTab, projectContent));
        teamManageTab.addEventListener('click', () => activateTab(teamManageTab, teamManageContent));
    }

    // 새 프로젝트 모달 열기 함수
    function openNewProjectModal() {
        modalOverlay.classList.add('show');
        newProjectModal.classList.add('show');

        if (newProjectContent.innerHTML.trim() === '') {
            fetch('/project/new')
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
    modalOverlay.addEventListener('click', closeNewProjectModal);
    // 오버레이 클릭 시 모달 닫기
});
