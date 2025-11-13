document.addEventListener('DOMContentLoaded', function () {
    const inviteMemberButton = document.getElementById('inviteMemberButton');
    if (!inviteMemberButton) return;

    const modalOverlay = document.getElementById('modalOverlay');
    const inviteMemberModal = document.getElementById('inviteMemberModal');
    
    // 모달 관련 요소들이 페이지에 없을 수도 있으므로 null 체크
    if (!modalOverlay || !inviteMemberModal) return;

    const modalCloseButton = inviteMemberModal.querySelector('.modal-close-button');
    const inviteMemberContent = document.getElementById('inviteMemberContent');
    const container = document.querySelector('.container'); // workspaceId를 가져오기 위함

    inviteMemberButton.addEventListener('click', () => {
        const workspaceId = container.dataset.workspaceId;
        
        if (!workspaceId) {
            alert('워크스페이스 ID를 찾을 수 없습니다.');
            return;
        }

        // 서버에 멤버 초대 폼을 요청
        fetch(`/member/invite?workspaceId=${workspaceId}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error(`서버 응답 오류: ${response.status}`);
                }
                return response.text();
            })
            .then(html => {
                inviteMemberContent.innerHTML = html;
                modalOverlay.style.display = 'block';
                inviteMemberModal.style.display = 'block';

                // --- AJAX 폼 제출 로직 추가 (선택 사항: 나중에 구현) ---
                // const inviteMemberForm = document.getElementById('inviteMemberForm');
                // if (inviteMemberForm) {
                //     inviteMemberForm.addEventListener('submit', function (e) {
                //         e.preventDefault();
                //         const formData = new FormData(inviteMemberForm);
                //         fetch(inviteMemberForm.action, {
                //             method: 'POST',
                //             body: formData
                //         })
                //         .then(response => response.json()) // 또는 response.text()
                //         .then(data => {
                //             console.log('초대 응답:', data);
                //             closeModal();
                //             // 성공 메시지 표시 또는 페이지 새로고침
                //             location.reload();
                //         })
                //         .catch(error => {
                //             console.error('멤버 초대 오류:', error);
                //             alert('멤버 초대 중 오류가 발생했습니다.');
                //         });
                //     });
                // }
            })
            .catch(error => {
                console.error('멤버 초대 폼 로딩 오류:', error);
                alert('멤버 초대 양식을 불러오는 데 실패했습니다. 콘솔을 확인하세요.');
            });
    });

    function closeModal() {
        modalOverlay.style.display = 'none';
        inviteMemberModal.style.display = 'none';
        if (inviteMemberContent) {
            inviteMemberContent.innerHTML = '';
        }
    }

    if (modalCloseButton) {
        modalCloseButton.addEventListener('click', closeModal);
    }
    
    modalOverlay.addEventListener('click', () => {
        if (inviteMemberModal.style.display === 'block') {
            closeModal();
        }
    });
});
