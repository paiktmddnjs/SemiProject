document.addEventListener('DOMContentLoaded', function () {
    const createWorkspaceButton = document.getElementById('createWorkspaceButton');
    const modalOverlay = document.getElementById('modalOverlay');
    const newWorkspaceModal = document.getElementById('newWorkspaceModal');
    const modalCloseButton = newWorkspaceModal.querySelector('.modal-close-button');
    const newWorkspaceContent = document.getElementById('newWorkspaceContent');

    // '+ 새 워크스페이스' 버튼 클릭 이벤트
    createWorkspaceButton.addEventListener('click', function () {
        // 서버로부터 new_workspace.jsp 내용을 가져와 모달에 삽입
        fetch('/workspace/new') // WorkspaceController의 getNewWorkspaceForm 메소드 호출
            .then(response => {
                if (!response.ok) {
                    throw new Error('네트워크 응답이 올바르지 않습니다.');
                }
                return response.text(); // 응답을 텍스트(HTML)로 변환
            })
            .then(html => {
                newWorkspaceContent.innerHTML = html; // 가져온 HTML을 모달 내용 영역에 삽입
                modalOverlay.style.display = 'block'; // 모달 오버레이 보이기
                newWorkspaceModal.style.display = 'block'; // 모달 창 보이기
            })
            .catch(error => {
                console.error('새 워크스페이스 폼을 불러오는 중 오류 발생:', error);
                alert('워크스페이스 생성 양식을 불러오는 데 실패했습니다.');
            });
    });

    // 모달 닫기 버튼 클릭 이벤트
    modalCloseButton.addEventListener('click', function () {
        modalOverlay.style.display = 'none';
        newWorkspaceModal.style.display = 'none';
        newWorkspaceContent.innerHTML = ''; // 모달 내용 비우기
    });

    // 모달 오버레이 클릭 시 닫기
    modalOverlay.addEventListener('click', function () {
        modalOverlay.style.display = 'none';
        newWorkspaceModal.style.display = 'none';
        newWorkspaceContent.innerHTML = ''; // 모달 내용 비우기
    });

    // 탭 필터링 기능 (기존에 있었다면 유지)
    const tabs = document.querySelectorAll('.tab');
    const boxes = document.querySelectorAll('.box');

    tabs.forEach(tab => {
        tab.addEventListener('click', () => {
            // 모든 탭에서 'choice' 클래스 제거
            tabs.forEach(t => t.classList.remove('choice'));
            // 클릭된 탭에 'choice' 클래스 추가
            tab.classList.add('choice');

            const channel = tab.getAttribute('data-channel');

            boxes.forEach(box => {
                if (channel === 'all' || box.getAttribute('data-channel') === channel) {
                    box.style.display = 'block';
                } else {
                    box.style.display = 'none';
                }
            });
        });
    });
});