
const data = $('#k').attr('data-kind');

$('.kind').each(function(){
    if($(this).val()==data){
        $(this).prop('selected', true);
        return;
    }
})

//페이지 번호 클릭 시 
$('.pagination').on('click', '.move', function(){
    const num = $(this).attr('data-num');
    $('#page').val(num);
    $('#frm').submit();
})

