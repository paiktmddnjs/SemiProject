document.addEventListener('DOMContentLoaded', function() {
    const workspaceButtonContainer = document.getElementById('WorkspaceButtonContainer');
    const projectButtonContainer = document.getElementById('ProjectButtonContainer');

    workspaceButtonContainer.addEventListener('click', function(e) {

        if(e.target.tagName === 'BUTTON') {
            const workspaceId = e.target.value;
            const workspaceName = e.target.textContent;

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

                    document.getElementById('whole-title').textContent = `${workspaceName} 현황`;
                    document.getElementById('whole-todo').textContent = `${data.statusTodo}건`;
                    document.getElementById('whole-progress').textContent = `${data.statusProgress}건`;
                    document.getElementById('whole-completed').textContent = `${data.statusComplete}건`;

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

    projectButtonContainer.addEventListener('click', function(e) {

        if(e.target.tagName === 'BUTTON') {
            const projectId = e.target.value;

            fetch(`${window.location.origin}/scheduleProject`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: `projectSelect=${projectId}`
            })
                .then(response => response.json())
                .then(data => {
                    calendar.removeAllEvents();

                    data.scheduleCalendar.forEach(p => {
                        calendar.addEvent({
                            title: `${p.taskName}`,
                            start: `${p.taskStart}`,
                            end: `${p.taskDeadline}`,
                            className: `eventColor${p.taskId}`
                        });
                    });

                    Array.from(projectButtonContainer.children).forEach(btn => {
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