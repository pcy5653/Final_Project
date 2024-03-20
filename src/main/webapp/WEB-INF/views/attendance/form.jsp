<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>

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
   
  <!-- moment lib -->
	<script src='https://cdn.jsdelivr.net/npm/moment@2.27.0/min/moment.min.js'></script>
	<link rel="stylesheet" href="/css/attendance/form.css"/>
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
                <div class="col-xxl">
                  <div class="card">
                    <h3 class="card-header">근태 수정 요청서</h3>
                    <div class="card-body">
                      <form id="frm" method="post" action="/attendanceModify/add">
                        <div class="row g-3 mb-3">
                          <div class="col-md-6">
                            <div class="mb-3 row">
                              <label for="writer" class="col-md-2 col-form-label">작성자</label>
                              <div class="col-md-10">
                                <sec:authentication property="Principal" var="user"/>
                                  <input type="text" id="writer" value="${user.name}" class="form-control" readonly>
                                  <input type="hidden" id="num" name="employeeNum" value="${user.employeeNum}">
                              </div>
                            </div>
                          </div>
                          <div class="col-md-6">
                            <input type="radio" id="on" name="type" value="출근" class="form-check-input">
                            <label for="on" class="form-check-label">출근</label>
          
                            <input type="radio" id="off" name="type" value="퇴근" class="form-check-input">
                            <label for="off" class="form-check-label">퇴근</label>
                          </div>
                        </div>
                        <div class="row g-3 mb-3">
                          <div class="col-md-6">
                            <div class="mb-3 row">
                              <label for="requestDate" class="col-md-2 col-form-label">수정요청일</label>
                              <div class="col-md-10">
                                <input type="date" id="requestDate" name="modifyDate" class="form-control">
                              </div>
                            </div>
                          </div>
                          <div class="col-md-6">
                            <div class="mb-3 row">
                              <label for="requestTime" class="col-md-2 col-form-label">수정요청시간</label>
                              <div class="col-md-10">
                                <input type="time" id="requestTime" name="modifyTime" class="form-control">
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="col-12">
                          <label for="content" class="form-label">요청사유</label>
                          <textarea name="requestContents" id="content" cols="30" rows="5" class="form-control" placeholder="요청사유를 입력해주세요"></textarea>
                        </div>
                        <div class="totalBtn">
                          <button type="button" id="before_btn" class="btn btn-primary">이전</button>
                          <button type="button" id="submit_btn" class="btn btn-primary">제출</button>
                        </div>
                      </form>
                    </div>
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

    <script>
      //현재 날짜
      const today = new Date(); 
      //원하는 형식으로 포맷
      let formattedDay = moment(today).format("YYYY-MM-DD"); 
      //현재 날짜 이후의 날짜 선택 불가하게 설정 
      $('#requestDate').attr('max', formattedDay);

      let checkResult = [false, false, false, false];

      function emptyCheck(){
        if($('input[name="gender"]:checked').val()!=''){
          checkResult[0] = true;
        }
        if($('#requestDate').val()!=''){
          checkResult[1] = true;
        }
        if($('#requestTime').val()!=''){
          checkResult[2] = true;
        }
        if($('#content').val()==''){
          checkResult[3] = false;
        }
        if($('#content').val()!=''){
          checkResult[3] = true;
        }
      }

      //이전버튼
      $('#before_btn').on('click', function(){
        $(location).attr('href', '/attendanceModify/list');
      })
      //제출버튼
      $('#submit_btn').on('click', function(){
        emptyCheck();
        if(checkResult.includes(false)){
          alert('모든항목을 입력해야합니다');
        }else{
          $('#frm').submit();
        }
      })

      
    </script>
  </body>
</html>
