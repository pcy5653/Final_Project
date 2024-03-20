
document.addEventListener('DOMContentLoaded', function() {
    getRequestList();
});

//근태 수정 요청 목록
function getRequestList(page, kind, search){
    $.ajax({
        type: 'get',
        url: '/admin/attendanceModify/list',
        data: {
            page: page,
             kind: kind,
           search: search
          },
        success: function(result){
            $('#navs-justified-profile').html(result);

            $('#navs-justified-profile').find('.kind').each(function(){
                if($(this).val()==$('#k').attr('data-kind')){
                    $(this).prop('selected', true);
                    return false;
                }
            });

            if(page==undefined){ //페이지 번호를 클릭 안 했을 때
                //페이지 번호가 1인 요소 활성화
                $('#navs-justified-profile').find('.page-link[data-num="1"]').parent().addClass('active'); 
            }else{ //페이지 번호를 클릭 시
                //기존에 활성화되어있는 페이지 번호 비활성화
                $('#navs-justified-profile').find('.page-link.active').parent().removeClass('active');
                //클릭한 페이지 번호의 요소 활성화
                $('#navs-justified-profile').find('.page-link[data-num="'+page+'"]').parent().addClass('active');
            }
        }
    })
}

//검색
$('#navs-justified-profile').on('click', '#search_btn', function(){
    getRequestList($('#page').val(),  $('#k').val(),  $("input[name='search']").val());
});

//paging
$('#navs-justified-profile').on('click', '.move', function(){
    let num = $(this).attr('data-num');
    $('#page').val(num);
    getRequestList($('#page').val(),  $('#k').val(),  $("input[name='search']").val());
});



