document.addEventListener('DOMContentLoaded', function () {
    const inviteMemberButton = document.getElementById('inviteMemberButton');
    if (!inviteMemberButton) return;

    const modalOverlay = document.getElementById('modalOverlay');
    const inviteMemberModal = document.getElementById('inviteMemberModal');
    
    if (!modalOverlay || !inviteMemberModal) return;

    const modalCloseButton = inviteMemberModal.querySelector('.modal-close-button');
    const inviteMemberContent = document.getElementById('inviteMemberContent');
    const container = document.querySelector('.container');

    inviteMemberButton.addEventListener('click', () => {
        const workspaceId = container.dataset.workspaceId;
        
        if (!workspaceId) {
            alert('워크스페이스 ID를 찾을 수 없습니다.');
            return;
        }

        fetch(`/member/new?workspaceId=${workspaceId}`)
            .then(response => response.text())
            .then(html => {
                inviteMemberContent.innerHTML = html;
                modalOverlay.style.display = 'block';
                inviteMemberModal.style.display = 'block';

                const inviteMemberForm = document.getElementById('inviteMemberForm');
                if (inviteMemberForm) {
                    inviteMemberForm.addEventListener('submit', function (e) {
                        console.log('폼 제출(submit) 이벤트를 가로챘습니다.'); // <-- 디버깅 로그 추가
                        e.preventDefault(); // 기본 폼 제출 방지

                        const formData = new FormData(inviteMemberForm);
                        console.log('서버로 전송할 데이터:', Object.fromEntries(formData)); // <-- 디버깅 로그 추가
                        
                        fetch(inviteMemberForm.action, {
                            method: 'POST',
                            body: formData
                        })
                        .then(response => response.json())
                        .then(data => {
                            alert(data.message);
                            if (data.success) {
                                closeModal();
                                location.reload();
                            }
                        })
                        .catch(error => {
                            console.error('멤버 초대 오류:', error);
                            alert('멤버 초대 중 오류가 발생했습니다.');
                        });
                    });
                }
            })
            .catch(error => {
                console.error('멤버 초대 폼 로딩 오류:', error);
                alert('멤버 초대 양식을 불러오는 데 실패했습니다.');
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
