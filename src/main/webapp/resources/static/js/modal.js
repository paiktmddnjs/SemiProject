document.addEventListener('DOMContentLoaded', function () {
    const modalTriggers = document.querySelectorAll('[data-modal-target]');
    if (modalTriggers.length === 0) return;

    const modalOverlay = document.getElementById('modalOverlay');
    if (!modalOverlay) return;

    modalTriggers.forEach(button => {
        button.addEventListener('click', () => {
            const modalId = button.dataset.modalTarget;
            const modal = document.getElementById(modalId);
            const url = button.dataset.modalUrl;

            if (!modal || !url) {
                console.error('Modal or URL not found for button:', button);
                return;
            }

            const modalContent = modal.querySelector('.modal-content-target');
            if (!modalContent) return;

            fetch(url)
                .then(response => {
                    if (!response.ok) throw new Error('Network response was not ok.');
                    return response.text();
                })
                .then(html => {
                    modalContent.innerHTML = html;
                    modalOverlay.classList.add('is-open');
                    modal.classList.add('is-open');

                    const form = modal.querySelector('form');
                    if (form) {
                        form.addEventListener('submit', function (e) {
                            e.preventDefault();
                            const formData = new FormData(form);

                            fetch(form.action, {
                                method: 'POST',
                                body: formData
                            })
                            .then(response => {
                                if (response.redirected) {
                                    window.location.href = response.url;
                                } else {
                                    return response.json().then(data => {
                                        alert(data.message);
                                        if (data.success) {
                                            closeModal(modal);
                                            location.reload();
                                        }
                                    });
                                }
                            })
                            .catch(error => {
                                console.error('Form submission error:', error);
                                alert('요청 처리 중 오류가 발생했습니다.');
                            });
                        });
                    }
                })
                .catch(error => {
                    console.error('Modal content loading error:', error);
                    alert('콘텐츠를 불러오는 데 실패했습니다.');
                });
        });
    });

    function closeModal(modal) {
        if (modal) {
            modal.classList.remove('is-open');
        }
        
        const anyModalOpen = document.querySelector('.modal-container.is-open');
        if (!anyModalOpen) {
            modalOverlay.classList.remove('is-open');
        }
    }

    modalOverlay.addEventListener('click', (e) => {
        if (e.target === modalOverlay) {
            document.querySelectorAll('.modal-container.is-open').forEach(closeModal);
        }
    });

    document.querySelectorAll('.modal-close-button').forEach(button => {
        button.addEventListener('click', () => {
            const modal = button.closest('.modal-container');
            if (modal) closeModal(modal);
        });
    });
});
