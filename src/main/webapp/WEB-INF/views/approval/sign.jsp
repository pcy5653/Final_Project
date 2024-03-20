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
  <link rel="stylesheet" href="/css/approval/style.css">
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
              <div class="container-xxl flex-grow-1 container-p-y" style="text-align:center">
                <h1>서명생성</h1>
                <canvas id="jsCanvas" class="canvas"></canvas>
    <div class="controls">
        <div class="controls__range">
            <input type="range" id="jsRange"
             min="0.1" max="5.0" value="2.5" step="0.1"/>
        </div>
        <div class="controls__btns">
            <button class="btn btn-primary" id="jsMode">Fill</button>
            <button class="btn btn-primary" id="jsSave">저장</button>
            <a href="/approval/signMain" class="btn btn-primary">이전</a>

          </div>
        <div class="controls__colors" id="jsColors">
            <div class="controls__color jsColor" 
                 style="background-color: black;"></div>
            <div class="controls__color jsColor" 
                 style="background-color: red;"></div>
            <div class="controls__color jsColor" 
                 style="background-color: orange;"></div>
            <div class="controls__color jsColor" 
                 style="background-color: yellow;"></div>
            <div class="controls__color jsColor" 
                 style="background-color: green;"></div>
            <div class="controls__color jsColor" 
                 style="background-color: blue;"></div>
            <div class="controls__color jsColor" 
                 style="background-color: navy;"></div>
            <div class="controls__color jsColor" 
                 style="background-color: purple;"></div>
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
  
    <script src="/js/approval/sign.js"></script>
    <c:import url="/WEB-INF/views/layout/js.jsp"></c:import>
  </body>
</html>