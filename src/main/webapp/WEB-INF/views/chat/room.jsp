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
	<link rel="stylesheet" href="../css/chat/room.css">  
</head>
  <body>
  	<script>
		// // 이미지 안보일때 기본이미지 적용
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
      <!-- /sidebar -->
        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->

          <c:import url="/WEB-INF/views/layout/header.jsp"></c:import>

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h3 class="mb-5">MESSENGER</h3>

              <!-- Basic Layout -->
              <div class="row">
                <div class="col-xl1">
                  <div class="box1 card mb-4" style="background-color: #E7E7FF">
                    <div class="userBox card-header d-flex justify-content-between align-items-center">
                       <div class="userBox2">
                          <sec:authorize access="isAuthenticated()">
                          <sec:authentication property="principal" var="user"/>
                             <div id="proBox">
                                  <img id="userProfile" alt="" src="../file/employee/${user.proFile}" onerror="handleImageError(this)">
                              </div>
                              <div class="ms-3" id="my" data-position="${user.position}" data-user="${user.username}" data-name="${user.name}">${user.name}
                              <img width="25" height="25" src="https://img.icons8.com/external-flaticons-lineal-color-flat-icons/64/external-exercise-lifestyles-flaticons-lineal-color-flat-icons-2.png" alt="external-exercise-lifestyles-flaticons-lineal-color-flat-icons-2"/>
                              <span id="pInner"></span></div>
                     </sec:authorize>
                       </div>
                    </div>
                    <div class="box2 card-body">
                       <div class="input-group mb-4">
                           <input
                             id="searchName"
                             type="text"
                             class="form-control"
                             aria-label="Recipient's username"
                             aria-describedby="button-addon2"
                           />
                           <button class="btn btn-primary" type="button" id="search">조회</button>
                         </div>
                       <div id="listBox" style="background-color: white;">
                              <ul class="ul">
					           <li class="li">관리자
					           	  <c:forEach items="${list}" var="li">
					               <ol>
					                  <li class="ul">
					                  	<c:if test="${li.position == '대표'}">
					                  		<a href="#" class="chatList" data-empNum="${li.employeeNum}" data-name="${li.name}" data-pos="${li.position}"><i class='mx-1 bx bx-message-square'></i>${li.name} [${li.position}]</a>
					                  	</c:if>
					                  </li>                
					               </ol>
		                          </c:forEach>
		                          <c:forEach items="${list}" var="li">
					               <ol>
					                  <li class="ul">
					                  	<c:if test="${li.position != '트레이너'&&li.position != '대표'}">
					                  		<a href="#" class="chatList" data-empNum="${li.employeeNum}" data-name="${li.name}" data-pos="${li.position}"><i class='mx-1 bx bx-message-square'></i>${li.name} [${li.position}]</a>
					                  	</c:if>
					                  </li>                
					               </ol>
		                          </c:forEach>
					           </li>
					           <li class="li" style="padding-top: 7%;">트레이너
		                          <c:forEach items="${list}" var="li">
					               <ol>
					                  <li class="ul">
					                  	<c:if test="${li.position == '트레이너'}">
					                  		<a href="#" class="chatList" data-empNum="${li.employeeNum}" data-name="${li.name}" data-pos="${li.position}"><i class='mx-1 bx bx-message-square'></i>${li.name} [${li.position}]</a>
					                  	</c:if>
					                  </li>                
					               </ol>
		                          </c:forEach>
					           </li>
					          </ul>              
                       </div>
                    </div>
                  </div>
                </div>
                <div class="col-xl">
                  <div class="box1 box3 card mb-4" style="background-color: #E1E2FF;">
                    <div id="userBox" style="margin: auto;" class="userBox card-header d-flex justify-content-between align-items-center">
                      <h5 id="someone" class="mb-0" data-name="" style="color: #696CFF; font-weight: bold;"><i class='bx bxs-quote-alt-left'></i> 채팅하려는 대상을 선택해 주세요 <i class='bx bxs-quote-alt-right' ></i></h5>
                    </div>
                    <div id="box2" style="display: none;" class="box2 card-body">
                       <div id="msgArea" class="card mb-3" style="overflow-y: scroll"></div>
                         
                       <div class="input-group">
                           <input
                             id="msg"
                             type="text"
                             class="form-control"
                             aria-label="Recipient's username"
                             aria-describedby="button-addon2"
                           />
                           <button class="btn btn-outline-primary"
                                   type="button"
                                   id="button-send"
                                   data-room=""
                                   data-receiver=""
                                   >보내기</button>
                         </div>
                    </div>
                  </div>
                </div>
              </div>
              
            </div>
            <!-- / Content -->
            <!-- Footer -->
            <!-- / Footer -->

            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->
   <c:import url="/WEB-INF/views/layout/js.jsp"></c:import>
    
    <!-- room js -->
    <script src="../js/room.js"></script>
    
  </body>
</html>