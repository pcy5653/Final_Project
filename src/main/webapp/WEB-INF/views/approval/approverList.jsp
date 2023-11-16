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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> 
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
			<div class="content-wrapper container-xxl flex-grow-1 container-p-y" style="padding: 1rem 0 !important;">
              <!-- Content 내용 여기로 -->
              <h3 style="text-align: center; margin:2rem 0 1rem;">결재문서함</h3>
              <div class="container-xxl flex-grow-1 container-p-y" style="padding: 1rem 0 !important;">
				<div>
					<div class="m-5" style="margin:1.5rem auto !important;">
					  <form action="./approverList" method="get" id="frm" style="display: flex;justify-content: center;">
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
					
				<div class="nav-align-top mb-1">
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item" role="presentation">
							<button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-all" aria-controls="navs-justified-all" aria-selected="true">전체</button>
						</li>
						<li class="nav-item" role="presentation">
							<button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-leave" aria-controls="navs-justified-leave" aria-selected="true">휴가신청</button>
						</li>
						<li class="nav-item" role="presentation">
							<button type="button"  class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-stop" aria-controls="navs-justified-stop" aria-selected="true">휴직신청</button>
						</li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade show active" id="navs-justified-all" role="tabpanel">
							<div id="box">
							<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item" role="presentation">
								<button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-before" aria-controls="navs-justified-before" aria-selected="true">결재전</button>
							</li>
							<li class="nav-item" role="presentation">
								<button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-after" aria-controls="navs-justified-after" aria-selected="true">결재완료</button>
							</li>
							</ul>
							
							<div class="tab-content">
								<div class="tab-pane fade show active" id="navs-justified-before" role="tabpanel">
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
															<th>기안자</th>
															<th>결재상태</th>
														</tr>
													</thead>
													<tbody class="table-border-bottom-0">
														<c:forEach items="${abl}" var="vo">
															<tr>
																<td>${vo.regDate}</td>
																<td>${vo.category}</td>
																<td><a href="./approverDetail?approvalNum=${vo.approvalNum}">${vo.title}</a></td>
																<td>${vo.approvalNum}</td>
																<td>${vo.name}</td>
																<td>${vo.state}</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
											
												<ul class="pagination justify-content-center">
													<li class="page-item prev ${abpager.pre?'':'disabled'}">
													  <a class="page-link move" data-num="${abpager.startNum-1}" href="#"><i class="tf-icon bx bx-chevrons-left"></i></a>
													</li>
													<c:forEach begin="${abpager.startNum}" end="${abpager.lastNum}" var="i">
													   <li class="page-item">
														 <a class="page-link move b1" value="1" data-num="${i}" href="#">${i}</a>
													   </li>
													</c:forEach>
													<li class="page-item next ${abpager.next?'':'disabled'}">
													  <a class="page-link move" data-num="${abpager.lastNum+1}" href="#"><i class="tf-icon bx bx-chevrons-right"></i></a>
													</li>
												  </ul>
											
									</div>
										<!--/ Hoverable Table rows -->
								</div>
								<div class="tab-pane fade show" id="navs-justified-after" role="tabpanel">
									<div id="box"><!-- Hoverable Table rows -->
										
										
										
											<div class="table-responsive text-nowrap">
												<table class="table table-hover">
													<thead>
														<tr>
															<th>기안일</th>
															<th>결재양식</th>
															<th>제목</th>
															<th>문서번호</th>
															<th>기안자</th>
															<th>결재상태</th>
														</tr>
													</thead>
													<tbody class="table-border-bottom-0">
														<c:forEach items="${aal}" var="vo">
															<tr>
																<td>${vo.regDate}</td>
																<td>${vo.category}</td>
																<td><a href="./approverDetail?approvalNum=${vo.approvalNum}">${vo.title}</a></td>
																<td>${vo.approvalNum}</td>
																<td>${vo.name}</td>
																<td>${vo.state}</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
												<ul class="pagination justify-content-center">
													<li class="page-item prev ${aapager.pre?'':'disabled'}">
													  <a class="page-link move" data-num="${aapager.startNum-1}" href="#"><i class="tf-icon bx bx-chevrons-left"></i></a>
													</li>
													<c:forEach begin="${aapager.startNum}" end="${aapager.lastNum}" var="i">
													   <li class="page-item">
														 <a class="page-link move b1" value="1" data-num="${i}" href="#">${i}</a>
													   </li>
													</c:forEach>
													<li class="page-item next ${aapager.next?'':'disabled'}">
													  <a class="page-link move" data-num="${aapager.lastNum+1}" href="#"><i class="tf-icon bx bx-chevrons-right"></i></a>
													</li>
												  </ul>
				
										
									</div>	<!--/ Hoverable Table rows -->
								</div>
						
							
							</div>
						</div>
					</div>
					
				<div>
					<!-- <div class="nav-align-top mb-4">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item" role="presentation">
								<a href="/approval/approverList?division=${param.division}&progress=결재전" class="nav-link" id="allBtn">결재전</a>
							</li>
							<li class="nav-item" role="presentation">
								<a href="/approval/approverList?division=${param.division}&progress=결재완료" class="nav-link">결재완료</a>
							</li>
							
						</ul>
					</div>
				</div>

				<div>
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>기안일</th>
								<th>결재양식</th>
								<th>제목</th>
								<th>문서번호</th>
								<th>기안자</th>
								<th>결재상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="vo">
								<tr>
									<td>${vo.regDate}</td>
									<td>${vo.category}</td>
									<td><a href="./approverDetail?approvalNum=${vo.approvalNum}">${vo.title}</a></td>
									<td>${vo.approvalNum}</td>
									<td>${vo.name}</td>
									<td>${vo.state}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-sm-12 col-md-7">
					<div class="dataTables_paginate paging_simple_numbers"
						id="dataTable_paginate">
						<ul class="pagination">
							<li
								class="paginate_button page-item previous ${pager.pre?'':'disabled'}"
								id="dataTable_previous"><a
								href="./approverList?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}&division=${pager.division}"
								aria-controls="dataTable" data-dt-idx="0" tabindex="0"
								class="page-link">Previous</a></li>
							<c:forEach begin="${pager.startNum }" end="${pager.lastNum}"
								var="i">
								<li class="paginate_button page-item active" id="dataTable">
									<a
									href="./approverList?page=${i}&kind=${pager.kind}&search=${pager.search}&division=${pager.division}"
									aria-controls="dataTable" data-dt-idx="1" tabindex="0"
									class="page-link">${i}</a>
								</li>
							</c:forEach>

							<li
								class="paginate_button page-item next ${pager.next?'':'disabled'}"
								id="dataTable_next"><a
								href="./approverList?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}&division=${pager.division}"
								aria-controls="dataTable" data-dt-idx="7" tabindex="0"
								class="page-link">Next</a></li>
						</ul>
					</div>
				</div>
				</div>

              </div> -->
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
  
	<script src="/js/approval/approverList.js"></script>
    <c:import url="/WEB-INF/views/layout/js.jsp"></c:import>
  </body>
</html>