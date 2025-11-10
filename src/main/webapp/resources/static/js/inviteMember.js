document.addEventListener('DOMContentLoaded', function() {

    // 모달 관련 요소 가져오기
    const modalOverlay = document.getElementById('modalOverlay'); 
    const inviteMemberButton = document.getElementById('inviteMemberButton');
    const inviteMemberModal = document.getElementById('inviteMemberModal');
    const inviteMemberContent = document.getElementById('inviteMemberContent');
    const modalCloseButton = inviteMemberModal.querySelector('.modal-close-button');
    
    // 새 프로젝트 모달 열기 함수
    function openinviteMemberModal() {
        modalOverlay.classList.add('show');
        inviteMemberModal.classList.add('show');

        if (inviteMemberContent.innerHTML.trim() === '') {
            fetch('member/new')
                .then(response => response.text())
                .then(html => {
                    const parser = new DOMParser();
                    const doc = parser.parseFromString(html, 'text/html');
                    const containerBody = doc.querySelector('.container_body');
                    if (containerBody) {
                        inviteMemberContent.innerHTML = containerBody.innerHTML;
                    } else {
                        inviteMemberContent.innerHTML = '<p>Error: Could not load project form.</p>';
                    }
                })
                .catch(error => {
                    console.error('Error loading new_project.jsp:', error);
                    inviteMemberContent.innerHTML = '<p>Error loading content.</p>';
                });
        }
    }

    // 새 프로젝트 모달 닫기 함수
    function closeinviteMemberModal() {
        modalOverlay.classList.remove('show');
        inviteMemberModal.classList.remove('show');
    }

    // 이벤트 리스너 연결
    
    inviteMemberButton.addEventListener('click', openinviteMemberModal);
    modalCloseButton.addEventListener('click', closeinviteMemberModal);
    modalOverlay.addEventListener('click', closeinviteMemberModal);
    
    // 오버레이 클릭 시 모달 닫기
});
