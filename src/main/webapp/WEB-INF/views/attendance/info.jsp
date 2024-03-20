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
  <style>
    .attendance {display: flex;}
    .attendance #my {
      width:calc(100% - 79%);
      background-color: rgba(105, 108, 255, 0.16);
    }
    .attendance #c_box {
      width:79%;
      display: flex;
      justify-content: center;
      background: white;
    }   
    #calendar {
      width: 94.4%;
    }
    .fc .fc-toolbar.fc-header-toolbar {
    	margin-top: 2.5em;
    }
    .profile {
      text-align: center;
      margin-top: 40px;
      margin-bottom: 20px;
    }
    .rounded-circle {
      width: 140px;
      border-radius: 50%;
    }
    .name {
      text-align: center;
    }
    .btn-primary {
      margin-top: 30px;
      margin-bottom: 15px;
      text-align: center;
      width:100%;
      display: inline-block;
    }
    ul {
      list-style-type: none;
    }
    .list {
      line-height: 2;
      text-align: left;
    }
    #smallModal {
      display: none;
    }
    .btn_block {
      text-align: center;
      margin-top: 5%;
    }
    .btn-primary {
      width: 70%;
    }
    .tTitle{
	  	width: 40%;
      margin-bottom: 3%;
      font-size: 1.1rem;
	  }
	  .tTime{
	  	width: 40%;
	  	font-size: 1.1rem;
	  }	
    .timeBox{
	  	display: flex;
	  	margin-left: 17%;
	  }
    .b2{
	  	height: 10%;
	  	text-align: center;
	  	margin-top: 10%;
	  	padding-top: 5px;
	  }
    .b1{
		  height: 35%;
		  text-align: center;
      margin-top: 20%;
	  }
    #proBox{
      width: 170px;
      height: 170px; 
	    border-radius: 70%;
	    overflow: hidden;
	    margin: 6rem auto 0;
	  }
    .user{
	  	font-size: 1.5rem;
	  	font-weight: bold;
	  }
    #user{
      margin-top: 12%;
    }
    #userProfile{
	  	width: 100%;
	    height: 100%;
	    object-fit: cover;	
	  }
    .container-xxl {
      margin: 0rem 2.5rem 0 !important;
      max-width: calc(100% - 5.2rem) !important;
      padding: 0 !important;
    }
    .col{
      font-size: 1.2rem;
    }
    .modal-footer {
      justify-content: center !important;
    }
    #date {
      font-weight: bold;
      font-size: 1.5rem;
    }
    .modal-body {
      margin: 0 2rem;
    }
    #state {
      margin-top: 1rem;
      text-align: end;
    }
    #on, #off {
      margin-left: 2rem;
    }
    .close {
      width: 50%;
    }
    .fc-license-message{
      display: none !important;
    }
  </style>

  <c:import url="/WEB-INF/views/layout/base.jsp"></c:import>

  <!-- moment lib -->
	<script src='https://cdn.jsdelivr.net/npm/moment@2.27.0/min/moment.min.js'></script>
	<!-- fullcalendar bundle -->
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@6.1.9/index.global.min.js'></script>
	<!-- the moment-to-fullcalendar connector. must go AFTER the moment lib -->
	<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/moment@6.1.9/index.global.min.js'></script>

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
              <div class="container-xxl flex-grow-1 container-p-y attendance">
              
                <!-- Modal -->
                <div class="modal fade" id="smallModal" tabindex="-1" aria-hidden="true">
                  <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="workDate"></h5>
                        <button type="button" class="btn-close close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        <div class="row">
                          <div class="col mb-3">
                            <p id="date">
                              
                            </p>
                          </div>
                          <div class="col mb-3">
                            <p id="state">
                              
                            </p>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col mb-3">
                            <div class="tt">출근시간 <span id="on"></span></div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col mb-3">
                            <div class="tt">퇴근시간 <span id="off"></span></div>
                          </div>
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-primary close" data-bs-dismiss="modal">
                          확인
                        </button>
                      </div>
                    </div>
                  </div>
                </div>

                
                <div id="my">
                  <div class="b1">
                    <sec:authentication property="principal" var="user" />
                    <!-- 이미지 이름 직책 -->
                    <div id="proBox">
                      <img id="userProfile" alt="" src="/file/employee/${user.proFile}">
                    </div>
                    <div class="user" id="user" style="font-weight:500;"> 
                      ${user.name}
                    </div>
                    <div class="user" id="position" data-position="${user.position}">
                      <span id="pInner" style="font-size: 1rem;">${user.position}</span>
                    </div>
                  </div>
                  <div class="b2">
                    <!-- 출근시간 퇴근시간 -->
                    <div class="timeBox">
                      <div class="tTitle">출근시간 </div>
                      <div class="tTime" id="onTime">
                        <c:if test="${empty vo.onTime}"> - </c:if>
                        <c:if test="${not empty vo.onTime}"> ${vo.onTime} </c:if>
                      </div>
                    </div>
                    <div class="timeBox">
                      <div class="tTitle">퇴근시간 </div>
                      <div class="tTime" id="offTime">
                        <c:if test="${empty vo.offTime}"> - </c:if>
                        <c:if test="${not empty vo.offTime}"> ${vo.offTime} </c:if>
                      </div>
                    </div>
                  </div>
                  <div class="btn_block">
                    <button class="btn btn-primary" id="req_btn">근태 수정 요청</button>
                  </div>
                </div>
                <div id="c_box">
                  <div id="calendar">
                  </div>
                </div>

              </div>
              <!-- / Content -->  

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

    <script src="/js/attendance/calendar.js"></script>
    <script src="/js/home.js"></script>
  </body>
</html>