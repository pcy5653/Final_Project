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
          <div class="container-xxl flex-grow-1 container-p-y" style=" margin-left: 2.4rem;">
            <div class="col-xxl" style="width:92rem;">
              <div class="card mb-4" style="padding: 0 5rem 2rem;">
                <h3 class="emp_title card-header" style="text-align:center; margin:2rem 0;">직원 인적사항</h3>
                <form:form modelAttribute="employeeVO" method="post" enctype="multipart/form-data" class="card-body" id="frm" action="./join">
                  <div class="proFile_con row mb-3" style="display: flex; justify-content: center; flex-direction: column; align-items: center;margin-bottom: 2rem !important;">
                    <!-- 직원 사진 공간 -->
                    <p id="imgDiv" style="width: 10rem; height: 10rem; border-radius:50%; background-color: rgb(197, 197, 197); padding: 0;"></p>
                    <div class="col-md-10" style="width:20rem;">
                      <input type="file" name="empfile" id="proFile" class="form-control proFile input"  onchange="setThumbnail(event);" required/>
                    </div>
                    <div id="pictureMsg"></div>
                  </div>
                  <div class="proContent" style="display:flex;justify-content: space-between;margin-bottom: 5rem;">
                    <div class="proLeft" style="width: 47%;">
                      <div class="prodiv row mb-3">
                        <form:label path="name" class="col-sm-2 col-form-label">이름</form:label>
                        <div class="col-md-10">
                          <form:input path="name" cssClass="input_con form-control name input"></form:input>
                          <form:errors path="name"></form:errors>
                        </div>
                      </div>
                      <div class="prodiv row mb-3">
                        <form:label path="phone" class="col-sm-2 col-form-label">전화번호</form:label>
                        <div class="col-md-10">
                          <form:input path="phone" cssClass="input_con form-control phone input"></form:input>
                          <form:errors path="phone"></form:errors>
                          </div>
                      </div>
                      <div class="prodiv row mb-3">
                        <form:label path="address"  class="col-sm-2 col-form-label">주소</form:label>
                        <div class="col-md-10">
                          <form:input path="address" id="adr_postNum" cssClass="input_con form-control address input" placeholder="우편번호" value=""></form:input>
                          <button type="button" id="addressBtn" class="btn btn-primary">우편번호 찾기</button>
                          <input class="form-control" type="hidden" id="adr_address" placeholder="주소"></input>
                          <input class="form-control" type="hidden" id="adr_detail" placeholder="상세주소" value =""></input>
                          <form:errors path="address"></form:errors>
                        </div>
                      </div>
                      <div class="prodiv row mb-3">
                        <form:label path="birth" class="col-sm-2 col-form-label">생년월일</form:label>
                        <div class="col-md-10">
                          <form:input type="date" path="birth" cssClass="input_con form-control birth input" id="birthDate"></form:input>
                          <div id="birthError">
                            <form:errors path="birth" id="birthPastMsg" style="display: none;"></form:errors>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="proRight" style="width: calc(100% - 53%);">
                      <div class="prodiv row mb-3">
                        <form:label path="joinDate" class="col-sm-2 col-form-label">입사일</form:label>
                        <div class="col-md-10">
                          <form:input path="joinDate" id="joinDate" cssClass="input_con form-control joinDate input" value="" readonly="true"></form:input>
                          <form:errors path="joinDate"></form:errors>
                        </div>
                      </div>
                      <div class="mb-3 row" >
                        <label for="html5-text-input" class="col-md-2 col-form-label">성별</label>
                        <div class="col-md-10" style="display: flex;">
                          <div class="form-check mt-3" style="margin-top:0 !important; margin-right: 2rem;">
                            <label class="form-check-label" for="gender_M"> 남 </label>
                            <input class="form-check-input" name="gender" type="radio" value="남" id="gender_M" checked/>
                          </div>
                          <div class="form-check">
                            <label class="form-check-label" for="gender_W"> 여 </label>
                            <input  class="form-check-input" name="gender" type="radio" value="여" id="gender_W"/>
                          </div>
                        </div>
                      </div>
                      <div class="prodiv row mb-3">
                        <label for="state" class="col-sm-2 col-form-label">직원상태</label>
                        <div class="col-sm-10" style="display: flex;">
                          <input type="radio" name="state" id="state" class="form-check-input form-control state input" style="padding-right: 0;
                          margin-right: calc(var(--bs-gutter-x) * 0.5);" value="재직" checked>재직</input>
                        </div>
                      </div>
                      <div class="prodiv row mb-3">
                        <label for="position" class="col-sm-2 col-form-label">직급</label>
                        <div class="col-sm-10"> 
                          <select name="position" id="position"class="form-select color-dropdown">
                            <option value="ROLE_CEO" selected>대표</option>
                            <option value="ROLE_GENERAL">총괄 매니저</option>
                            <option value="ROLE_CUSTOMER">고객관리 매니저</option>
                            <option value="ROLE_RESOURCES">인사 매니저</option>
                            <option value="ROLE_FACILITY">시설 매니저</option>
                            <option value="ROLE_TRAINER">트레이너</option>
                            <option value="ROLE_EX">가발령</option>
                          </select>
                        </div> 
                      </div>
                    </div>
                  </div>
                  <div class="proBtn" style="text-align: center;">
                    <button type="button" id="backBtn" class="btn btn-primary">이전</button>
                    <button type="submit" id="addBtn" class="btn btn-primary">등록</button>
                  </div>
                </form:form>
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
<c:import url="/WEB-INF/views/layout/js.jsp"></c:import>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script  type="text/javascript" src="/js/employee/join.js"></script>
<script>
//현재 날짜
const today = new Date(); 
//원하는 형식으로 포맷
let formattedDay = moment(today).format("YYYY-MM-DD"); 
//현재 날짜 이후의 날짜 선택 불가하게 설정 
$('#birthDate').attr('max', formattedDay);

// 사진 선택 시, 이미지 띄우기
function setThumbnail(event) {
    for (let image of event.target.files) {
      let reader = new FileReader();

      reader.onload = function(event) {
        let img = document.createElement("img");
        img.setAttribute("src", event.target.result);
        img.style.width = "100%";
        img.style.height = "100%";
        img.style.objectFit = "cover";
        img.style.borderRadius = "50%";
        document.querySelector("#imgDiv").appendChild(img);
      };

      reader.readAsDataURL(image);
    }
  }
</script>
</body>
</html>