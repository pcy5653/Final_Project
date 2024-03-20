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
                <h5 class="card-header" style="text-align: center; margin: 3rem 0;">새 기구 등록</h5>
                <form class="card-body" action="./add" method="post" enctype="multipart/form-data" id="frm">
                  <div style="display: flex; justify-content: center; align-items: center; margin: 0 auto 5rem; width:80%;" >
                    <div class="memLeft" style="width: 47%;">
                      <!-- 기구 사진 공간 -->
                      <p id="imgDiv" style="width: 20rem; height: 20rem; background-color: rgb(197, 197, 197);"></p>
                    </div>
                    <div class="memRight" style="width: calc(100% - 53%);">
                      <div class="mb-3 row">
                        <label for="fileName" class="col-md-2 col-form-label">사진 등록</label>
                        <div class="col-md-10">
                          <input class="form-control joinDate" name="mFile" type="file" id="fileName" onchange="setThumbnail(event);"/>
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <label for="name" class="col-md-2 col-form-label">기구 이름</label>
                        <div class="col-md-10">
                          <input class="form-control expirationDate" name="name" type="text"  id="name"/>
                        </div>
                      </div>
                      <div class="mb-3 row" >
                        <label for="buyDate" class="col-md-2 col-form-label">구입일</label>
                        <div class="col-md-10">
                          <input class="form-control expirationDate" name="buyDate" type="date" value="" id="buyDate"/>
                        </div>
                      </div>
                      </div>
                    </div>
                  
                  <div class="proBtn" style="text-align: center;">
                    <button type="button" id="backBtn" class="btn btn-primary">이전</button>
                    <button type="submit" id="addBtn" class="btn btn-primary">등록</button>
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
<script>

  // 기구 선택 시, 이미지 띄우기
  function setThumbnail(event) {
    for (let image of event.target.files) {
      let reader = new FileReader();

      reader.onload = function(event) {
        let img = document.createElement("img");
        img.setAttribute("src", event.target.result);
        img.style.width = "100%";
        document.querySelector("#imgDiv").appendChild(img);
      };

      reader.readAsDataURL(image);
    }
  }

  //현재 날짜
  const today = new Date(); 
  //원하는 형식으로 포맷
  let formattedDay = moment(today).format("YYYY-MM-DD"); 
  //현재 날짜 이후의 날짜 선택 불가하게 설정 
  $('#buyDate').attr('max', formattedDay);


// 이전 페이지
const backBtn = document.getElementById("backBtn");
const r = document.referrer; // 이전 url 확인

backBtn.addEventListener("click", function () {
  window.location.href = "/machine/list";
});
</script>
</body>
</html>