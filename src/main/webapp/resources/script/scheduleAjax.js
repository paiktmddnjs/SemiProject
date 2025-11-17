document.addEventListener('DOMContentLoaded', function() {
    const workspaceButtonContainer = document.getElementById('WorkspaceButtonContainer');
    const projectButtonContainer = document.getElementById('ProjectButtonContainer');

    workspaceButtonContainer.addEventListener('click', function(e) {
        console.log('체크');

        if(e.target.tagName === 'BUTTON') {
            const workspaceId = e.target.value;

            fetch(`${window.location.origin}/scheduleWorkspace`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: `workspaceSelect=${workspaceId}`
            })
                .then(response => response.json())
                .then(data => {
                    let projectButtonList = '';
                    data.scheduleProjects.forEach(p => {
                        projectButtonList += `<button type="button" class="disactive" value="${p.projectId}">${p.projectName}</button>`;
                    });
                    projectButtonContainer.innerHTML = projectButtonList;

                    Array.from(workspaceButtonContainer.children).forEach(btn => {
                        btn.classList.remove('activated');
                        btn.classList.add('disactive');
                    });
                    e.target.classList.add('activated');
                    e.target.classList.remove('disactive');
                })
                .catch(err => console.error(err));
        }
    });
});