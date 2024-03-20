let phone= $("#btn2").attr("data-phone") ;
let employeeNum= $("#btn2").attr("data-num");
let nameI = $("#btn2").attr("data-name");
$("#btn1").click(function(){
    console.log(nameI);
    $("#findPw").submit();
    
})
$("#btn2").click(function(){
    $.ajax({
        type:"get",
        url:"/phonePw",
        data : {
            phone:phone,
            employeeNum:employeeNum,
            name:nameI
        },
        success: function (result) {
            if(result.trim()==1){
                alert("임시비밀번호가 문자로 전송되었습니다.\n임시비밀번호로 로그인 후 비밀번호를 변경해주세요.")
                window.location.href="/";
            }
        }
    })
})