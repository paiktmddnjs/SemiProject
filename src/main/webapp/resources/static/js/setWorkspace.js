document.addEventListener('DOMContentLoaded', function () {
    const setWorkspaceButton = document.getElementById('setWorkspaceButton');
    if (!setWorkspaceButton) return;

    const modalOverlay = document.getElementById('modalOverlay');
    const setWorkspaceModal = document.getElementById('setWorkspaceModal');
    
    if (!modalOverlay || !setWorkspaceModal) return;

    const modalCloseButton = setWorkspaceModal.querySelector('.modal-close-button');
    const setWorkspaceContent = document.getElementById('setWorkspaceContent');
    const container = document.querySelector('.container');

    setWorkspaceButton.addEventListener('click', () => {
        const workspaceId = container.dataset.workspaceId;
        
        if (!workspaceId) {
            alert('워크스페이스 ID를 찾을 수 없습니다.');
            return;
        }

        // fetch URL을 /workspace/settings에서 /workspace/set으로 변경
        fetch(`/workspace/set?workspaceId=${workspaceId}`)
            .then(response => response.text())
            .then(html => {
                setWorkspaceContent.innerHTML = html;
                modalOverlay.style.display = 'block';
                setWorkspaceModal.style.display = 'block';

                const setWorkspaceForm = document.getElementById('setWorkspaceForm');
                if (setWorkspaceForm) {
                    setWorkspaceForm.addEventListener('submit', function (e) {
                        e.preventDefault();

                        const formData = new FormData(setWorkspaceForm);
                        
                        fetch(setWorkspaceForm.action, {
                            method: 'POST',
                            body: formData
                        })
                        .then(response => {
                            if (response.redirected) {
                                window.location.href = response.url;
                            } else if (response.ok) {
                                closeModal();
                                location.reload();
                            } else {
                                throw new Error('워크스페이스 업데이트에 실패했습니다.');
                            }
                        })
                        .catch(error => {
                            console.error('워크스페이스 업데이트 오류:', error);
                            alert('워크스페이스 정보 수정 중 오류가 발생했습니다.');
                        });
                    });
                }
            })
            .catch(error => {
                console.error('워크스페이스 설정 폼 로딩 오류:', error);
                alert('워크스페이스 설정 양식을 불러오는 데 실패했습니다.');
            });
    });

    function closeModal() {
        modalOverlay.style.display = 'none';
        setWorkspaceModal.style.display = 'none';
        if (setWorkspaceContent) {
            setWorkspaceContent.innerHTML = '';
        }
    }

    if (modalCloseButton) {
        modalCloseButton.addEventListener('click', closeModal);
    }
    
    modalOverlay.addEventListener('click', () => {
        if (setWorkspaceModal.style.display === 'block') {
            closeModal();
        }
    });
});
