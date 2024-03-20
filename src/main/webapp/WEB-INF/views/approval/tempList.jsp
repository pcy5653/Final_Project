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
			  <h3 style="text-align: center; margin:2rem 0 1rem;">임시저장함</h3>
              <div class="container-xxl flex-grow-1 container-p-y" style="padding: 1rem 0 !important;">
				<div>
					<div class="m-5" style="margin:1.5rem auto !important;">
					  <form action="./tempList" method="get" id="frm" style="display: flex;justify-content: center;">
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
					<div class="nav-align-top mb-4">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item" role="presentation">
								<a href="/approval/list?division=all" class="nav-link" id="allBtn">전체</a>
							</li>
							<li class="nav-item" role="presentation">
								<a href="/approval/list?division=wating" class="nav-link">대기</a>
							</li>
							<li class="nav-item" role="presentation">
								<a href="/approval/list?division=proceeding" class="nav-link">진행</a>
							</li>
							<li class="nav-item" role="presentation">
								<a href="/approval/list?division=reject" class="nav-link" id="rejectBtn">반려</a>
							</li>
							<li class="nav-item" role="presentation">
								<a href="/approval/list?division=complete" class="nav-link" id="completeBtn">완료</a>
							</li>
							<li class="nav-item" role="presentation">
								<li class="nav-item" role="presentation">
									<button type="button" id="allBtn" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-temp" aria-controls="navs-justified-temp" aria-selected="true">임시저장</button>
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
													<th width="5%"></th>
								<th>임시저장일</th>
								<th>결재양식</th>
								<th>제목</th>
								<th>상태</th>
												</tr>
											</thead>
											<tbody class="table-border-bottom-0">
												<c:forEach items="${list}" var="vo" varStatus="i">
								<tr>
									<td><input type="checkbox" class="checkBoxs" id="checkBox${i.index}" data-approvalNum="${vo.approvalNum}"></td>
									<td>${vo.regDate}</td>	
									<td><a href="./tempDetail?approvalNum=${vo.approvalNum}">${vo.category}</a></td>
									<td>${vo.title}</td>
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
												 <a class="page-link move b1" value="1" data-num="${i}" href="#">${i}</a>
											   </li>
											</c:forEach>
											<li class="page-item next ${pager.next?'':'disabled'}">
											  <a class="page-link move" data-num="${pager.lastNum+1}" href="#"><i class="tf-icon bx bx-chevrons-right"></i></a>
											</li>
										  </ul>
									
								</div>
								<!--/ Hoverable Table rows -->
							</div>
							<button class="btn btn-primary" id="BTN">삭제</button>
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
	<script src="/js/approval/tempList.js"></script>
    <c:import url="/WEB-INF/views/layout/js.jsp"></c:import>
  </body>
</html>