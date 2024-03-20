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
  <style>
    .table > :not(:first-child) {box-shadow: 0 2px 3px rgba(0,0,0,0.01), 0 2px 3px rgba(0,0,0,0.12);}
    .table th {
      font-size: 0.9rem !important;
    }
  </style>
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
            <div class="content-wrapper container-xxl flex-grow-1 container-p-y" style="padding: 1rem 0 !important; width: 80%;">
              <!-- Content 내용 여기로 -->
              <h3 style="text-align: center; margin:2rem 0 1rem;">전체 직원 목록</h3>
              <div class="container-xxl flex-grow-1 container-p-y" style="padding-top: 0 !important;">
                <div>
                  <div class="m-5" style="margin:1.5rem auto !important;">
                    <form action="./list" method="get" id="frm" style="display: flex;justify-content: center;">
                      <input type="hidden" value="${pager.page}" id="page" name="page">
                      <!-- 파라미터 이름 kind -->
                      <select name="kind" id="k" class="search form-select" aria-label="Default select example" style="width: 10%;" data-kind="${pager.kind}" >
                        <option class="kind" value="name">이름</option>
                        <option class="kind" value="position">직급</option>
                        <option class="kind" value="stateEmpIn">재직 직원</option>
                        <option class="kind" value="stateOut">퇴직 직원</option>
                      </select> 
                      <input type="text" name="search" value="${pager.search}" class="search form-control" id="sInput" style="width: 30%;" aria-label="Search" placeholder="검색어를 입력하세요.">
                      <button type="submit" class="btn btn-primary">조회</button>
                    </form>
                  </div>
                </div>
                <div style="text-align: right; margin-bottom: 3rem; margin-right: 1rem;">
                  <a href="/employee/join" class="btn btn-primary">직원등록</a>
                </div>
                <div id="req_list" class="table-responsive text-nowrap">
                  <table class="table table-hover" style="text-align: center; background-color: white;">
                    <thead style="background: #e7e7ff;;">
                      <tr>
                        <th>번호</th>
                        <th>사번</th>
                        <th>이름</th>
                        <th>직급</th>
                        <th>전화번호</th>
                        <th>직원상태</th>
                        <th>상세</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${list}" var="vo" varStatus="i">
                        <tr>
                          <td>${i.index+1}</td>
                          <td>${vo.employeeNum}</td>
                          <td>${vo.name}</td>
                          <td>${vo.position}</td>
                          <td>${vo.phone}</td>
                          <td>${vo.state}</td>
                          <td><a href="./detail?employeeNum=${vo.employeeNum}">보기</a></td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
                
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
              <!-- 페이징 -->
							<!-- <nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									<c:if test="${pager.pre}">
									<li class="page-item ${pager.pre?'':'disabled'}"><a class="page-link"
										href="./list?page=${pager.startNum - 1}&kind=${pager.kind}&search=${pager.search}" aria-label="Previous"> 
                      <span aria-hidden="true">&laquo;</span>
									</a></li>
									</c:if>
									<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
										var="i">
										<li class="page-item"><a class="page-link"
											href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
									</c:forEach>
									<c:if test="${pager.next}">
										<li class="page-item"><a class="page-link"
											href="./list?page=${pager.lastNum + 1}&kind=${pager.kind}&search=${pager.search}"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:if>
								</ul>
							</nav> -->
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
    <script type="text/javascript" src="/js/employee/list.js"></script>
    <script>
      // let si = document.getElementById("sInput").value;
      // let k = document.getElementById("k").value;
      // if(k == 'position'){

      //   if(si == '총괄'){
      //     si == 'ROLE_GENERAL';
      //   }else if(si == '고객' && si == '고객인사'){
      //     si == 'ROLE_CUSTOMER';
      //   }else if(si == '인사'){
      //     si == 'ROLE_RESOURCES';
      //   }else if(si == '시설'){
      //     si == 'ROLE_FACILITY';
      //   }else if(si == '트레이너' && si == '트'){
      //     si == 'ROLE_TRAINER';
      //   }else if(si == '대표'){
      //     si == 'ROLE_CEO';
      //   }else if(si == '가발령' && si == '가'){
      //     si == 'ROLE_EX';
      //   }
      // }
      

    </script>
  </body>
</html>