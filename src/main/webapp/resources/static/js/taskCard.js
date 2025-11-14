document.addEventListener('DOMContentLoaded', function () {
    const taskContainer = document.querySelector('.task-status-container');
    if (!taskContainer) return;

    // --- 진행률 업데이트 함수 ---
    function updateProgressBar() {
        const allTaskCards = document.querySelectorAll('.task-card');
        let totalTasks = allTaskCards.length;
        let completedTasks = 0;

        allTaskCards.forEach(card => {
            // task-card의 부모 요소가 어떤 task-list인지 확인하여 상태를 파악
            const parentListId = card.closest('.task-list')?.id;
            if (parentListId === 'complete-list') {
                completedTasks++;
            }
        });

        let calculatedProgress = 0;
        if (totalTasks > 0) {
            calculatedProgress = Math.round((completedTasks / totalTasks) * 100);
        }

        const progressBarFill = document.querySelector('.progress-bar-fill');
        const progressBarText = document.querySelector('.progress-bar-text');

        if (progressBarFill) {
            progressBarFill.style.width = `${calculatedProgress}%`;
        }
        if (progressBarText) {
            progressBarText.textContent = `${calculatedProgress}%`;
        }
    }

    // CSRF 토큰이 필요한 경우 헤더에 추가 (Spring Security 사용 시)
    // const csrfToken = document.querySelector('meta[name="_csrf"]').content;
    // const csrfHeader = document.querySelector('meta[name="_csrf_header"]').content;

    // 상태 변경 처리
    taskContainer.addEventListener('change', function (e) {
        if (e.target.classList.contains('status-select')) {
            const selectElement = e.target;
            const taskId = selectElement.dataset.taskId;
            const newStatus = selectElement.value;
            const taskCard = selectElement.closest('.task-card');

            const formData = new FormData();
            formData.append('taskId', taskId);
            formData.append('status', newStatus);

            fetch('/task/update/status', {
                method: 'POST',
                body: formData,
                // headers: { [csrfHeader]: csrfToken } // CSRF 토큰 추가
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    console.log(data.message);
                    // 작업 카드를 올바른 열로 이동
                    const targetList = document.getElementById(`${newStatus}-list`);
                    if (targetList) {
                        targetList.appendChild(taskCard);
                        // --- 진행률 업데이트 함수 호출 ---
                        updateProgressBar();
                    }
                } else {
                    throw new Error(data.message || '상태 업데이트에 실패했습니다.');
                }
            })
            .catch(error => {
                console.error('상태 업데이트 오류:', error);
                alert(error.message);
                // 실패 시 드롭다운을 원래 상태로 되돌릴 수 있음 (선택적)
            });
        }
    });

    // 담당자 변경 처리
    taskContainer.addEventListener('change', function (e) {
        if (e.target.classList.contains('assignee-select')) {
            const selectElement = e.target;
            const taskId = selectElement.dataset.taskId;
            const newAssigneeId = selectElement.value;

            const formData = new FormData();
            formData.append('taskId', taskId);
            formData.append('workspaceMemberId', newAssigneeId);

            fetch('/task/update/assignee', {
                method: 'POST',
                body: formData,
                // headers: { [csrfHeader]: csrfToken } // CSRF 토큰 추가
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    console.log(data.message);
                    // 담당자 변경은 진행률에 영향을 주지 않으므로 진행률 업데이트는 호출하지 않음
                } else {
                    throw new Error(data.message || '담당자 업데이트에 실패했습니다.');
                }
            })
            .catch(error => {
                console.error('담당자 업데이트 오류:', error);
                alert(error.message);
            });
        }
    });

    // 페이지 로드 시 초기 진행률 설정 (선택 사항: 컨트롤러에서 이미 설정하고 있으므로 중복될 수 있음)
    // updateProgressBar(); 
});
