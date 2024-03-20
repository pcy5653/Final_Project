   
   const socket = new WebSocket("ws://192.168.9.71:82/ws/chat");
   
   let user = $('#my').attr("data-user");
   let name = $('#my').attr("data-name");
   
   socket.onopen = function (e) {
      console.log('open server!');
    };
    
   $('#button-send').click(function(){
      let roomNum = $('#button-send').attr("data-room");
      let num = $('#button-send').attr("data-receiver");
      send(roomNum, num);
   });
   
   $("#listBox").on("click", ".chatList", function(){
      //회원번호
      let employeeNum=$(this).attr("data-empNum");
      let name=$(this).attr("data-name");
      
      $('#someone').attr("data-name", name);
      //db에서 방있는지 확인!
      roomCheck(employeeNum);
      
      //대상 채팅창 인풋 보이기
      $('#box2').attr("style", "");
      $('.box3').attr("style", "");
      $('#userBox').attr("style", "");
      $('#someone').attr("style", "");
      
   });

    socket.onclose=function(e){
        console.log('disconnet');
    };

    socket.onerror = function (e){
        console.log(e);
    };
   
   socket.onmessage=function(msg){
      let jsonObj = JSON.parse(msg.data);
      let roomNum = $('#button-send').attr("data-room");
      console.log(roomNum);
      console.log(jsonObj.roomNum);
      console.log(msg.data);
      // sender, message, chatdate
      let msgTag = "";
      if(roomNum == jsonObj.roomNum){
         
         if(user==jsonObj.sender){
            msgTag = '<div class="myMsg alert alert-primary msg" role="alert"><div>'
                   +name+'</div><hr style="background-color:white !important;"><div class="mes">'
                   +jsonObj.message+'</div><div class="chatDate">'+jsonObj.chatDate+'</div></div>';
         }else{
            msgTag = '<div class="yourMsg alert msg" role="alert"><div>'
                      +jsonObj.name+'</div><hr><div class="mes">'
                      +jsonObj.message+'</div><div class="chatDate">'+jsonObj.chatDate+'</div></div>';
         }
      }
      
      $('#msgArea').append(msgTag);
      scrollToBottom();
   };
   
   $('#search').click(function(){
	  
      let name = $("#searchName").val();
	  if($("#searchName").val()==''){
		  getTotalSearch(name);
	  }else{
	      console.log(name);
	      $('#listBox').empty();
	      getSearch(name);
	  }
   });
  
   $("#msg").on("keyup", function(event) {
       if (event.key === "Enter") {
           let roomNum = $('#button-send').attr("data-room");
           let num = $('#button-send').attr("data-receiver");
           send(roomNum, num);
       }
   });
   
   $("#searchName").on("keyup", function(event) {
	   
	  let name = $("#searchName").val();
	   if($("#searchName").val()==''){
		  
	   		getTotalSearch(name);
	   }
	   
       if (event.key === "Enter") {
		   if($("#searchName").val()!=''){
			  
	       		$('#listBox').empty();
	       		getSearch(name);
		   }
       }
   });
   
   
   function roomCheck(employeeNum){
      
         $.ajax({
         type:"get",
         url:"./roomCheck",
         data:{
            "user2":employeeNum
         },
         success:function(response){
            r=response.trim();//방번호
            console.log(r);
   
            if(r>0){
               enterRoom(socket, employeeNum, r);
            }else{
               createRoom(employeeNum);
            }
         },
         error:function(){
            console.log("ajax 실패");
         }
         })   
   }
   
   function enterRoom(socket, num, roomNum){
      $('#msgArea').empty();
      //대상의 사진, 이름, 직책을 가져옴
      // 방에 들어갈때 보내기 버튼의 속성에 저장해줌
      $('#button-send').attr("data-room",roomNum);
      $('#button-send').attr("data-receiver",num);
      getSomeone(num);
      
      let chatDate = getTodayDate();
       let enterMsg={"type" : "ENTER","roomNum":roomNum,"name":name,"receiver":num,"message":"","chatDate":chatDate};
       socket.send(JSON.stringify(enterMsg));
   }
   
   function send(roomNum, num){
       let content = document.querySelector('#msg').value.trim();
       if (content !== '') {
		   
           let chatDate = getTodayDate();
           let talkMsg={"type" : "TALK","roomNum":roomNum,"name":name,"receiver":num,"message":content,"chatDate":chatDate};
           socket.send(JSON.stringify(talkMsg));
          msg.value = '';
	   }
       
      
      
   }
   
   //방나가기  function quit(){
   
   function createRoom(employeeNum){
      $.ajax({
         type:"post",
         url:"./createRoom",
         data:{
            "user2":employeeNum
         },
         success:function(response){
            r=response.trim();
            console.log(r);
            
            if(r>0){
               roomCheck(employeeNum);
            }else{
               alert("방이 만들어지지 않았습니다.");
            }
            
         },
         error:function(){
            console.log("ajax 실패");
         }
      })
   }
   
   function getTodayDate() {
       let today = new Date(); // Mon Dec 20 2021 22:04:03 GMT+0900 (한국 표준시)
   
       let year = today.getFullYear();
       let month = ('0' + (today.getMonth() + 1)).slice(-2); 
       let day = ('0' + today.getDate()).slice(-2);
      let hours = ('0' + today.getHours()).slice(-2); 
       let minutes = ('0' + today.getMinutes()).slice(-2);
      //let seconds = ('0' + today.getSeconds()).slice(-2); 
       
       let dateString = year + '-' + month + '-' + day + ' ' + hours + ':' + minutes; 
      
      console.log(dateString);

       return dateString;
   }
   
   function getSearch(name){
      
         $.ajax({
         type:"get",
         url:"./search",
         data:{
            "name":name
         },
         success:function(response){
            
            if (response.list != null) {
            console.log("list 가져옴");
                                   
            searchList = response.list;
            
            $.each(searchList, function( index, value ) {
                   let a = '<li class="ul2"><a href="#" class="chatList" data-empNum="'+value.employeeNum+'"><i class="mx-1 bx bx-message-square"></i>'+value.name+' ['+value.position+']</a></li>'
                    $('#listBox').append(a);
                });
            } else {
            console.log("list 가져오기 실패");
            }
            
         },
         error:function(){
            console.log("ajax 실패");
         }
         })   
   }
   
   function getTotalSearch(name){
      
         $.ajax({
         type:"get",
         url:"./totalsearch",
         data:{
            "name":name
         },
         success:function(response){
			if (response != null) { 
			console.log(response);
			$('#listBox').empty();
			$('#listBox').append(response);
			}else{
				
            console.log("list 가져오기 실패");
			}
            
         },
         error:function(){
            console.log("ajax 실패");
         }
         })   
   }
   
   function getSomeone(num){
      $.ajax({
         type:"get",
         url:"./getsomeone",
         data:{
            "employeeNum":num
         },
         success:function(response){
            
            if (response != null) {
            console.log("대상정보 가져옴");
            
            y = '<div class="userBox2"><div id="proBox">'
                        +'<img id="userProfile" alt="" src="../file/employee/'+response.one.proFile+'" onerror="handleImageError(this)"></div>'
                   +'<div class="ms-3" id="my">'+response.one.name
                   +' <img width="25" height="25" src="https://img.icons8.com/external-flaticons-lineal-color-flat-icons/64/external-exercise-lifestyles-flaticons-lineal-color-flat-icons-2.png" alt="external-exercise-lifestyles-flaticons-lineal-color-flat-icons-2"/> '
                   +response.one.position+'</div></div>';
                                 
            $('#someone').html(y);
            
            } else {
            console.log("list 가져오기 실패");
            }
            
         },
         error:function(){
            console.log("ajax 실패");
         }
         })
      
   }
   
   // 메시지 전송 후 스크롤을 맨 아래로 이동하는 함수
   function scrollToBottom() {
       // 채팅창의 맨 아래로 스크롤
       $('#msgArea').scrollTop($('#msgArea')[0].scrollHeight);
   }
   
   // 직급 한글 변환
	const position = document.getElementById("my").getAttribute("data-position");
	const p = document.getElementById("pInner");
	
	if(position == 'ROLE_CEO'){
	    p.innerHTML ='대표';
	}else if(position == 'ROLE_GENERAL'){
	    p.innerHTML = '총괄 매니저';
	}else if(position == 'ROLE_CUSTOMER'){
	    p.innerHTML = '고객관리 매니저';
	}else if(position == 'ROLE_RESOURCES'){
	    p.innerHTML = '인사 매니저';
	}else if(position == 'ROLE_FACILITY'){
	    p.innerHTML = '시설 매니저';
	}else if(position == 'ROLE_TRAINER'){
	    p.innerHTML = '트레이너';
	}else if(position == 'ROLE_EX'){
	    p.innerHTML = '가발령';
	}