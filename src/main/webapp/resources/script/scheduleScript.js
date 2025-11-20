// 홈페이지 로드 완료시 자동 실행 설정
document.addEventListener('DOMContentLoaded', function() {

    <!-- 변수 calendarEl 에 calendar id의 dom 요소를 가져와 저장한다. -->
    <!-- calendarEl은 FullCalendar의 캘린더 컨테이너가 된다. -->
    const calendarEl = document.getElementById('calendar');
    <!-- 새로운 FullCalendar 객체인 calendar 객체를 생성한다 -->
    <!-- calendarEl의 dom 요소를 기반으로 생성 (첫번째 매개변수) -->
    <!-- 캘린더 옵션을 설정 가능 (두번쨰 매개변수) -->
    const calendar = new FullCalendar.Calendar(calendarEl, {
        <!-- initialView : 기본 뷰 설정 (dayGridMonth는 월간 달력 뷰) -->
        <!-- timeGridWeek, timeGridDay, listWeek 등이 존재 -->
        initialView: 'dayGridMonth',
        dayMaxEvents: 2, // 한 날짜에 보이는 최대 이벤트 수 제한
        eventTextColor: '#ffffff', //이벤트 색상 지정

        /*날짜표시 한글로 변경*/
        titleFormat: function(date){
            const year = date.date.year;
            const month = date.date.month+1;
            return year + '년 ' + month + '월'
        },

        /*날짜변경 버튼 텍스트 변경*/
        buttonText:{
            prev: '◀',
            next: '▶',
        },

        /* headerToolbar를 조정하는것으로 버튼 순서 변경이 가능 */
        headerToolbar:{
            left: 'prev',
            center: 'title',
            right: 'next'
        },

        height: 700,          // 높이를 700으로 고정
        contentHeight: 600,
        <!-- events : 일정 설정 -->
        <!-- title: 일정명, start: 시작일, end: 마감일 -->
        events: [
            { title: '업무1', start: '2025-11-05', end: '2025-11-11', className: 'first-event' },
            { title: '업무2', start: '2025-11-08', end: '2025-11-11', className: 'second-event' },
            { title: '업무3', start: '2025-11-09', end: '2025-11-15', className: 'third-event' },
        ],

        /*
        dayCellDidMount: function(info){

            const date = info.date;
            const events = info.view.calendar.getEvents();

            //현재 날짜와 같은 start를 가진 이벤트가 있는지 확인
            const hasEvent = events.some(event => {
                const start = event.start;
                const end = event.end || start;  // end가 없으면 단일 날짜 이벤트
                const adjustedEnd = new Date(end);
                adjustedEnd.setDate(adjustedEnd.getDate() - 1);

                return date >= start && date <= adjustedEnd;
            });

            //이벤트가 있으면 스타일 적용
            if(hasEvent){

                //이 날짜가 이번달이 아니라면
                if(info.el.classList.contains('fc-day-other')){
                    info.el.classList.add('event-other-month');
                } else{
                    info.el.classList.add('event-current-month');
                }
            }
        }
        */
    });
    <!-- 캘린더를 실제 화면에 렌더링 -->
    calendar.render();
});