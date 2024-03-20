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
                  <h3 class="card-header" style="text-align: center; margin: 3rem 0;">${member.memberName} 회원 정보수정</h3>
                  <form class="card-body" action="./update" method="post" enctype="multipart/form-data" id="frm">
                    <div style="display: flex; justify-content: space-between; margin-bottom: 5rem;" >
                      <div class="memLeft" style="width: 47%;">
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-name">회원번호</label>
                          <div class="col-sm-10">
                            <input type="text" class="form-control" id="basic-default-name" name="memberNum" value="${member.memberNum}" readonly/>
                          </div>
                        </div>
                        <div class="mb-3 row">
                          <label for="name" class="col-md-2 col-form-label">이름</label>
                          <div class="col-md-10">
                            <input class="form-control input" id="name" name="memberName" type="text" value="${member.memberName}" placeholder="이름을 입력해주세요." />
                            <div id="nameMsg"></div>
                          </div>
                        </div>
                        <div class="mb-3 row">
                          <label for="phone" class="col-md-2 col-form-label">전화번호</label>
                          <div class="col-md-10">
                            <input class="form-control input" name="phone" type="tel" value="${member.phone}" placeholder="전화번호를 입력해주세요." id="phone" />
                            <div id="phoneMsg"></div>
                          </div>
                        </div>
                        <div class="mb-3 row">
                          <label for="address" class="col-md-2 col-form-label">주소</label>
                          <div class="col-md-10">
                            <input class="form-control input" name="address" type="text" id="address" value="${member.address}" placeholder="우편번호" value=""/>
                            <button type="button" id="addressBtn" class="btn btn-primary">우편번호 찾기</button>
                            <input class="form-control" type="hidden" id="html5-text-input"  placeholder="주소" />
                            <input class="form-control" type="hidden" id="html5-text-input"  placeholder="상세주소" value="" />
                            <div id="addressMsg"></div>
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-name">헬스 가입일</label>
                          <div class="col-sm-10">
                            <input type="text" class="form-control" id="basic-default-name" value="${member.joinDate}" readonly/>
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-name">헬스 만료일</label>
                          <div class="col-sm-10">
                            <input type="text" class="form-control" id="basic-default-name" value="${member.expirationDate}" readonly/>
                          </div>
                        </div>
                      </div>
                      <div class="memRight" style="width: calc(100% - 53%);">
                        <div class="mb-3 row">
                          <label for="birth" class="col-md-2 col-form-label">생년월일</label>
                          <div class="col-md-10">
                            <input class="form-control input" name="birth" type="date" value="${member.birth}" placeholder="생년월일을 입력해주세요." id="birth" />
                            <div id="birthMsg"></div>
                          </div>
                        </div>
                        <div class="mb-3 row" >
                          <label for="html5-text-input" class="col-md-2 col-form-label">성별</label>
                          <input type="hidden" id="genderVal" cssClass="input_con" readonly="ture" value="${member.gender}"></input>
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
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-name">이용권</label>
                          <div class="col-sm-10">
                              <c:forEach items="${member.membershipVO}" var="sh">
                              <input type="text" class="form-control ptCount" id="basic-default-name" value="${sh.type}" readonly/>
                            </c:forEach>
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-name">피티 등록일</label>
                          <div class="col-sm-10">
                            <c:forEach items="${member.registrationVO}" var="re">
                              <input type="text" class="form-control" id="basic-default-name" value="${re.regDate}" readonly/>
                            </c:forEach>
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-name">담당 트레이너</label>
                          <div class="col-sm-10">
                            <input type="text" class="form-control" id="basic-default-name" value="${member.employeeVO.name}" readonly/>
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-name">피티 횟수</label>
                          <div class="col-sm-10">
                              <c:forEach items="${member.membershipVO}" var="sh">
                              <input type="text" class="form-control" id="basic-default-name" value="${sh.ptCount}" readonly/>
                            </c:forEach>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="proBtn" style="text-align: center;">
                      <button type="button" id="backBtn" class="btn btn-primary">이전</button>
                      <button type="button" id="addBtn" class="btn btn-primary">수정 완료</button>
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
<script  type="text/javascript" src="/js/member/update.js"></script>
</body>
</html>