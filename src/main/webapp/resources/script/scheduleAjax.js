document.addEventListener('DOMContentLoaded', function() {
    const workspaceButtonContainer = document.getElementById('WorkspaceButtonContainer');
    const projectButtonContainer = document.getElementById('ProjectButtonContainer');
    const eventList = document.getElementById('eventList');

    workspaceButtonContainer.addEventListener('click', function(e) {

        if(e.target.tagName === 'BUTTON') {
            const workspaceId = e.target.value;
            const workspaceName = e.target.textContent;
            var num = 1;

            fetch(`${window.location.origin}/scheduleWorkspace`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: `workspaceSelect=${workspaceId}`
            })
                .then(response => response.json())
                .then(data => {
                    let projectButtonList = '<button type="button" class="activated" value=0>전체</button>';
                    data.scheduleProjects.forEach(p => {
                        projectButtonList += `<button type="button" class="disactive" value=${p.projectId}>${p.projectName}</button>`;
                    });
                    projectButtonContainer.innerHTML = projectButtonList;

                    calendar.removeAllEvents();
                    data.scheduleCalendar.forEach(p => {
                        calendar.addEvent({
                            title: `${p.taskName}`,
                            start: `${p.taskStart}`,
                            end: `${p.taskDeadline}`,
                            className: `eventColor${num}`
                        });
                        console.log(num);
                        num +=1;
                    });

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
                    W_id = data.W_id;
                    P_id = data.P_id;
                    console.log(`워크스페이스 id : ${W_id}`);
                    console.log(`프로젝트 id : ${P_id}`);
                })
                .catch(err => console.error(err));
        }
    });

    projectButtonContainer.addEventListener('click', function(e) {

        if(e.target.tagName === 'BUTTON') {
            const projectId = e.target.value;
            var num = 1;

            fetch(`${window.location.origin}/scheduleProject`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: `workspaceId=` + W_id + `&projectSelect=${projectId}`
            })
                .then(response => response.json())
                .then(data => {
                    calendar.removeAllEvents();

                    data.scheduleCalendar.forEach(p => {
                        calendar.addEvent({
                            title: `${p.taskName}`,
                            start: `${p.taskStart}`,
                            end: `${p.taskDeadline}`,
                            className: `eventColor${num}`
                        });
                        console.log(num);
                        num +=1;
                    });

                    Array.from(projectButtonContainer.children).forEach(btn => {
                        btn.classList.remove('activated');
                        btn.classList.add('disactive');
                    });
                    e.target.classList.add('activated');
                    e.target.classList.remove('disactive');
                    P_id = data.P_id;
                    console.log(`워크스페이스 id : ${W_id}`);
                    console.log(`프로젝트 id : ${P_id}`);
                })
                .catch(err => console.error(err));
        }
    });

    function dateEvent(dateStr){
        fetch(`${window.location.origin}/scheduleCalendar`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: `dateSelect=${dateStr}`
        })
            .then(response => response.json())
            .then(data =>{
                let taskList = '';
                data.dailyTask.forEach(p =>{
                    taskList += `
                                <li>
                                    <div class="keywordContainer">
                                        <div class="keyword_type">${p.workspaceName}</div>
                                        <div class="keyword_event">${p.projectName}</div>
                                        <div class="keyword_state">진행중</div>
                                    </div>
                                    <h3>&nbsp;${p.taskName}</h3>
                                    <p>${p.taskAssign}</p>
                                </li>
                                `;
                });
            eventList.innerHTML = taskList;
            })
            .catch(err => console.error(err));
    }
});