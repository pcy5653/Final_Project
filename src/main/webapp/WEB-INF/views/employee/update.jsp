<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
   <!-- moment lib -->
	<script src='https://cdn.jsdelivr.net/npm/moment@2.27.0/min/moment.min.js'></script>
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
                  <div class="card mb-4">
                    <div class="card-header d-flex align-items-center justify-content-between" style="flex-direction: column;">
                      <h3 class="emp_title card-header" style="text-align: center; margin: 1rem 0 0; padding:0;"><span style="font-weight: 800;">${employeeVO.name} ${employeeVO.position}</span> 수정사항</h3>
                        <form method="post" class="card-body" enctype="multipart/form-data" id="frm" action="./update" style="width: 100%;display:flex; flex-direction:column; align-items: center;">
                          <div class="upFile"style="width: 10rem; height:10rem; margin: 2rem;">
                            <img src="../file/employee/${employeeVO.proFile}" style="width:100%; height: 100%; border-radius:50%;object-fit: cover;" alt="직원 프로필" onerror="this.style.display='none'">
                          </div>
                          <div class="upContent" style="display: flex; justify-content: space-between; width:100%;">
                            <div class="upLeft" style="width: 47%;">
                              <div id="hidden">
                                <input type="hidden" name="employeeNum" id="num" data-num="${employeeVO.employeeNum}" value="${employeeVO.employeeNum}" class="col-sm-2 col-form-label">
                                <input type="hidden" name="quitDate" id="quitDate" value="${employeeVO.quitDate}">  
                              </div>
                              <div class="updiv mb-3 row">
                                <label for="employeeNum"  class="col-md-2 col-form-label">사번</label>
                                <div class="col-md-10">
                                  <input id="employeeNum" class="input_con form-control" required="true" readonly="true" value="${employeeVO.employeeNum}"></input>
                                </div>
                              </div>
                              <div class="updiv mb-3 row">
                                <label for="name"  class="col-md-2 col-form-label">이름</label>
                                <div class="col-md-10">
                                  <input name="name" class="input_con form-control input" id="name" value="${employeeVO.name}"></input>
                                  <div id="nameMsg"></div>
                                </div>
                              </div>
                              <div class="updiv mb-3 row">
                                <label for="phone" class="col-md-2 col-form-label">전화번호</label>
                                <div class="col-md-10">
                                  <input name="phone" class="input_con form-control input" id="phone" value="${employeeVO.phone}"></input>  
                                  <div id="phoneMsg"></div>
                                </div>
                              </div>
                              <div class="mb-3 row">
                                <label for="address" class="col-md-2 col-form-label">주소</label>
                                <div class="col-md-10">
                                  <input class="form-control input" name="address" type="text" id="address" value="${employeeVO.address}" placeholder="우편번호" />
                                  <button type="button" id="addressBtn" class="btn btn-primary">우편번호 찾기</button>
                                  <input class="form-control" type="hidden" id="html5-text-input"  placeholder="주소" />
                                  <input class="form-control" type="hidden" id="html5-text-input"  placeholder="상세주소" value="" />
                                  <div id="addressMsg"></div>
                                </div>
                              </div>
                              <div class="mb-3 row">
                                <label for="birth" class="col-md-2 col-form-label">생년월일</label>
                                <div class="col-md-10">
                                  <input class="form-control input" name="birth" id="birth" type="date" value="${employeeVO.birth}" placeholder="생년월일을 입력해주세요."/>
                                  <div id="birthMsg"></div>
                                </div>
                              </div>
                            </div>
                            <div class="upRight"  style="width: calc(100% - 53%);">
                              <div class="updiv mb-3 row">
                                <label for="joinDate" class="col-md-2 col-form-label">입사일</label>
                                <div class="col-md-10">
                                  <input id="joinDate" class="input_con form-control" required="true" readonly="true" value="${employeeVO.joinDate}"></input>
                                </div>  
                              </div>
                              <div class="updiv mb-3 row">
                                <label for="gender" value="${employeeVO.gender}"  class="col-md-2 col-form-label">성별</label>
                                <input type="hidden" id="genderVal" class="input_con" readonly="ture" value="${employeeVO.gender}"></input>
                                <div class="col-md-10" style="display: flex;">
                                  <div class="form-check mt-3" style="margin-top:0 !important; margin-right: 2rem;">
                                    <label class="form-check-label" for="gender_M"> 남 </label>
                                    <input class="form-check-input" name="gender" type="radio" value="남" id="gender_M" />
                                  </div>
                                  <div class="form-check">
                                    <label class="form-check-label" for="gender_W"> 여 </label>
                                    <input  class="form-check-input" name="gender" type="radio" value="여" id="gender_W"/>
                                  </div>
                                </div>
                              </div>  
                              <div class="updiv mb-3 row" >
                                <label for="state" class="col-md-2 col-form-label">직원상태</label>
                                <input type="hidden" id="state" class="input_con" readonly="ture" value="${employeeVO.state}"></input>
                                <div class="col-md-10" style="display: flex;">
                                  <div class="form-check mt-3" style="margin-top:0 !important; margin-right: 2rem;">
                                    <label class="form-check-label" for="state_in"> 재직 </label>
                                    <input class="form-check-input" name="state" type="radio" value="재직" id="state_in" />
                                  </div>
                                  <div class="form-check">
                                    <label class="form-check-label" for="state_out"> 퇴직 </label>
                                    <input  class="form-check-input" name="state" type="radio" value="퇴직" id="state_out"/>
                                  </div>
                                </div>
                              </div>
                              <div class="updiv mb-3 row">
                                <label for="position" class="col-md-2 col-form-label">직급</label>
                                <input type="hidden" id="position" class="input_con" value="${employeeVO.position}" data-position="${employeeVO.position}"></input>
                                <div class="col-sm-10">
                                  <select name="position" id="selectTypeOpt" class="form-select color-dropdown">
                                    <option value="ROLE_CEO" class="pname">대표</option>
                                    <option value="ROLE_GENERAL" class="pname">총괄 매니저</option>
                                    <option value="ROLE_CUSTOMER" class="pname">고객관리 매니저</option>
                                    <option value="ROLE_RESOURCES" class="pname">인사 매니저</option>
                                    <option value="ROLE_FACILITY" class="pname">시설 매니저</option>
                                    <option value="ROLE_TRAINER" class="pname">트레이너</option>
                                    <option value="ROLE_EX" class="pname">가발령</option>
                                  </select>
                                </div>
                              </div>
                              <div class="updiv mb-3 row">
                                <label for="leaveDate" class="col-md-2 col-form-label">연차갯수</label>
                                <div class="col-sm-10">
                                  <input id="leaveDate" name="leaveDate" class="input_con form-control" readonly value="${employeeVO.leaveDate}"></input>
                                </div>
                              </div>
                            </div>
                          </div>
                        </form>
                        <div class="upBtn" style="text-align: center; margin: 2rem;">
                          <button type="button" id="backBtn" class="btn btn-primary">이전</button>
                          <button type="button" id="upBtn" class="btn btn-primary" >수정 사항 등록</button>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="/js/employee/update.js"></script>


    <script>

      // select 직급 선택처리
      const po = document.getElementById("position").getAttribute("data-position")
      const pname = document.getElementsByClassName("pname");
      console.log(po);

      if(po != ''){
        for(let i = 0; i < pname.length; i++){
          if(po == '대표' && i == 0){
            pname[i].selected = true;
          }else if(po == '총괄 매니저' && i == 1){
            pname[i].selected = true;
          }else if(po == '고객관리 매니저' && i == 2){
            pname[i].selected = true;
          }else if(po == '인사 매니저' && i == 3){
            pname[i].selected = true;
          }else if(po == '시설 매니저' && i == 4){
            pname[i].selected = true;
          }else if(po == '트레이너' && i == 5){
            pname[i].selected = true;
          }else if(po == '가발령' && i == 6){
            pname[i].selected = true;
          }else{
            pname[i].selected = false;
          }
          
        }
      }

      //현재 날짜
      const today = new Date(); 
      //원하는 형식으로 포맷
      let formattedDay = moment(today).format("YYYY-MM-DD"); 
      //현재 날짜 이후의 날짜 선택 불가하게 설정 
      $('#birth').attr('max', formattedDay);
      
    </script>
  </body>
</html>