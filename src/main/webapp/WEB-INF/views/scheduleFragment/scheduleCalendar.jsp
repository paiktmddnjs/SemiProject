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

    document.addEventListener('DOMContentLoaded', function() {
        let eventColor = ["apple", "banana", "cherry"];
        const calendarEl = document.getElementById('calendar');
        calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            dayMaxEvents: 2, // 한 날짜에 보이는 최대 이벤트 수 제한
            eventTextColor: '#ffffff', //이벤트 색상 지정
            displayEventTime: false,

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

            events: [
                <c:forEach var="c" items="${calendar}">
                { title: '${c.taskName}', start: '${c.taskStart}', end: '${c.taskDeadline}', className: 'eventColor${c.taskId}'},
                </c:forEach>
            ],

        });

        calendar.render();
    });
</script>