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
  <script>
  // 이미지 안보일때 기본이미지 적용
  const img = document.getElementById("pro");
  function handleImageError(img) {
    img.src = "/img/basicImg.png";
    console.log("if");
  }
  </script>
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
                    <div class="card-header d-flex align-items-center justify-content-between" style="flex-direction: column;padding-bottom:0;">
                      <h3 class="mb-0" style="margin-top: 1rem;"><span style="font-weight: 800;">${employeeVO.name} ${employeeVO.position}</span> 인적사항</h3>
                      <div style="width: 10rem; height:10rem; margin: 2rem;">
                        <img src="../file/employee/${employeeVO.proFile}" alt="직원 프로필" onerror="handleImageError(this)" value="${employeeVO.proOriginal}" id="pro" data-value="${employeeVO.proOriginal}" style="width:100%; height: 100%; border-radius:50%;object-fit: cover;">
                      </div>
                    </div>
                    <div class="card-body">
                      <div id="detailCon" style="display: flex; justify-content: space-around;">
                        <div id="detail_left" style="width: 47%;">
                          <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-name">사번</label>
                            <div class="col-sm-10">
                              <input type="text" class="form-control" id="basic-default-name" value="${employeeVO.employeeNum}" readonly/>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-name">이름</label>
                            <div class="col-sm-10">
                              <input type="text" class="form-control" id="basic-default-name" value="${employeeVO.name}" readonly/>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-name">전화번호</label>
                            <div class="col-sm-10">
                              <input type="text" class="form-control" id="basic-default-name" value="${employeeVO.phone}" readonly/>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-name">주소</label>
                            <div class="col-sm-10">
                              <input type="text" class="form-control" id="basic-default-name" value="${employeeVO.address}" readonly/>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-name">생년월일</label>
                            <div class="col-sm-10">
                              <input type="text" class="form-control" id="basic-default-name" value="${employeeVO.birth}" readonly/>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-name">성별</label>
                            <div class="col-sm-10">
                              <input type="text" class="form-control" id="basic-default-name" value="${employeeVO.gender}" readonly/>
                            </div>
                          </div>
                        </div>
                        <div id="detail_right" style="width: calc(100% - 53%);">
                          <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-name">입사일</label>
                            <div class="col-sm-10">
                              <input type="text" class="form-control" id="basic-default-name" value="${employeeVO.joinDate}" readonly/>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-name">퇴사일</label>
                            <div class="col-sm-10">
                              <input type="text" class="form-control" id="basic-default-name" value="${employeeVO.quitDate}" readonly/>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-name">직원상태</label>
                            <div class="col-sm-10">
                              <input type="text" class="form-control state" id="basic-default-name" value="${employeeVO.state}" readonly/>
                            </div>
                          </div>
                          <div class="row mb-3">
                              <label class="col-sm-2 col-form-label" for="basic-default-name">직급</label>
                              <div class="col-sm-10">
                                <input type="text" class="form-control" id="basic-default-name" value="${employeeVO.position}" readonly/>
                              </div>
                          </div>
                          <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-name">연차갯수</label>
                            <div class="col-sm-10">
                              <input type="text" class="form-control" id="basic-default-name" value="${employeeVO.leaveDate}" readonly/>
                            </div>
                          </div>
                        </div>
                        <form action="" id="upfrm">
                          <input type="hidden" name="employeeNum" value="${employeeVO.employeeNum}">
                        </form>
                      </div>
                      <div class="proBtn" style="text-align: center; margin: 2rem;">
                        <button type="button" id="backBtn" class="btn btn-primary">이전</button>
                        <button type="button" id="upBtn" class="actionBtn btn btn-primary" data-url="/employee/update">수정</button>
                        <button type="button" id="delBtn" class="actionBtn btn btn-primary" data-url="/employee/delete">퇴직자 개인정보 삭제처리</button>
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
    <script type="text/javascript" src="/js/employee/detail.js"></script>
    <script>
      const state = document.getElementsByClassName("state");
      const delBtn = document.getElementById("delBtn");

      console.log(state[0].value)

      if(state[0].value == '퇴직'){
        delBtn.style.display = 'inline-block';
      }else{
        delBtn.style.display = 'none';
      }

  // 이미지 크기
  // function setThumbnail(event) {
  //   for (let image of event.target.files) {
  //     let reader = new FileReader();

  //     reader.onload = function(event) {
  //       let img = document.createElement("img");
  //       img.setAttribute("src", event.target.result);
  //       img.style.width = "100%";
  //       img.style.height = "100%";
  //       img.style.objectFit = "cover";
  //       img.style.borderRadius = "50%";
  //       document.querySelector("#imgDiv").appendChild(img);
  //     };

  //     reader.readAsDataURL(image);
  //   }
  // }
    </script>
  </body>
</html>