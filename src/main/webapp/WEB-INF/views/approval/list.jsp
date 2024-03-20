<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> 
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
			<div class="content-wrapper container-xxl flex-grow-1 container-p-y" style="padding: 1rem 0 !important;">
              <!-- Content 내용 여기로 -->
			  <h3 style="text-align: center; margin:2rem 0 1rem;">기안문서함</h3>
              <div class="container-xxl flex-grow-1 container-p-y" style="padding: 1rem 0 !important;">
				<div>
					<div class="m-5" style="margin:1.5rem auto !important;">
					  <form action="./list" method="get" id="frm" style="display: flex;justify-content: center;">
						<input type="hidden" value="${pager.page}" id="page" name="page">
						<!-- 파라미터 이름 kind -->
						<select name="kind" id="k" class="search form-select" aria-label="Default select example" style="width: 10%;" data-kind="${pager.kind}" >
						  <option class="kind" value="title">제목</option>
						  <option class="kind" value="contents">내용</option>
						</select> 
						<input type="text" name="search" value="${pager.search}" class="search form-control" style="width: 30%;" aria-label="Search" placeholder="검색어를 입력하세요.">
						<button type="submit" class="btn btn-primary">조회</button>
					  </form>
					</div>
					
				</div>
				<div style="text-align: right; margin-bottom: 3rem; margin-right: 1rem;">
					<a class="btn btn-primary" href="/approval/add?division=휴가신청서">새결재작성</a>
				  </div>
					<div class="nav-align-top mb-4">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item" role="presentation">
								<button type="button" id="allBtn" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-all" aria-controls="navs-justified-all" aria-selected="true">전체</button>
							</li>
							<li class="nav-item" role="presentation">
								<button type="button" id="watingBtn" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-wating" aria-controls="navs-justified-wating" aria-selected="true">대기</button>
							</li>
							<li class="nav-item" role="presentation">
								<button type="button" id="watingBtn" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-proceeding" aria-controls="navs-justified-proceeding" aria-selected="true">진행</button>
							</li>
							<li class="nav-item" role="presentation">
								<button type="button" id="watingBtn" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-reject" aria-controls="navs-justified-reject" aria-selected="true">반려</button>
							</li>
							<li class="nav-item" role="presentation">
								<button type="button" id="watingBtn" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-complete" aria-controls="navs-justified-complete" aria-selected="true">완료</button>
							</li>
							<li class="nav-item" role="presentation">
								<a href="/approval/tempList" class="nav-link" id="temporaryBtn">임시저장</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade show active" id="navs-justified-all" role="tabpanel">
								<div id="box">
									
								<!-- Hoverable Table rows -->
								
									<div class="table-responsive text-nowrap">
										<table class="table table-hover">
											<thead>
												<tr>
													<th>기안일</th>
													<th>결재양식</th>
													<th>제목</th>
													<th>문서번호</th>
													<th>결재상태</th>
												</tr>
											</thead>
											<tbody class="table-border-bottom-0">
												<c:forEach items="${list}" var="vo">
													<tr>
														<td>${vo.regDate}</td>
														<td><a href="./detail?approvalNum=${vo.approvalNum}">${vo.category}</a></td>
														<td>${vo.title}</td>
														<td>${vo.approvalNum}</td>
														<td>${vo.state}</td>
														
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									
									<ul class="pagination justify-content-center">
										<li class="page-item prev ${pager.pre?'':'disabled'}">
										  <a class="page-link move" data-num="${pager.startNum-1}" href="#"><i class="tf-icon bx bx-chevrons-left"></i></a>
										</li>
										<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
										   <li class="page-item">
										   	<a class="page-link move b1" value="1" data-num="${i}" href="./list?kind=${pager.kind}&search=${pager.search}&page=${i}">${i}</a>
										   </li>
										</c:forEach>
										<li class="page-item next ${pager.next?'':'disabled'}">
										  <a class="page-link move" data-num="${pager.lastNum+1}" href="#"><i class="tf-icon bx bx-chevrons-right"></i></a>
										</li>
									</ul>
									
									
								</div>
								<!--/ Hoverable Table rows -->
							</div>
							<div class="tab-pane fade show" id="navs-justified-wating" role="tabpanel">
								<div id="box">
									
								<!-- Hoverable Table rows -->
								
									<div class="table-responsive text-nowrap">
										<table class="table table-hover">
											<thead>
												<tr>
													<th>기안일</th>
													<th>결재양식</th>
													<th>제목</th>
													<th>문서번호</th>
													<th>결재상태</th>
												</tr>
											</thead>
											<tbody class="table-border-bottom-0">
												<c:forEach items="${wl}" var="vo">
													<tr>
														<td>${vo.regDate}</td>
														<td><a href="./detail?approvalNum=${vo.approvalNum}">${vo.category}</a></td>
														<td>${vo.title}</td>
														<td>${vo.approvalNum}</td>
														<td>${vo.state}</td>
														
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									
										<ul class="pagination justify-content-center">
											<li class="page-item prev ${wp.pre?'':'disabled'}">
											  <a class="page-link move" data-num="${wp.startNum-1}" href="#"><i class="tf-icon bx bx-chevrons-left"></i></a>
											</li>
											<c:forEach begin="${wp.startNum}" end="${wp.lastNum}" var="i">
											   <li class="page-item">
												 <a class="page-link move b1" value="1" data-num="${i}" href="./list?kind=${pager.kind}&search=${pager.search}&page=${i}">${i}</a>
											   </li>
											</c:forEach>
											<li class="page-item next ${wp.next?'':'disabled'}">
											  <a class="page-link move" data-num="${wp.lastNum+1}" href="#"><i class="tf-icon bx bx-chevrons-right"></i></a>
											</li>
										  </ul>
									
								</div>
								<!--/ Hoverable Table rows -->
							</div>
							<div class="tab-pane fade show" id="navs-justified-proceeding" role="tabpanel">
								<div id="box">
								
								<!-- Hoverable Table rows -->
								
									<div class="table-responsive text-nowrap">
										<table class="table table-hover">
											<thead>
												<tr>
													<th>기안일</th>
													<th>결재양식</th>
													<th>제목</th>
													<th>문서번호</th>
													<th>결재상태</th>
												</tr>
											</thead>
											<tbody class="table-border-bottom-0">
												<c:forEach items="${pl}" var="vo">
													<tr>
														<td>${vo.regDate}</td>
														<td><a href="./detail?approvalNum=${vo.approvalNum}">${vo.category}</a></td>
														<td>${vo.title}</td>
														<td>${vo.approvalNum}</td>
														<td>${vo.state}</td>
														
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									
										<ul class="pagination justify-content-center">
											<li class="page-item prev ${pp.pre?'':'disabled'}">
											  <a class="page-link move" data-num="${pp.startNum-1}" href="#"><i class="tf-icon bx bx-chevrons-left"></i></a>
											</li>
											<c:forEach begin="${pp.startNum}" end="${pp.lastNum}" var="i">
											   <li class="page-item">
												 <a class="page-link move b1" value="1" data-num="${i}" href="./list?kind=${pager.kind}&search=${pager.search}&page=${i}">${i}</a>
											   </li>
											</c:forEach>
											<li class="page-item next ${pp.next?'':'disabled'}">
											  <a class="page-link move" data-num="${pp.lastNum+1}" href="#"><i class="tf-icon bx bx-chevrons-right"></i></a>
											</li>
										  </ul>
									
								</div>
								<!--/ Hoverable Table rows -->
							</div>
							<div class="tab-pane fade show" id="navs-justified-reject" role="tabpanel">
								<div id="box">
									
								<!-- Hoverable Table rows -->
								
									<div class="table-responsive text-nowrap">
										<table class="table table-hover">
											<thead>
												<tr>
													<th>기안일</th>
													<th>결재양식</th>
													<th>제목</th>
													<th>문서번호</th>
													<th>결재상태</th>
												</tr>
											</thead>
											<tbody class="table-border-bottom-0">
												<c:forEach items="${rl}" var="vo">
													<tr>
														<td>${vo.regDate}</td>
														<td><a href="./detail?approvalNum=${vo.approvalNum}">${vo.category}</a></td>
														<td>${vo.title}</td>
														<td>${vo.approvalNum}</td>
														<td>${vo.state}</td>
														
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									
										<ul class="pagination justify-content-center">
											<li class="page-item prev ${rp.pre?'':'disabled'}">
											  <a class="page-link move" data-num="${rp.startNum-1}" href="#"><i class="tf-icon bx bx-chevrons-left"></i></a>
											</li>
											<c:forEach begin="${rp.startNum}" end="${rp.lastNum}" var="i">
											   <li class="page-item">
												 <a class="page-link move b1" value="1" data-num="${i}" href="./list?kind=${pager.kind}&search=${pager.search}&page=${i}">${i}</a>
											   </li>
											</c:forEach>
											<li class="page-item next ${rp.next?'':'disabled'}">
											  <a class="page-link move" data-num="${rp.lastNum+1}" href="#"><i class="tf-icon bx bx-chevrons-right"></i></a>
											</li>
										  </ul>
									
								</div>
								<!--/ Hoverable Table rows -->
							</div>
							<div class="tab-pane fade show" id="navs-justified-complete" role="tabpanel">
								<div id="box">
									
								<!-- Hoverable Table rows -->
								
									<div class="table-responsive text-nowrap">
										<table class="table table-hover">
											<thead>
												<tr>
													<th>기안일</th>
													<th>결재양식</th>
													<th>제목</th>
													<th>문서번호</th>
													<th>결재상태</th>
												</tr>
											</thead>
											<tbody class="table-border-bottom-0">
												<c:forEach items="${cl}" var="vo">
													<tr>
														<td>${vo.regDate}</td>
														<td><a href="./detail?approvalNum=${vo.approvalNum}">${vo.category}</a></td>
														<td>${vo.title}</td>
														<td>${vo.approvalNum}</td>
														<td>${vo.state}</td>
														
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									
										<ul class="pagination justify-content-center">
											<li class="page-item prev ${cp.pre?'':'disabled'}">
											  <a class="page-link move" data-num="${cp.startNum-1}" href="#"><i class="tf-icon bx bx-chevrons-left"></i></a>
											</li>
											<c:forEach begin="${cp.startNum}" end="${cp.lastNum}" var="i">
											   <li class="page-item">
												 <a class="page-link move b1" value="1" data-num="${i}" href="./list?kind=${pager.kind}&search=${pager.search}&page=${i}">${i}</a>
											   </li>
											</c:forEach>
											<li class="page-item next ${cp.next?'':'disabled'}">
											  <a class="page-link move" data-num="${cp.lastNum+1}" href="#"><i class="tf-icon bx bx-chevrons-right"></i></a>
											</li>
										  </ul>
									
								</div>
								<!--/ Hoverable Table rows -->
							</div>
							
						</div>
						
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
	<script>

		console.log($("#first").attr("data-num"));
	</script>
  </body>
</html>