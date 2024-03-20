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
                <div class="nav-align-top mb-4">
                  <ul class="nav nav-tabs nav-fill" role="tablist">
                    <li class="nav-item">
                      <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-info" aria-controls="navs-justified-home" aria-selected="true">
                        전체 기구
                      </button>
                    </li>
                    <li class="nav-item">
                      <button type="button" id="toTab" class="nav-link" role="tab" data-bs-toggle="tab"  data-bs-target="#navs-justified-updatePw" aria-controls="navs-justified-profile" aria-selected="false">
                        기구 점검
                      </button>
                    </li>
                  </ul>
                    <div class="tab-content">
                      <div class="tab-pane fade show active" id="navs-justified-info" role="tabpanel">
                        <p class="mb-0">
                          <div class="content-wrapper container-xxl flex-grow-1 container-p-y">
                            <!-- Content 내용 여기로 -->
                            <h3 style="text-align: center; margin:2rem 0 1rem;">전체 기구</h3>
                            <div style="text-align: right; margin-bottom: 3rem; margin-right: 1rem;">
                              <a href="/machine/add" class="btn btn-primary">기구 등록</a>
                              <button type="button" id="maDel" data-url="/machine/delete" class="btn btn-primary">기구 삭제</button>
                            </div>
                            <div class="row mb-5" style="margin-bottom: 5rem !important;">
                              <c:forEach items="${list}" var="vo" varStatus="i">
                                <div class="col-md-6 col-lg-4 mb-3">
                                  <div class="card h-100">
                                    <div class="card-body" style="text-align: center;">
                                      <input type="checkbox" value="${i.index+1}" data-machineNum="${vo.machineNum}" onclick="deleteSelected()" style="float:left;width:1.2rem;height:1.2rem;">
                                      <div style="width: 13rem; height:13rem; margin: 2rem auto;"> 
                                        <img alt="직원 프로필" onerror="this.style.display='none'" style="width:100%; height: 100%; object-fit: cover;"
                                          class="img-fluid d-flex mx-auto my-4"
                                          src="../file/machine/${vo.fileName}"
                                        />
                                      </div>
                                      <p class="card-text">${vo.name}</p>
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
                        </p>
                      </div>
                      <div class="tab-pane fade" id="navs-justified-updatePw" role="tabpanel">
                        <p class="mb-0">
                          
                        </p>
                      </div>
                    </div> <!-- tab-content -->
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
    <!-- <script type="text/javascript" src="/js/employee/info.js"></script> -->
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
  </body>
  </html>