document.addEventListener('DOMContentLoaded', function () {
    // --- 탭 필터링 기능 ---
    const tabs = document.querySelectorAll('.tab');
    const workspaceLinks = document.querySelectorAll('.box-link');

    if (tabs.length > 0 && workspaceLinks.length > 0) {
        tabs.forEach(tab => {
            tab.addEventListener('click', () => {
                // 모든 탭에서 'choice' 클래스 제거
                tabs.forEach(t => t.classList.remove('choice'));
                // 클릭된 탭에 'choice' 클래스 추가
                tab.classList.add('choice');

                const selectedChannel = tab.dataset.channel;

                workspaceLinks.forEach(link => {
                    const box = link.querySelector('.box');
                    if (!box) return;

                    const boxChannel = box.dataset.channel;

                    if (selectedChannel === 'all' || boxChannel === selectedChannel) {
                        link.style.display = 'block'; // a 태그를 보여줌
                    } else {
                        link.style.display = 'none'; // a 태그를 숨김
                    }
                });
            });
        });
    }

    // 참고: '+ 새 워크스페이스' 모달 기능은 이제 공통 modal.js에서 처리합니다.
});
