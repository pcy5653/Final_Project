
//full calendar
document.addEventListener('DOMContentLoaded', function() {
    const calendarEl = document.getElementById('calendar');

    const calendar = new FullCalendar.Calendar(calendarEl, {
    initialView: 'dayGridMonth', 
    headerToolbar: {
        left: '',
        center: 'title',
        right: 'today prev,next' 
    },
    titleFormat: 'YYYY년 M월',
    height: '96%',
    fixedWeekCount: false,
    events: '/attendance/month',

    //이벤트 클릭 시 
    eventClick: function(info) {
        console.log(info)
        const date = moment(info.event.start).format('M월 DD일'); //날짜
        const state = info.event.title; //상태
        const on = info.event.extendedProps.onTime; //출근시간
        const off = info.event.extendedProps.offTime; //퇴근시간
        $('#date').text(date);
        $('#state').text(state);
        $('#on').text(on);
        $('#off').text(off);

        if(state == '결근'){ //결근일 때 출퇴근 시간 숨기기
            $('.tt').css('display', 'none');
        }

        $('#smallModal').modal('show'); //모달 활성화
     }
    });
    //캘린더 그리기
    calendar.render();
});

//근태수정요청 버튼 클릭 시 
$('#req_btn').on('click', function(){
    $(location).attr('href', '/attendanceModify/add');
})