document.addEventListener('DOMContentLoaded', function() {
    // 탭 리스트와 모든 탭 요소를 가져옵니다.
    const tabList = document.querySelector('.tab_list');
    const tabs = document.querySelectorAll('.tab');
    
    // 모든 프로젝트 박스 요소를 가져옵니다.
    const contentBox = document.getElementById('contentBox');
    const projectBoxes = contentBox.querySelectorAll('.box');

    // 모달 관련 요소 가져오기
    const createWorkspaceButton = document.getElementById('createWorkspaceButton');
    const modalOverlay = document.getElementById('modalOverlay');
    const newWorkspaceModal = document.getElementById('newWorkspaceModal');
    const newWorkspaceContent = document.getElementById('newWorkspaceContent');
    const modalCloseButton = newWorkspaceModal.querySelector('.modal-close-button');

    // 탭 리스트에 클릭 이벤트 리스너를 추가합니다. (이벤트 위임)
    tabList.addEventListener('click', (event) => {
        const clickedTab = event.target.closest('.tab');
        if (!clickedTab) return; // 탭이 아닌 다른 곳을 클릭하면 무시

        // 1. 모든 탭에서 'choice' 클래스 제거
        tabs.forEach(tab => {
            tab.classList.remove('choice');
        });

        // 2. 클릭된 탭에 'choice' 클래스 추가
        clickedTab.classList.add('choice');

        // 3. 클릭된 탭의 data-channel 값을 가져옵니다.
        const channelToShow = clickedTab.dataset.channel;

        // 4. 프로젝트 박스를 필터링하여 보여줍니다.
        projectBoxes.forEach(box => {
            // '전체보기'를 클릭했거나, 박스의 채널이 클릭된 탭의 채널과 일치하면 보여줍니다.
            const boxChannel = box.dataset.channel;
            box.style.display = (channelToShow === 'all' || channelToShow === boxChannel) ? 'flex' : 'none';
        });
    });

    // 새 워크스페이스 모달 열기 함수
    function openNewWorkspaceModal() {
        modalOverlay.style.display = 'block'; // 오버레이 표시
        newWorkspaceModal.style.display = 'block'; // 모달 표시

        // new_workspace.html 내용을 한 번만 로드
        if (newWorkspaceContent.innerHTML.trim() === '') {
            fetch('/workspace/new')
                .then(response => response.text())
                .then(html => {
                    // HTML 문자열을 DOM 파서로 파싱
                    const parser = new DOMParser();
                    const doc = parser.parseFromString(html, 'text/html');
                    
                    // new_workspace.html의 <div class="container_body"> 부분만 추출
                    const containerBody = doc.querySelector('.container_body');
                    if (containerBody) {
                        newWorkspaceContent.innerHTML = containerBody.innerHTML;
                    } else {
                        newWorkspaceContent.innerHTML = '<p>Error: Could not load workspace form.</p>';
                    }
                })
                .catch(error => {
                    console.error('Error loading new_workspace.html:', error);
                    newWorkspaceContent.innerHTML = '<p>Error loading content.</p>';
                });
        }
    }

    // 새 워크스페이스 모달 닫기 함수
    function closeNewWorkspaceModal() {
        modalOverlay.style.display = 'none'; // 오버레이 숨김
        newWorkspaceModal.style.display = 'none'; // 모달 숨김
    }

    // [+ 새 워크스페이스] 버튼 클릭 이벤트 리스너
    createWorkspaceButton.addEventListener('click', openNewWorkspaceModal);
    modalCloseButton.addEventListener('click', closeNewWorkspaceModal);
    modalOverlay.addEventListener('click', closeNewWorkspaceModal); // 오버레이 클릭 시 모달 닫기
});