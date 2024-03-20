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
          <div class="container-xxl flex-grow-1 container-p-y" style="margin-left: 2.4rem;">
            <div class="col-xxl" style="width: 92rem;">
              <div class="card mb-4" style="padding: 0 5rem 2rem;">
                  <h5 class="card-header" style="text-align: center; margin: 3rem 0;">신규 회원 등록</h5>
                  <form class="card-body" action="./add" method="post" enctype="multipart/form-data" id="frm">
                    <div style="display: flex; justify-content: space-between; margin-bottom: 5rem;" >
                      <div class="memLeft" style="width: 47%;">
                        <div class="mb-3 row">
                          <label for="html5-text-input" class="col-md-2 col-form-label">이름</label>
                          <div class="col-md-10">
                            <input class="form-control name input" name="memberName" type="text" placeholder="이름을 입력해주세요." id="html5-text-input" />
                            <div id="nameMsg"></div>
                          </div>
                        </div>
                        <div class="mb-3 row">
                          <label for="html5-tel-input" class="col-md-2 col-form-label">전화번호</label>
                          <div class="col-md-10">
                            <input class="form-control phone input" name="phone" type="tel" placeholder="전화번호를 입력해주세요." id="html5-tel-input" />
                            <div id="phoneMsg"></div>
                          </div>
                        </div>
                        <div class="mb-3 row">
                          <label for="html5-text-input" class="col-md-2 col-form-label">주소</label>
                          <div class="col-md-10">
                            <input class="form-control address input" name="address" type="text" id="html5-text-input"  placeholder="우편번호" value=""/>
                            <button type="button" id="addressBtn" class="btn btn-primary">우편번호 찾기</button>
                            <input class="form-control" type="hidden" id="html5-text-input"  placeholder="주소" />
                            <input class="form-control" type="hidden" id="html5-text-input"  placeholder="상세주소" value="" />
                            <div id="addressMsg"></div>
                          </div>
                        </div>
                        <div class="mb-3 row">
                          <label for="birthDate" class="col-md-2 col-form-label">생년월일</label>
                          <div class="col-md-10">
                            <input class="form-control birth input" name="birth" type="date" placeholder="생년월일을 입력해주세요." id="birthDate" />
                            <div id="birthMsg"></div>
                          </div>
                        </div>
                      </div>
                      <div class="memRight" style="width: calc(100% - 53%);">
                        <div class="mb-3 row">
                          <label for="html5-date-input" class="col-md-2 col-form-label">가입일</label>
                          <div class="col-md-10">
                            <input class="form-control joinDate" name="joinDate" type="text" value="" id="html5-text-input" readonly />
                          </div>
                        </div>
                        <div class="mb-3 row">
                          <label for="html5-date-input" class="col-md-2 col-form-label">만료일</label>
                          <div class="col-md-10">
                            <input class="form-control expirationDate" name="expirationDate" type="text" value="" id="html5-text-input" readonly/>
                          </div>
                        </div>
                        <div class="mb-3 row" >
                          <label for="html5-text-input" class="col-md-2 col-form-label">성별</label>
                          <div class="col-md-10" style="display: flex;">
                            <div class="form-check mt-3" style="margin-top:0 !important; margin-right: 2rem;">
                              <label class="form-check-label" for="defaultRadio1"> 남 </label>
                              <input class="form-check-input" name="gender" type="radio" value="남" id="defaultRadio1" checked />
                            </div>
                            <div class="form-check">
                              <label class="form-check-label" for="defaultRadio2"> 여 </label>
                              <input  class="form-check-input" name="gender" type="radio" value="여" id="defaultRadio2"/>
                            </div>
                          </div>
                        </div>
                        <div class="mb-3 row">
                          <label for="exampleFormControlSelect1" class="form-label col-md-2 col-form-label">이용 개월</label>
                          <div class="col-sm-10">
                            <select class="form-select ptMonth" id="selectTypeOpt" class="form-select color-dropdown">
                              <option selected value="30">1개월</option>
                              <option value="60">2개월</option>
                              <option value="90">3개월</option>
                            </select>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="proBtn" style="text-align: center;">
                      <button type="button" id="backBtn" class="btn btn-primary">이전</button>
                      <button type="button" id="addBtn" class="btn btn-primary">등록</button>
                    </div>
                  </form>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script  type="text/javascript" src="/js/member/add.js"></script>
</body>
</html>