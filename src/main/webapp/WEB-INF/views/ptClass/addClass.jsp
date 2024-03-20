
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
<head>
  <c:import url="/WEB-INF/views/layout/base.jsp"></c:import>
</head>

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
              
            <%--   <h1>EmployeeNum : <%= employeeNum %></h1> --%>
            
            
           <!-- <form action="./addClass" method="POST">   
           
           
    
  </select>  <br />
  
           
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              취소
            </button>
            <button type="submit" class="btn btn-primary"  >
              추가
            </button>
			</form>
              </div> -->
              
              <div class="card mb-4">
                <h5 class="card-header" style="text-align: center; margin: 3rem 0;">PT 추가</h5>
                <form class="card-body" action="./addClass" method="post"  >
                  <div style="display: flex; justify-content: center; align-items: center; margin: 0 auto 5rem; width:80%;" >
                    <input type="text"  name="employeeNum" id="employeeNum" value="${employeeNum}" style="display: none;"/><br />
           			<input type="text" name="memberNum" id="memberNum" value="${memberNum}" style="display: none;"><br/>
                    <input type="text" name="startTime" id="combinedData" style="display: none;">
           			<input type="datetime-local" name="finishTime" id="finish" style="display: none;"/><br /> 
                    <div class="memRight" style="width: calc(100% - 53%);">
                      <div class="mb-3 row">
                        
                      </div>
                      <div class="mb-3 row">
                        <label for="name" class="col-md-2 col-form-label">회원이름 :</label>
                        <div class="col-md-10">
                           <input class="form-control" type="text" id="title" value="${memberName}" readonly="readonly">
                        </div>
                      </div>
                      <div class="mb-3 row" >
                        <label for="buyDate" class="col-md-2 col-form-label">시작시간 :</label>
                        <div class="col-md-10">
                         <input type="date"  id="date" onchange="validateDate()" class="form-control"/>  <select id="time" class="form-control">
						    <option value="10:00:00">10:00:00</option>
						    <option value="11:00:00">11:00:00</option>
						    <option value="12:00:00">12:00:00</option>
						    <option value="14:00:00">14:00:00</option>
						    <option value="15:00:00">15:00:00</option>
						    <option value="16:00:00">16:00:00</option>
						    <option value="17:00:00">17:00:00</option>
  						</select>
  						</div>
                      </div>
                      </div>
                    </div>
                  
                  <div class="proBtn" style="text-align: center;">
                    <button type="button" id="backBtn" class="btn btn-primary">이전</button>
                    <button type="submit" id="saveChanges" class="btn btn-primary" >등록</button>
                  </div>
                </form>
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
  

    <c:import url="/WEB-INF/views/layout/js.jsp"></c:import>
    
    <script type="text/javascript">
    document.getElementById('saveChanges').addEventListener('click', function() {
    	function sendDataToServer() {
            var date = document.getElementById('date').value;
            var time = document.getElementById('time').value;

            var combinedData = date + 'T' + time;

            // 'combinedData' 값을 'startTime' 요소에 설정합니다.
            document.getElementById('combinedData').value = combinedData;

            // FinishTime을 설정합니다.
            var startTime = new Date(combinedData);
            var finishTime = new Date(startTime.getTime() + 50 * 60000);
            var finishTimeString = finishTime.toISOString().slice(0, 16);
            document.getElementById('finish').value = finishTimeString;
            
            console.log(finishTimeString);
        }

        sendDataToServer();
        /* function sendDataToServer() {
            var date = document.getElementById('date').value;
            var time = document.getElementById('time').value;

            var combinedData = date + 'T' + time;

            // 'combinedData' 값을 'startTime' 요소에 설정합니다.
            document.getElementById('combinedData').value = combinedData;
            console.log(combinedData);
        }

        sendDataToServer();
      }); */
  });
      
  function validateDate() {
      var inputDate = new Date(document.getElementById('date').value);
      var today = new Date();
	
      // 비활성화할 조건: 선택한 날짜가 오늘 이전인 경우
      if (inputDate < today) {
    	  
        alert("이 날짜는 오늘 이전입니다. 유효한 날짜를 선택하세요.");
        document.getElementById('date').value = ''; // 값을 비워서 선택된 날짜를 제거
      }
    }
    </script>
  </body>
</html>