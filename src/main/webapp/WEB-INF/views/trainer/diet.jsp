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
<style>

 .img_wrap{
  position : relative;
  width: 350px;
  height: 350px;
  
}
.sel{
	position: absolute;
	top: 0;
  left: 0;
  width: 350px;
  height: 350px;
	
}
#img1,#img2,#img3{
  width: 100%;
  height: 100%;
}

.container_wrap{
	margin-top : 5rem;
	display: flex;
	justify-content: space-evenly;
}


.btn{
	display: inline-flex;
	align-items: center;
	justify-content: center;
}

.rounded-fill{
	border-radius: 50rem !important;
}

.btn-label-primary{
	color:#696cff !important;
	border-color: rgba(0,0,0,0) !important;
	background: #e7e7ff !important;
}
.btn-label-primary:hover{
border-color: rgba(0,0,0,0) !important;
    background: #5f61e6 !important;
    color: #fff !important;
    box-shadow: 0 0.125rem 0.25rem 0 rgba(105,108,255,.4) !important;
    transform: translateY(-1px) !important;
}




</style>
<head>
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
				<div class="container_wrap">
                <div class="img_wrap">
                  <img id="img1" />
                  <label for="reg_mb_img1" class="sel">

                    아침

                  </label>
                  <input type="file" id="reg_mb_img1" style="display: none;">
                </div>
                <div class="img_wrap">
                  <img id="img2" />
                  <label for="reg_mb_img2" class="sel">

                    점심

                  </label>
                  <input type="file" id="reg_mb_img2" style="display: none;">
                </div>
                <div class="img_wrap">
                  <img id="img3" />
                  <label for="reg_mb_img3" class="sel">

                    저녁

                  </label>
                  <input type="file" id="reg_mb_img3" style="display: none;">
                </div>
               </div>
					
					
				<button type="button" class="btn rounded-pill btn-label-primary">저장</button>
                
              </div>
              <!-- / Content --> 
              
              
              <!-- Footer -->
                <!-- <footer class="content-footer footer bg-footer-theme">
                  <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                    <div class="mb-2 mb-md-0">
                      ©
                      <script>
                        document.write(new Date().getFullYear());
                      </scrip>
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
    <script>
      var sel_file;
        $(document).ready(function() {
            $("#reg_mb_img1").on("change", handleImgFileSelect1);
        }); 
        

        function handleImgFileSelect1(e) {
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);

            filesArr.forEach(function(f) {
              
                if(!f.type.match("image.*")) {
                    alert("이미지 파일만 첨부해주세요.");
                    return;
                }

                sel_file = f;
                var reader = new FileReader();
                reader.onload = function(e) {
                    $("#img1").attr("src", e.target.result);
                }
                reader.readAsDataURL(f);
              
            });
        }
        
        var sel_file;
        $(document).ready(function() {
            $("#reg_mb_img2").on("change", handleImgFileSelect2);
        });
        
        function handleImgFileSelect2(e) {
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);

            filesArr.forEach(function(f) {
              
                if(!f.type.match("image.*")) {
                    alert("이미지 파일만 첨부해주세요.");
                    return;
                }

                sel_file = f;
                var reader = new FileReader();
                reader.onload = function(e) {
                    $("#img2").attr("src", e.target.result);
                }
                reader.readAsDataURL(f);
              
            });
        }
        
        var sel_file;
        $(document).ready(function() {
            $("#reg_mb_img3").on("change", handleImgFileSelect3);
        });
        
        function handleImgFileSelect3(e) {
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);

            filesArr.forEach(function(f) {
              
                if(!f.type.match("image.*")) {
                    alert("이미지 파일만 첨부해주세요.");
                    return;
                }

                sel_file = f;
                var reader = new FileReader();
                reader.onload = function(e) {
                    $("#img3").attr("src", e.target.result);
                }
                reader.readAsDataURL(f);
              
            });
        }

    </script>
  </body>
</html>