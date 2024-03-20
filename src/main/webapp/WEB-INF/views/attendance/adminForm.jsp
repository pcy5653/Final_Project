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
  <style>
    .modify_Con {
      display:flex; justify-content: space-between;
    }
    table {
      height: 100%;
    }
    .table th {
      width: 30%;
      font-size: 0.9rem !important;
      background: rgb(212 212 213 / 53%) !important;
    }
    /* .card {width:40%;} */
    #req_list {
      width: 40%;
      padding-bottom: 1rem;
      padding-bottom: 1rem;
    }
    #form {
      width:calc(100% - 40%);
      margin-right: 30px;
    }
    .divider-text {
      margin-bottom: 1.5rem;
      padding: 0 2rem !important;
    }
    #approve_btn {
      margin-right: 1rem;
    }
  </style>

  <link rel="stylesheet" href="/css/attendance/form.css"/>
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
                <div class="col-xxl">
                  <div class="card">
                    <h3 class="card-header">근태 수정 요청안</h3>
                      <div class="card-body" style="margin-top: 0; margin-bottom: 1rem;">
                          <div class="divider text-start">
                            <div class="divider-text">요청정보</div>
                              <div class="modify_Con">
                                <div id="form">
                                  <form>
                                    <div class="row g-3 mb-3">
                                      <div class="col-md-6" style="width: 70%;">
                                        <div class="mb-3 row">
                                          <label for="writer" class="col-md-2 col-form-label">작성자</label>
                                          <div class="col-md-10" style="padding-left: 3.4rem;">                                    
                                            <input type="text" id="writer" class="form-control" value="${vo.employeeVO.name}" disabled>
                                          </div>
                                        </div>
                                      </div>
                                      <div class="col-md-6" style="width: 30%; padding-top: 0.5rem;">
                                        <c:set var="radioType" value="${vo.type}" />
                                          <input type="radio" id="on" name="type" value="출근" ${radioType eq '출근' ? 'checked' : ''} class="form-check-input" disabled>
                                          <label for="on" class="form-check-label">출근</label>
                        
                                          <input type="radio" id="off" name="type" value="퇴근" ${radioType eq '퇴근' ? 'checked' : ''} class="form-check-input" disabled>
                                          <label for="off" class="form-check-label">퇴근</label>
                                      </div>
                                    </div>
                                    <div class="row g-3 mb-3" style="margin-top: -2rem;">
                                        <label for="regDate" class="col-md-2 col-form-label">작성일</label>
                                        <div class="col-md-10">                                    
                                          <input type="date" id="regDate" name="regDate" class="form-control" value="${vo.regDate}" disabled>
                                        </div>
                                    </div>
                                    <div class="row g-3 mb-3">
                                        <label for="requestDate" class="col-md-2 col-form-label">수정요청일</label>
                                        <div class="col-md-10">                                    
                                          <input type="date" id="requestDate" name="modifyDate" class="form-control" value="${vo.modifyDate}" disabled>
                                        </div>
                                    </div>
                                    <div class="row g-3 mb-3">
                                        <label for="requestTime" class="col-md-2 col-form-label">수정요청시간</label>
                                        <div class="col-md-10">
                                          <input type="time" id="requestTime" name="modifyTime" class="form-control" value="${vo.modifyTime}" disabled>
                                        </div>
                                    </div>
                                    <div class="row g-3 mb-3">
                                      <label for="content" class="col-md-2 col-form-label">요청사유</label>
                                      <div class="col-md-10">
                                        <textarea name="requestContents" id="content" cols="30" rows="3" class="form-control" disabled>${vo.requestContents}</textarea>
                                      </div>
                                    </div>
                                  </form>
                                </div>

                                <div id="req_list" class="table-responsive text-nowrap">
                                  <table class="table table-bordered">
                                    <tr>
                                      <th>출근일</th>
                                      <td>${vo.attendanceVO.workDate}</td>
                                    </tr>
                                    <tr>
                                      <th>출근시간</th>
                                      <td>
                                        <c:if test="${vo.type eq '출근'}">
                                          ${vo.originalTime}
                                        </c:if>
                                        <c:if test="${vo.type eq '퇴근'}">
                                          ${vo.attendanceVO.onTime}
                                        </c:if>
                                      </td>
                                    </tr>
                                    <tr>
                                      <th>퇴근시간</th>
                                      <td>
                                        <c:if test="${vo.type eq '출근'}">
                                          ${vo.attendanceVO.offTime}
                                        </c:if>
                                        <c:if test="${vo.type eq '퇴근'}">
                                          ${vo.originalTime}
                                        </c:if>
                                      </td>
                                    </tr>
                                    <tr>
                                      <th>상태</th>
                                      <td>${vo.originalState}</td>
                                    </tr>
                                  </table>
                                </div>
                              </div>
                          </div>
                        <div>
                          <hr style="width: 97%; margin: 0 0 1.5rem; float: right;">
                            <form id="frm" method="post" action="/admin/attendanceModify/update">
                              <div class="col-12" style="margin-top: 0 !important">
                                <label for="contents" class="form-label">수정의견</label>
                                <textarea name="modifyContents" id="contents" cols="30" rows="5" class="form-control" placeholder="수정의견을 입력해주세요"></textarea>
                              </div>
                              <input type="hidden" name="modifyTime" class="form-control" value="${vo.modifyTime}">
                              <input type="hidden" name="attendanceNum" value="${vo.attendanceVO.attendanceNum}">
                              <input type="hidden" name="onTime" value="${vo.attendanceVO.onTime}">
                              <input type="hidden" name="offTime" value="${vo.attendanceVO.offTime}">
                              <input type="hidden" name="attendanceModifyNum" value="${vo.attendanceModifyNum}">
                              <input type="hidden" id="status" name="status">
                              <input type="hidden" name="type" value="${vo.type}">
                            </form>
                        </div>
                        <div class="totalBtn">
                          <button type="button" id="before_btn" class="btn btn-primary">이전</button>
                          <button type="button" id="approve_btn" class="btn btn-primary">승인</button>
                          <button type="button" id="reject_btn" class="btn btn-primary">반려</button>
                        </div>
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
      $('#before_btn').on('click', function(){
        $(location).attr('href', '/admin/attendance');
      })

      $('#approve_btn').on('click', function(){
        if($('#contents').val()==''){
          alert('수정의견을 입력해주세요');
        }else{
          $('#status').val('승인');
          $('#frm').submit();
        }
      })

      $('#reject_btn').on('click', function(){
        if($('#contents').val()==''){
          alert('수정의견을 입력해주세요');
        }else{
          $('#status').val('반려');
          $('#frm').submit();
        }
      })
    </script>
  </body>
</html>
