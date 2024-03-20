<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags" %> <%@ taglib prefix="spring"
uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>

<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="/assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <style type="text/css">
    	.fc-license-message{
    		display: none !important;
    	}

    </style>
    <!-- moment lib -->
    <script src="https://cdn.jsdelivr.net/npm/moment@2.27.0/min/moment.min.js"></script>
    <!-- fullcalendar bundle -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@6.1.9/index.global.min.js"></script>
    <!-- the moment-to-fullcalendar connector. must go AFTER the moment lib -->
    <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/moment@6.1.9/index.global.min.js"></script>
    <!-- chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <c:import url="/WEB-INF/views/layout/base.jsp"></c:import>
  <link rel="stylesheet" href="../css/home/home.css">
  </head>
  <script src="../js/home/calendar.js"></script>
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
			<div class="layout-page" style="padding-left: 23rem">
				<!-- Navbar -->
				<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
			
				<!-- Content wrapper -->
				<div class="content-wrapper" style="height: 50rem">
					<!-- Content -->
					
					<div
					class="container-xxl flex-grow-1 container-p-y"
					style="padding: 1rem 0 0 0 !important; height: 100%">
						<div
						class="row mb-3 r1"
						style="
						display: flex;
						justify-content: space-between;
						height: 45%;">
							<div class="card h-100" style="width: 20%">
								<div class="card-body box1" style="height: 100%">
									<div class="b1">
										<!-- 이미지 이름 직책 -->
										<div id="proBox">
											<img
											id="userProfile"
											alt=""
											onerror="handleImageError(this)" 
											src="../file/employee/${emp}" 
											value="${emp}"
											data-src="../file/employee/${emp}"
											/>
										</div>
										<sec:authentication property="principal" var="user" />
										<div
										class="user mt-2"
										id="user"
										data-num="${user.employeeNum}"
										style="font-weight: 500"
										>
											${user.name}
										</div>
										<div
										class="user"
										id="position"
										data-position="${user.position}"
										>
											<span id="pInner" style="font-size: 0.9rem"></span>
										</div>
									</div>
									<div class="b2">
										<!-- 출근시간 퇴근시간 -->
										<div class="timeBox">
											<div class="tTitle">출근시간</div>
											<div class="tTime" id="onTime">-</div>
										</div>
										<div class="timeBox">
											<div class="tTitle">퇴근시간</div>
											<div class="tTime" id="offTime">-</div>
										</div>
									</div>
									<div class="b3">
										<!-- 디지털 시계 -->
										<div class="clock">
											<h1 id="time" class="time"></h1>
										</div>
									</div>
									<div id="btn_block" class="b4">
										<button type="button" id="on" class="btn btn-primary">
										출근하기
										</button>
										<button type="button" id="off" class="btn btn-primary">
										퇴근하기
										</button>
									</div>
								</div>
							</div>
							<div class="card h-100" style="width: 50%">
								<div class="card-body">
									<div id="notice">
										<h5 id="ntitle" class="card-title">최근 공지</h5>
										<a id="plus" href="/notice/list">+</a>
									</div>
									<hr id="hr1" />
									<div class="table-responsive text-nowrap">
										<table class="table table-hover" border=0 cellpadding="0" cellspacing="1" style="table-layout:fixed;">
											<tbody class="table-border-bottom-0">
												<c:forEach items="${list}" var="n">
													<tr>
														<td style="overflow:hidden; white-space:nowrap; text-overflow:ellipsis; width: 400px;">
															<span class="
																		<c:if test="${n.category == '인사'}">badge bg-label-warning me-1</c:if>
																		<c:if test="${n.category == '시설'}">badge bg-label-success me-1</c:if>
																		<c:if test="${n.category == '휴무'}">badge bg-label-info me-1</c:if>
																		<c:if test="${n.category == '기타'}">badge bg-label-primary me-1</c:if>
															">${n.category}</span>
															<a
															class="a1"
															href="./notice/detail?noticeNum=${n.noticeNum}"
															>${n.title}</a
															>
														</td>
														<td>${n.name}</td>
														<td>${n.modDate}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="card h-100" style="width: 28%">
							<div class="card-body calendarBox">
							<div id="calendar"></div>
							</div>
							</div>
						</div>
						<div
						class="row mb-5 r2"
						style="
						display: flex;
						justify-content: space-between;
						height: 50%;
						margin-bottom: 0 !important;
						"
						>
							<div class="card h-100" style="width: 49%">
								<div class="card-body chartBox">
									<div style="width: 100%; height: 10%">
										<h5>월별 신규회원수 추이</h5>
									</div>
									<div class="chart1">
										<canvas id="myChart" width="585" height="315"></canvas>
									</div>
									<div>
										<c:forEach items="${chart}" var="c">
											<div id="${c.monthNum}" data-member="${c.total}"></div>
										</c:forEach>
									</div>
								</div>
							</div>
							<div class="card h-100" style="width: 50%">
								<div class="card-body">
									<div id="notice">
										<h5 id="ntitle" class="card-title">기안결재관리</h5>
										<a id="plus" href="./approval/list">+</a>
									</div>
									<hr id="hr1" />
									<div class="table-responsive text-nowrap">
										<table class="table table-hover">
											<tbody class="table-border-bottom-0">
												<c:forEach items="${app}" var="a">
													<tr>
														<td>
															<span class="badge bg-label-primary me-1"
															>${a.category}</span
															>
															<a
															class="a1"
															href="./approval/detail?approvalNum=${a.approvalNum}"
															>${a.title}</a
															>
														</td>
														<td>${a.state}</td>
														<td>${a.regDate}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				          <!-- / Content -->
				<!-- Footer --><!-- / Footer -->
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
    <script src="/js/attendance/work.js"></script>
    <script src="/js/home.js"></script>
    <script src="../js/home/home.js"></script>
	<script>
		const img = document.getElementById("userProfile")

		console.log(user.proFile);
		console.log(user.proOriginal);

		// if (user.proFile == undefined) {
		// 	img.src = "/img/basicImg.png";
		// }else{
		// 	img.src = img.getAttribute("data-src");
		// }

		

	</script>
  </body>
</html>
