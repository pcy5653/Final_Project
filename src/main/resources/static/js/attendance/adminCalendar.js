//현재 날짜
const today = new Date(); 
//원하는 형식으로 포맷
let formattedDay = moment(today).format("YYYY-MM-DD"); 

//full calendar
document.addEventListener('DOMContentLoaded', function() {
    const calendarEl = document.getElementById('calendar');

    const calendar = new FullCalendar.Calendar(calendarEl, {
    initialView: 'customMonthTimelineView', // 사용자 정의 뷰를 기본 뷰로 설정
    views: {
        customMonthTimelineView: {
        type: 'resourceTimeline', // Timeline View 설정
        duration: { months: 1 }, // 한 달 간격으로 뷰 설정
        }
    },
    customButtons: {
        myCustomButton: {
        text: '당일 근태 확인',
        click: function() {
            getDayList(formattedDay); //당일 근태 목록 불러오기 
        }
        }
    },
    headerToolbar: {
        left: 'myCustomButton', // 사용자 정의 뷰 버튼 추가
        center: 'title',
        right: 'today prev,next' 
    },
    titleFormat: 'YYYY년 M월',
    resources: '/resources',
    resourceAreaHeaderContent: '이름', // 리소스 영역의 헤더 이름 변경
    resourceAreaWidth: '5%',
    events: '/admin/attendance/month'
    });

    calendar.render();
});


//day list
function getDayList(day, page, kind, search){
  $.ajax({
      type: 'get',
      url: '/admin/attendance/day',
      data: {
        workDate: day,
        page: page,
        kind: kind,
        search: search
      },
      success: function(result){
        $('#navs-justified-home').html(result);

        $('#navs-justified-home').find('.kind').each(function(){
            if($(this).val()==$('#k').attr('data-kind')){
                $(this).prop('selected', true);
                return false;
            }
        })

        if(page==undefined){ //페이지 번호를 클릭 안 했을 때
            //페이지 번호가 1인 요소 활성화
            $('#navs-justified-home').find('.page-link[data-num="1"]').parent().addClass('active'); 
        }else{ //페이지 번호를 클릭 시
            //기존에 활성화되어있는 페이지 번호 비활성화
            $('#navs-justified-home').find('.page-link.active').parent().removeClass('active');
            //클릭한 페이지 번호의 요소 활성화
            $('#navs-justified-home').find('.page-link[data-num="'+page+'"]').parent().addClass('active');
        }
        
        // $('#work').attr('data-date', formattedDay);
        // $('#work').text(formattedDay);
      }
  })
}

//월별 근태 조회버튼 클릭 시 
$('#navs-justified-home').on('click', '#month_btn', function(){
    location.reload();
});

//이전버튼(전날) 클릭 시 
$('#navs-justified-home').on('click', '#pre_day', function(){
    //기존 날짜 데이터
    const originalDate = $('#work').attr('data-date');
    //기존 날짜 데이터를 JS Date 객체로 변환
    const dateObject = new Date(originalDate);
    //하루 전의 날짜로 변경
    dateObject.setDate(dateObject.getDate()-1);
    //원하는 형식으로 포맷
    formattedDay = moment(dateObject).format("YYYY-MM-DD");

    getDayList(formattedDay); //해당 날짜의 근태 목록 불러오기 
});

//다음버튼(다음날) 클릭 시
$('#navs-justified-home').on('click', '#next_day', function(){
    //기존 날짜 데이터
    const originalDate = $('#work').attr('data-date');
    //기존 날짜 데이터를 JS Date 객체로 변환
    const dateObject = new Date(originalDate);
    //하루 후의 날짜로 변경
    dateObject.setDate(dateObject.getDate()+1);
    //원하는 형식으로 포맷
    formattedDay = moment(dateObject).format("YYYY-MM-DD");

    getDayList(formattedDay); //해당 날짜의 근태 목록 불러오기 
});


//검색 
$('#navs-justified-home').on('click', '#submit_btn', function(){
    getDayList(formattedDay, $('#page').val(),  $('#k').val(),  $("input[name='search']").val());
});

//paging
$('#navs-justified-home').on('click', '.move', function(){
    const num = $(this).attr('data-num');
    $('#page').val(num);
    getDayList(formattedDay, $('#page').val(),  $('#k').val(),  $("input[name='search']").val());
});