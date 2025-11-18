<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 25. 11. 17.
  Time: 오전 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="calendar"></div>

<script>
    let calendar;

    function dateEvent(dateStr){
        console.log("받은 데이터 : " + dateStr);
        const eventDate = document.getElementById('eventDate');
        const eventMany = document.getElementById('eventMany');
        let fetchContainer;
        var num = 0;

        if(P_id!=0){
            fetchContainer=fetch(`${window.location.origin}/scheduleProjectDate`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: `projectId=` + P_id + `&dateSelect=` + dateStr
            })
        } else if(W_id!=0){
            fetchContainer=fetch(`${window.location.origin}/scheduleWorkspaceDate`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: `workspaceId=` + W_id + `&dateSelect=` + dateStr
            })
        } else{
            fetchContainer=fetch(`${window.location.origin}/scheduleMemberNoDate`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: `memberId=` + memberId + `&dateSelect=` + dateStr
            })
        }
        fetchContainer
            .then(response => response.json())
            .then(data =>{
                eventDate.textContent = dateStr;
                let taskList = '';
                data.dailyTask.forEach(p=>{

                    taskList += '<li><div class="keywordContainer"><div class="keyword_type">' + p.workspaceName + '</div>';
                    taskList += '<div class="keyword_event">' +  p.projectName + '</div>';
                    taskList += '<div class="keyword_state">진행중</div>';
                    taskList += '</div>';
                    taskList += '<h3>&nbsp;'+p.taskName+'</h3><p>'+p.taskAssign+'</p></li>';

                    num += 1;
                });
                eventList.innerHTML = taskList;
                eventMany.textContent = num + '개의 일정';
            })
            .catch(err => console.error(err));
    }

    document.addEventListener('DOMContentLoaded', function() {
        let eventColor = ["apple", "banana", "cherry"];
        const calendarEl = document.getElementById('calendar');
        calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            dayMaxEvents: 2, // 한 날짜에 보이는 최대 이벤트 수 제한
            eventTextColor: '#ffffff', //이벤트 색상 지정
            displayEventTime: false,
            eventDidMount: function(info) {
                info.el.style.pointerEvents = 'none';
            },

            titleFormat: function(date){
                const year = date.date.year;
                const month = date.date.month+1;
                return year + '년 ' + month + '월'
            },

            buttonText:{
                prev: '◀',
                next: '▶',
            },

            headerToolbar:{
                left: 'prev',
                center: 'title',
                right: 'next'
            },

            height: 700,          // 높이를 700으로 고정
            contentHeight: 600,

            dateClick: function(info){
                console.log(info.dateStr);
                if(typeof dateEvent === 'function'){
                    console.log('데이터 전달 체크');
                    dateEvent(info.dateStr);
                } else{
                    console.log('데이터 전달 실패');
                    console.log(typeof dateEvent);
                }
            },

            events: [
                <c:forEach var="c" items="${calendar}">
                { title: '${c.taskName}', start: '${c.taskStart}', end: '${c.taskDeadline}', className: 'eventColor${c.taskId}'},
                </c:forEach>
            ],

        });

        calendar.render();
    });
</script>