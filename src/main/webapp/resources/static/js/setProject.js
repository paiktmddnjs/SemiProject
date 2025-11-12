document.addEventListener('DOMContentLoaded', function () {
    // 버튼 ID를 setProjectButton으로 수정
    const setProjectButton = document.getElementById('setProjectButton');
    if (!setProjectButton) return;

    const modalOverlay = document.getElementById('modalOverlay');
    // 모달 ID를 setProjectModal로 수정
    const setProjectModal = document.getElementById('setProjectModal');
    const modalCloseButton = setProjectModal.querySelector('.modal-close-button');
    // 모달 내용 ID를 setProjectContent로 수정
    const setProjectContent = document.getElementById('setProjectContent');
    const container = document.querySelector('.container');

    setProjectButton.addEventListener('click', () => {
        // data-project-id 속성에서 projectId 가져오기
        const projectId = container.dataset.projectId;

        if (!projectId) {
            alert('프로젝트 ID를 찾을 수 없습니다.');
            return;
        }

        // 올바른 URL로 fetch 요청
        fetch(`/project/settings?projectId=${projectId}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error(`서버 응답 오류: ${response.status}`);
                }
                return response.text();
            })
            .then(html => {
                setProjectContent.innerHTML = html;
                modalOverlay.style.display = 'block';
                setProjectModal.style.display = 'block';
            })
            .catch(error => {
                console.error('프로젝트 설정 폼 로딩 오류:', error);
                alert('프로젝트 설정 양식을 불러오는 데 실패했습니다. 콘솔을 확인하세요.');
            });
    });

    function closeModal() {
        modalOverlay.style.display = 'none';
        setProjectModal.style.display = 'none';
        setProjectContent.innerHTML = '';
    }

    modalCloseButton.addEventListener('click', closeModal);
    modalOverlay.addEventListener('click', closeModal);
});
