<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>Insert title here</title>
  <style>
    h3 {
      margin-top: 1% !important;
      text-align: center;
    }
    #req_btn {
      text-align: right;
      margin: 30px;
    }
     /* 아이콘 버튼에 대한 스타일 */
    .icon_btn {
      background-color: rgba(255, 255, 255, 0); /* 버튼 배경색 설정 */
      color: #000000; /* 버튼 텍스트 색상 설정 */
      border: none;
      padding: 10px 20px;
      cursor: pointer;
    }
    .fc-header-toolbar{
      margin-top: 1%;
      margin-bottom: 2em !important;
    }
    .tab-pane  {
      height: 100%;
    }
    #calendar {
      height: 96%;
      width: 91%;
      margin: auto;
    }
    form {
      display: flex;
      justify-content: center;
    }
    #k {
      width: 10%;
    }
    #search {
      width: 30%;
    }
    .b_box{
      text-align: end;
      margin: 0 8%;
    }
    .card{
      margin: 1.2rem 7rem 1.8rem;
    }
    .s_box{
      margin: 1.5rem auto 0 !important;
    }
    .pagination {
      margin-bottom: 0.7rem;
    }
    .tab-content {
      height: 95%;
    }
    .container-xxl {
      margin: 0rem 2.5rem 0 !important;
      max-width: calc(100% - 5.2rem) !important;
      padding: 0 !important;
    }
    .fc-prev-button, .fc-next-button, .fc-myCustomButton-button{
      color: #fff !important;
      background-color: #5f61e6 !important; 
      border-color: #5f61e6 !important;
    }
    .not {
      text-align: center;
      font-size: 1.2rem;
      margin-top: 10%;
    }
    .nav-align-top{
      height: 100%;
    }
    .table th {
      font-size: 0.9rem !important;
    }
    .table thead {
      background: #e7e7ff;
    }
    .table {
      text-align: center;
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
          <div class="layout-page" style="padding-left: 0 !important;">
            <!-- Navbar -->
            <c:import url="/WEB-INF/views/layout/header.jsp"></c:import>

            <!-- Content wrapper -->
            <div class="content-wrapper">
              <!-- Content 내용 여기로 -->
              <div class="container-xxl flex-grow-1 container-p-y">

                <div class="nav-align-top">
                  <ul class="nav nav-tabs nav-fill" role="tablist">
                    <li class="nav-item">
                      <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-home" aria-controls="navs-justified-home" aria-selected="true">
                        전체 직원 근태 조회 
                      </button>
                    </li>
                    <li class="nav-item">
                      <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-profile" aria-controls="navs-justified-profile" aria-selected="false">
                        근태 수정 요청 목록
                      </button>
                    </li>
                  </ul>
                  <div class="tab-content">
                    <div class="tab-pane fade show active" id="navs-justified-home" role="tabpanel">
                      
                      <div id="calendar">
                      </div>
                      
                    </div>
                    <div class="tab-pane fade" id="navs-justified-profile" role="tabpanel">
                      
                    </div>
                   
                  </div>
                </div>

              </div>
                         

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
  
  <script src="/js/attendance/adminCalendar.js"></script>
  <script src="/js/attendance/list.js"></script>
</body>
</html>