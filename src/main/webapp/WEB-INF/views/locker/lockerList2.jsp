<%@page import="java.sql.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.cloud.pt.locker.LockerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<!-- beautify ignore:start -->
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>
<%! 
    public long calculateDateDifference(java.util.Date startDate, java.util.Date finishDate) {
        long diffInMilliseconds = finishDate.getTime() - startDate.getTime();
        return diffInMilliseconds / (24 * 60 * 60 * 1000); // 밀리초를 일로 변환
    }
%>


<head>
  <c:import url="/WEB-INF/views/layout/base.jsp"></c:import>
</head>
<style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
           
        }

        .row {
            display: flex;
            gap: 20px; /* 좌우 간격 조절 */
            margin-bottom: 20px; /* 각 행의 아래 간격 조절 */
            width: 100%; /* 행의 너비를 100%로 설정 */
        }

        .locker {
            flex: 1; /* 각 라커의 비율을 동일하게 설정 */
            max-width: calc(12.5% - 5px); /* 최대 너비를 12.5%로 설정하고 좌우 간격을 제외한 값으로 설정 */
            height: 120px; /* 세로 크기 조절 */
            background-color: #bfbfbf;
            border: 1px solid #999;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }
        .lockerPadding{
        	padding: 50px;
        }

        @media (max-width: 768px) {
            /* 브라우저 너비가 768px 이하인 경우 */
            .locker {
                max-width: calc(25% - 20px); /* 최대 너비를 25%로 설정하고 좌우 간격을 제외한 값으로 설정 */
                height: 80px; /* 세로 크기를 작게 조절 */
            }
        }
    </style>
        
<body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->
		      <!-- sidebar -->
          <c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
          <!-- Layout container -->
          <div class="layout-page">
            <!-- Navbar -->
            <c:import url="/WEB-INF/views/layout/header.jsp"></c:import>

            <!-- Content wrapper -->
            <div class="content-wrapper">
              <!-- Content 내용 여기로 -->
              <div class="container-xxl flex-grow-1 container-p-y">
                
                
                	
                          <h3 style="text-align: center; margin-bottom: 0">🔐 락커 관리</h3>
                      

                
                  
  <div class="lockerPadding">
    <%
    List<LockerVO> ar = (List<LockerVO>) request.getAttribute("ar");

    for (int row = 1; row <= 4; row++) {
    %>
    <div class="row">
        <%
        for (int col = 1; col <= 8; col++) {
            int lockerNum = (row - 1) * 8 + col;
            LockerVO lockerVO = new LockerVO();

            // ar에서 해당 lockerNumber에 대한 정보를 찾기
            for (LockerVO locker : ar) {
                if (locker.getLockerNum() == lockerNum) {
                    lockerVO = locker;
                    break;
                }
            }
            
            // state 값이 null인 경우 "정상"으로 설정
            if (lockerVO != null && lockerVO.getState() == null) {
                lockerVO.setState("정상");
            }
        %>
        <div class="locker" data-lockerNum="<%= lockerNum %>"
            <% if (lockerVO != null) { %>
                data-memberName="<%= lockerVO.getMemberName() %>"
                data-startDate="<%= lockerVO.getStartDate() %>"
                data-finishDate="<%= lockerVO.getFinishDate() %>"
                data-memberNum ="<%= lockerVO.getMemberNum() %>"
                data-state ="<%= lockerVO.getState() %>"
            <% } %>
        >
            <!-- lockerInfo가 null이 아닌 경우에만 정보 출력 -->
            <% if (lockerVO != null) { %>
                <div class="lockerInfo" style="font-size: 0.8rem; text-align: center;">
                    <%-- memberNum이 null이고 state가 정상이면 lockerNum만 출력 --%>
                    <% if (lockerVO.getMemberNum() == null && "정상".equals(lockerVO.getState())) { %>
                        <%= lockerNum %>
                    <%-- memberNum이 null이고 state가 고장이면 state만 출력 --%>
                    <% } else if (lockerVO.getMemberNum() == null && "고장".equals(lockerVO.getState())) { %>
                        <span style="    color: white;
									    font-size: 2rem;
									    background: red;
									    padding: 0.5rem 1rem;
									    border-radius: 10%;"><%= lockerVO.getState() %></span>
                    <%-- meberberNum이 null이 아니고 state 가 정상이면 memberNum을 출력 --%>
                    <% } else if (lockerVO.getMemberNum() != null && "정상".equals(lockerVO.getState())) { %>
                       
                        <span style="font-size: 1rem;"><%= lockerVO.getMemberName() %></span><br>
                    <%= "~"+lockerVO.getFinishDate() %><br> 
                    <%= calculateDateDifference(lockerVO.getStartDate(), lockerVO.getFinishDate())+"일 후 만료" %><br>
                    <% } %>
                    <%-- <%= lockerVO.getMemberName() %><br>
                    <%= lockerVO.getStartDate() %><br>
                    <%= lockerVO.getFinishDate() %><br> --%>
                    <%-- 이 부분에서 상태가 "정상"이 아닌 경우에만 출력 --%>
                    <%-- <% if (!"정상".equals(lockerVO.getState())) { %>
                        <%= lockerVO.getState() %>
                    <% } %> --%>
                </div>
            <% } %>
        </div>
        <%
        }
        %>
    </div>
    <%
    }
    %>
</div>



    
     <!-- Modal -->
     
                <div class="modal fade" id="enrollModal" tabindex="-1" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                    <form id="postForm2" action="" method="post" >
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel1">락커 No.<span id="getLockerNum"></span></h5>
                        <input type="hidden" id="getLockerNum" name="lockerNum" >
						        	                
						<button
                          type="button"
                          class="btn-close"
                          data-bs-dismiss="modal"
                          aria-label="Close"
                        ></button>
                      </div>
                      <div class="modal-body" >
                      <div id="recoverIcon" style="align-items: center; justify-content: center"> 
                      <i class='bx bxs-shield-x' style="display:inline-block; font-size:8rem;" ></i>
                      <p style="display: inline-block; font-size: 2rem">사용불가</p>
                      </div>
                      <div id="body-mo">
                       
                        <div class="row">
                          <div class="col mb-3">
                            <div class="mb-3">
                            	<input type="hidden" id="getMemNum">
                            	<input type="hidden" id="getState">
                              <label for="defaultSelect" class="form-label">회원 목록</label>
                              
                              
                              <select id="defaultSelect" class="form-select" name="memberNum">
                              
                              	<option selected  id="getNum">회원을 선택해주세요</option>
                                <c:forEach var="member" items="${memberList}">
							        <option value="${member.memberNum}"  > ${member.memberName}</option>
							       
							    </c:forEach>
                              </select>
                              
                            </div>
                          </div>
                        </div>
                        <div class="row g-2">
                          <div class="col mb-0">
                            <label for="emailBasic" class="form-label">시작일</label>
                            <input class="form-control" type="date" name="startDate"  id="startDate" />
                          </div>
                          <div class="col mb-0">
                            <label for="dobBasic" class="form-label">종료일</label>
                            <input class="form-control" type="date" name="finishDate" value="${ today }" id="finishDate" />
                          </div>
                        </div>
                        </div>
                      </div>
                      <div class="modal-footer">
                      
					        <button type="button" class="btn btn-primary"id="delUserBtn" onclick="postFormSubmit2('delUser');">락커회수</button>
					   		<button type="button" class="btn btn-primary" id="recoverBtn" onclick="postFormSubmit2('recoverLocker');">라커수리</button>
					    
					    <!-- memberNum이 없을 경우에만 락커등록과 고장등록 버튼 표시 -->
					   	
					        <button type="button" class="btn btn-primary" id="addUserBtn" onclick="postFormSubmit2('addUser');">락커등록</button>
					        <button type="button" class="btn btn-warning" id="setRepairBtn" onclick="postFormSubmit2('setRepair');">고장등록</button>
					    
                      </div>
                    </form>
                    
                    
                    
                    
                    <script type="text/javascript">
                    function postFormSubmit2(url) {
                    	if(url === 'setRepair'){
                    		var lockerNumber = document.getElementById('getLockerNum').value;
                    		
                    		$.ajax({
                    			type: 'POST',
                    			url:'./setRepair',
                    			data:{
                    				lockerNum:lockerNumber
                    			},
                    			success:function(data){
                    				console.log("고장등록 성공",data);
                    				$('#enrollModal').modal('hide');
                    				alert("고장 등록 완료");
                    				 location.reload();
                    			},
                    			error: function (error) {
                                    // 에러 처리
                                    console.error('고장 등록 실패', error);
                                }
                    		});
                    	}
                    	if (url === 'recoverLocker'){
                    		var lockerNumber = document.getElementById('getLockerNum').value;
                    		
                    		$.ajax({
                    			type:'POST',
                    			url:'./recoverLocker',
                    			data:{
                    				lockerNum:lockerNumber
                    			},
                    			success:function(data){
                    				$('#enrollModel').modal('hide');
                    				alert("라커 수리 완료");
                    				location.reload();
                    			},
                    			error:function (error){
                    				console.log("수리실패");
                    			}
                    		});
                    	}
                        if (url === 'delUser') {
                            var lockerNumber = document.getElementById('getLockerNum').value;
                            var selectElement = document.getElementById('defaultSelect');

                        	// 선택된 option 엘리먼트를 가져옵니다.
                        	var selectedOption = selectElement.options[selectElement.selectedIndex];

                        	// 선택된 option의 value를 가져옵니다.
                        	var selectedValue = selectedOption.value;
							
                            // Ajax를 통해 서버로 데이터 전송
                            $.ajax({
                                type: 'POST',
                                url: './delUser', // 실제 서버 엔드포인트로 변경
                                data: {
                                    lockerNum: lockerNumber
                                    
                                },
                                success: function (data) {
                                    // 서버 응답에 따른 처리
                                    console.log('라커 회수 성공', data);
                                    // 모달 닫기
                                    $('#enrollModal').modal('hide');
                                    // 페이지 리로드 또는 필요한 처리 수행
                                    alert("라커 회수 완료")
                                    location.reload();
                                },
                                error: function (error) {
                                    // 에러 처리
                                    console.error('라커 회수 실패', error);
                                }
                            });
                        }

                        // 나머지 로직은 그대로 유지
                        // ...

                        // 서버로 전송하는 부분을 Ajax로 변경했으므로
                        // document.getElementById("postForm2").action = url;
                        // $("#postForm2").attr("action", url).submit();
                        if (url === 'addUser') {
                        	var selectElement = document.getElementById('defaultSelect');

                        	// 선택된 option 엘리먼트를 가져옵니다.
                        	var selectedOption = selectElement.options[selectElement.selectedIndex];

                        	// 선택된 option의 value를 가져옵니다.
                        	var selectedValue = selectedOption.value;
                            var lockerNumber = document.getElementById('getLockerNum').value;
							var startDate = document.getElementById('startDate').value;
							var finishDate = document.getElementById('finishDate').value;
                            // Ajax를 통해 서버로 데이터 전송
                            $.ajax({
                                type: 'POST',
                                url: './addUser', // 실제 서버 엔드포인트로 변경
                                data: {
                                    lockerNum: lockerNumber,
                                    memberNum: selectedValue,
                                    startDate: startDate,
                                    finishDate:finishDate
                                },
                                success: function (data) {
                                    // 서버 응답에 따른 처리
                                    console.log('라커 등록 성공', data);
                                    // 모달 닫기
                                    $('#enrollModal').modal('hide');
                                    // 페이지 리로드 또는 필요한 처리 수행
                                    alert("라커 등록 완료")
                                    location.reload();
                                },
                                error: function (error) {
                                    // 에러 처리
                                    console.error('라커 등록 실패', error);
                                }
                            });
                        }
                    }
                    </script>
                    </div>
                  </div>
                </div>
    </div>
              <!-- / Content --> 
              
              
              <!-- Footer -->
                <!-- <footer class="content-footer footer bg-footer-theme">
                  <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                    <div class="mb-2 mb-md-0">
                      ©
                      <script>
                        document.write(new Date().getFullYear());
                      </script>
                      , made with ❤️ by
                      <a href="https://themeselection.com" target="_blank" class="footer-link fw-bolder">ThemeSelection</a>
                    </div>
                    <div>
                      <a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a>
                      <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a>

                      <a
                        href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
                        target="_blank"
                        class="footer-link me-4"
                        >Documentation</a
                      >

                      <a
                        href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
                        target="_blank"
                        class="footer-link me-4"
                        >Support</a
                      >
                    </div>
                  </div>
                </footer> -->
                <!-- / Footer -->       

              <div class="content-backdrop fade"></div>
            </div>
            <!-- Content wrapper -->
          </div>
        <!-- / Layout page -->
      <div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->
  

<script>
    // 페이지가 로드된 후 실행될 함수
    document.addEventListener('DOMContentLoaded', function () {
        // 모든 락커 엘리먼트를 선택
        var lockerElements = document.querySelectorAll('.locker');

        // 각 락커 엘리먼트에 클릭 이벤트 핸들러 추가
        lockerElements.forEach(function (locker) {
        	var lockerNum = locker.getAttribute('data-lockerNum');
        	
        	locker.setAttribute('data-lockerNum', lockerNum);
            locker.addEventListener('click', function () {
                // 락커 번호 가져오기
                
            
               /*  var memberNum = locker.dataset.memberNum; */
                // 모달 타이틀 업데이트
                
			var lockerNumber = locker.getAttribute('data-lockerNum');
               
               /* 라커정보가져오기 */
               
                var memberName = locker.getAttribute('data-memberName');
            var startDate = locker.getAttribute('data-startDate');
            var finishDate = locker.getAttribute('data-finishDate'); 
             var memberNum = locker.getAttribute('data-memberNum'); 
             var state = locker.getAttribute('data-state');
             document.getElementById('getMemNum').value=memberNum;
			document.getElementById('getLockerNum').innerText = lockerNum;
			document.getElementById('getNum').value=memberNum;
             document.getElementById('getNum').innerText = memberName;
            document.getElementById('startDate').value = startDate;
            document.getElementById('finishDate').value = finishDate; 
            document.getElementById('getState').value = state;
            var getMemNumValue = document.getElementById('getMemNum').value;
            console.log('getMemNum Value:', getMemNumValue);
            console.log('state:',state);
                // 락커 번호를 모달 폼의 hidden 필드에 설정
                document.getElementById('getLockerNum').value = lockerNum;
                if (getMemNumValue === "null" && state == "정상") {
                    // 만약 null이면 "delUserBtn" 버튼을 숨기고 다른 버튼들을 보이게 함
                    console.log('멤버가 null');
                   document.getElementById("recoverBtn").style.display = "none";
                    document.getElementById("delUserBtn").style.display = "none";
                    document.getElementById("addUserBtn").style.display = "inline-block";
                    document.getElementById("setRepairBtn").style.display = "inline-block";
                    document.getElementById("body-mo").style.display = "block";
                    document.getElementById("recoverIcon").style.display = "none";
                    document.getElementById("getNum").innerText = "회원을 선택하세요";
                }
                else if(state === "고장" && getMemNumValue === "null"){
                	console.log('고장일떄');
                	document.getElementById("recoverBtn").style.display = "inline-block";
                    document.getElementById("delUserBtn").style.display = "none";
                    document.getElementById("addUserBtn").style.display = "none";
                    document.getElementById("setRepairBtn").style.display = "none";
                    document.getElementById("body-mo").style.display = "none";
                    document.getElementById("recoverIcon").style.display = "flex";
                }
                else if(getMemNumValue !== "null") {
                	console.log('멤버가 있을때');
                	document.getElementById("recoverBtn").style.display = "none";
                    document.getElementById("delUserBtn").style.display = "inline-block";
                    document.getElementById("addUserBtn").style.display = "none";
                    document.getElementById("setRepairBtn").style.display = "none";
                    document.getElementById("body-mo").style.display = "block";
                    document.getElementById("recoverIcon").style.display = "none";
                }
                		
/*                 document.getElementById('modalMemberNum').value = memberNum;
 */                // 모달 열기
 			
 
                $('#enrollModal').modal('show');
 
            });
        });
        
        
    });
      /* document.addEventListener("DOMContentLoaded", function() {
        // "getNum"이라는 ID를 가진 엘리먼트 가져오기
        var getNumElement = document.getElementById("getMemNum");
		
        
        // 값이 null 또는 undefined인지 확인
         if (getNumElement.innerText === null || getNumElement.innerText === undefined || getNumElement.innerText === "") {
            // 만약 null이면 "delUserBtn" 버튼을 숨기고 다른 버튼들을 보이게 함
            console.log("번호",getNumElement.innerText);
            document.getElementById("delUserBtn").style.display = "none";
            document.getElementById("addUserBtn").style.display = "inline-block";
            document.getElementById("setRepairBtn").style.display = "inline-block";
        } else {
            // 만약 null이 아니면 다른 버튼들을 숨기고 "delUserBtn" 버튼을 보이게 함
            console.log("Value is not null:", getNumElement.innerText);
            document.getElementById("delUserBtn").style.display = "inline-block";
            document.getElementById("addUserBtn").style.display = "none";
            document.getElementById("setRepairBtn").style.display = "none";
        } 
    });  */
   
</script>

<script>
  // 현재 날짜를 가져오는 함수
  function getCurrentDate() {
    const today = new Date();
    const year = today.getFullYear();
    let month = today.getMonth() + 1;
    let day = today.getDate();

    // 월과 일이 한 자리 수인 경우 앞에 0을 추가
    month = month < 10 ? '0' + month : month;
    day = day < 10 ? '0' + day : day;

    // 날짜를 YYYY-MM-DD 형식으로 반환
    return `${year}-${month}-${day}`;
  }

  // 오늘 날짜를 가져와서 input 엘리먼트에 설정
  document.getElementById('startDate').value = getCurrentDate();
</script>


    <c:import url="/WEB-INF/views/layout/js.jsp"></c:import>
  </body>
</html>