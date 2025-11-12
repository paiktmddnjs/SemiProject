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
});
