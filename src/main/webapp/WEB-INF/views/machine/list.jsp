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
            <div class="content-wrapper container-xxl flex-grow-1 container-p-y" style="width: 80%; justify-content: flex-start;">
              <!-- Content 내용 여기로 -->
              <h3 style="text-align: center; margin:1.5rem 0 4rem;">전체 기구 목록</h3>
              <div style="text-align: right; margin-bottom: 5rem; margin-right: 1rem;">
                <a href="/machine/add" class="btn btn-primary">기구 등록</a>
                <sec:authorize access="isAuthenticated()">
                  <sec:authorize access="hasRole('ROLE_FACILITY')">
                    <button type="button" id="maDel" data-url="/machine/delete" class="btn btn-primary">기구 삭제</button>
                  </sec:authorize>
                </sec:authorize>
              </div>
              <div class="row mb-5" style="margin-bottom: 5rem !important;">
                <c:forEach items="${list}" var="vo" varStatus="i">
                  <div class="col-md-6 col-lg-4 mb-3">
                    <div class="card h-100">
                      <div class="card-body" style="text-align: center;">
                        <input type="checkbox" value="${i.index+1}" data-machineNum="${vo.machineNum}" onclick="deleteSelected()" style="float:left;width:1.2rem;height:1.2rem;">
                        <div style="width: 13rem; height:13rem; margin: 2rem auto;"> 
                          <img alt="기구사진" onerror="this.style.display='none'" style="width:100%; height: 100%; object-fit: cover;"
                            class="img-fluid d-flex mx-auto my-4"
                            src="../file/machine/${vo.fileName}"
                          />
                        </div>
                        <p class="card-text" style="font-size: 1.2rem;font-weight: bold;color: black;">${vo.name}</p>
                        <p class="card-text">${vo.buyDate}</p>
                      </div>
                    </div>
                  </div>
                </c:forEach>
                <form action="" id="delFrm">
                  <input type="hidden" name="machineNum" value="${vo.machineNum}">
                </form>
              </div>
            </div>
              <!-- <ul class="pagination justify-content-center">
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
              </ul> -->
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

    <!-- / Layout wrapper -->
  </div>

    <c:import url="/WEB-INF/views/layout/js.jsp"></c:import>
    <script>

    let selectedMachineNums = [];

    function deleteSelected() {
        let checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');

        selectedMachineNums = [];
        checkboxes.forEach(function(checkbox) {
            let machineNum = checkbox.getAttribute('data-machineNum');
            selectedMachineNums.push(machineNum);
        });
    }

    // 삭제 버튼 클릭 시 선택한 항목을 서버로 전송
    $("#maDel").click(function() {
        const url = "/machine/delete";
        if (selectedMachineNums.length == 0) {
          alert("선택한 기구가 없습니다.");
        }else{
          confirm("선택한 기구를 정말로 삭제하시겠습니까?")
          $.ajax({
            type: "post",
            url: url,
            contentType : "application/json",
            data: JSON.stringify(selectedMachineNums),
            success: function(response) {
              if (response.result > 0) {
                  alert(response.message);
                  window.location.reload(true);
              } else {
                  // 실패 또는 에러 처리
                  alert("삭제에 실패했습니다. ");
              }
            }
          });
        }
    });
    </script>
    <!-- <script type="text/javascript" src="/js/employee/list.js"></script> -->
  </body>
</html>