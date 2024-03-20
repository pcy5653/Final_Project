//문서의 로딩을 시작할 때 
//당일 출근기록 확인  

$(document).ready(function(){
    $.ajax({
        type: 'get',
        url: '/attendance/on',
        success: function(result){
            if(result.trim()>0){ //출근기록이 있을 때
                $('#on').css('display', 'none'); //출근하기버튼 숨기기 
                $('#off').css('display', 'block'); //퇴근하기버튼 보여주기
            }
        },
        error: function(){
            alert('관리자에게 문의하세요');
        }
    }) 
})

//당일 퇴근기록 확인
$(document).ready(function(){
    $.ajax({
        type: 'get',
        url: '/attendance/off',
        success: function(result){
            if(result.trim()>0){ //퇴근기록이 있을 때
                $('#off').attr('disabled', true); //퇴근하기버튼 비활성화
            }
        },
        error: function(){
            alert('관리자에게 문의하세요');
        }
    })
})


//출근
function setOn(){
    $.ajax({
      type: 'post',
      url: '/attendance/on',
      success: function(result){
        if(result.trim()>0){
          alert('출근하였습니다');
          $('#on').css('display', 'none');
          $('#off').css('display', 'block');
          attendanceTime(employeeNum, workDate);
        }
      },
      error: function(){
        alert('관리자에게 문의하세요');
      }
    })
}

//퇴근
function setOff(){
  $.ajax({
    type: 'post',
    url: '/attendance/off',
    success: function(result){
      if(result.trim()>0){
        alert('퇴근하였습니다');
        $('#off').attr('disabled', true);
        attendanceTime(employeeNum, workDate);
      }
    },
    error: function(){
      alert('관리자에게 문의하세요');
    }
  })
}

//출근버튼 클릭 시 
$('#on').on('click', function(){
  setOn();
  
})

//퇴근버튼 클릭 시
$('#btn_block').on('click', '#off', function(){
  setOff();
  
})
  