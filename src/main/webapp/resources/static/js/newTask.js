document.addEventListener('DOMContentLoaded', function () {
    const createTaskButton = document.getElementById('createTaskButton');
    if (!createTaskButton) return;

    // 새 작업 모달은 newProjectModal을 재사용하지 않고 별도로 만듭니다.
    const newTaskModal = document.getElementById('newTaskModal');
    if (!newTaskModal) return;

    const modalOverlay = document.getElementById('modalOverlay');
    const modalCloseButton = newTaskModal.querySelector('.modal-close-button');
    const newTaskContent = document.getElementById('newTaskContent');
    const container = document.querySelector('.container');

    createTaskButton.addEventListener('click', () => {
        const projectId = container.dataset.projectId;
        
        if (!projectId) {
            alert('프로젝트 ID를 찾을 수 없습니다.');
            return;
        }

        fetch(`/task/new?projectId=${projectId}`)
            .then(response => response.text())
            .then(html => {
                newTaskContent.innerHTML = html;
                modalOverlay.style.display = 'block';
                newTaskModal.style.display = 'block';

                const newTaskForm = document.getElementById('newTaskForm');
                if (newTaskForm) {
                    newTaskForm.addEventListener('submit', function (e) {
                        e.preventDefault();
                        const formData = new FormData(newTaskForm);
                        
                        fetch(newTaskForm.action, {
                            method: 'POST',
                            body: formData
                        })
                        .then(response => {
                            if (response.redirected) {
                                window.location.href = response.url;
                            } else {
                                throw new Error('작업 생성에 실패했습니다.');
                            }
                        })
                        .catch(error => {
                            console.error('새 작업 생성 오류:', error);
                            alert('새 작업 생성 중 오류가 발생했습니다.');
                        });
                    });
                }
            })
            .catch(error => {
                console.error('새 작업 폼 로딩 오류:', error);
                alert('새 작업 양식을 불러오는 데 실패했습니다.');
            });
    });

    function closeModal() {
        modalOverlay.style.display = 'none';
        newTaskModal.style.display = 'none';
        if (newTaskContent) {
            newTaskContent.innerHTML = '';
        }
    }

    if (modalCloseButton) {
        modalCloseButton.addEventListener('click', closeModal);
    }
    
    modalOverlay.addEventListener('click', () => {
        if (newTaskModal.style.display === 'block') {
            closeModal();
        }
    });
});
