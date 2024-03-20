<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags" %> <%@ taglib prefix="spring"
uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
 -->
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
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script
      src="https://kit.fontawesome.com/4d61d0b940.js"
      crossorigin="anonymous"
    ></script>
    <script src="/fullcalendar-6.1.9/fullcalendar-6.1.9/dist/index.global.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- fullcalendar 언어 CDN -->

    <!-- bootstrap 4 -->

    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <style type="text/css">
      .fc-header-toolbar {
        padding-top: 1em;
        padding-left: 1em;
        padding-right: 1em;
      }
      #calendar{
        background-color: white !important;
      }
    </style>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        var calendarEl = document.getElementById("calendar");

        var calendar = new FullCalendar.Calendar(calendarEl, {
          height: "700px", // calendar 높이 설정
          expandRows: true, // 화면에 맞게 높이 재설정
          slotMinTime: "08:00", // Day 캘린더에서 시작 시간
          slotMaxTime: "20:00", // Day 캘린더에서 종료 시간
          //커스텀 버튼

          // 해더에 표시할 툴바
          headerToolbar: {
            left: "prev,next today",
            center: "title",
            right: "dayGridMonth,listWeek",
          },
          initialView: "dayGridMonth", // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
          //initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
          navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
          editable: true, // 수정 가능?
          selectable: true, // 달력 일자 드래그 설정가능
          nowIndicator: true, // 현재 시간 마크
          dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
          locale: "ko", // 한국어 설정
          eventAdd: function (obj) {
            // 이벤트가 추가되면 발생하는 이벤트
            console.log(obj);
          },
          eventChange: function (obj) {
            // 이벤트가 수정되면 발생하는 이벤트
            console.log(obj);
          },
          eventRemove: function (obj) {
            // 이벤트가 삭제되면 발생하는 이벤트
            console.log(obj);
          },
          select: function (arg) {
            // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
            var title = prompt("Event Title:");
            if (title) {
              calendar.addEvent({
                title: title,
                start: arg.start,
                end: arg.end,
                allDay: arg.allDay,
              });
            }
            calendar.unselect();
          },
          // 이벤트
          events: "/ptClass/myClassList",
          eventClick: function (info) {
            if (confirm("정말 일정을 삭제하시겠습니까?")) {
              $.ajax({
                type: "POST",
                url: "./delClass",
                data: {
                  ptNum: info.event.id,
                },
                success: function () {
                  console.log("이벤트 삭제 성공");
                  info.event.remove();
                },
                error: function () {
                  console.log("이벤트 삭제 실패");
                },
              });
            }
          },
        });
        // 캘린더 랜더링
        calendar.render();
        //모달창 이벤트
        $("#saveChanges").on("click", function () {
          var eventData = {
            title: $("#title").val(),
            start: $("#start").val(),
            end: $("#end").val(),
            color: $("#color").val(),
          };
          // 빈 값 입력 시 오류
          if (
            eventData.title == "" ||
            eventData.start == "" ||
            eventData.end == ""
          ) {
            alert("입력하지 않은 값이 있습니다.");
          }
          // 끝나는 날짜가 시작하는 날짜보다 값이 크면 안 됨
          else if ($("#start").val() > $("#end").val()) {
            alert("시간을 잘못 입력하셨습니다.");
          } else {
            // 이벤트 소스 추가
            calendar.addEvent(eventData);
            $("#exampleModal").modal("hide");
            $("#title").val("");
            $("#start").val("");
            /* $("#end").val(""); */
            /* $("#color").val(""); */
          }
        });
      });
    </script>

    <title>
      Dashboard - Analytics | Sneat - Bootstrap 5 HTML Admin Template - Pro
    </title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link
      rel="icon"
      type="image/x-icon"
      href="../assets/img/favicon/favicon.ico"
    />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link
      rel="stylesheet"
      href="../assets/vendor/css/core.css"
      class="template-customizer-core-css"
    />
    <link
      rel="stylesheet"
      href="../assets/vendor/css/theme-default.css"
      class="template-customizer-theme-css"
    />
    <link rel="stylesheet" href="../assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link
      rel="stylesheet"
      href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css"
    />

    <link
      rel="stylesheet"
      href="../assets/vendor/libs/apex-charts/apex-charts.css"
    />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="../assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../assets/js/config.js"></script>
    <c:import url="/WEB-INF/views/layout/base.jsp"></c:import>
  </head>

  <body>
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
            <h2></h2>
			
            <div class="container-xxl flex-grow-1 container-p-y">
            <div id="calendar"></div>
              

              <!-- 부트스트랩 modal 부분 -->
              <!-- Modal -->
              <div
                class="modal fade"
                id="exampleModal"
                tabindex="-1"
                aria-labelledby="exampleModalLabel"
                aria-hidden="true"
              >
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">
                        수업예약
                      </h5>
                      <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                      ></button>
                    </div>
                    <div class="modal-body">
                      <input
                        type="text"
                        name="employeeNum"
                        id="employeeNum"
                        style="display: none"
                      /><br />
                      <input
                        type="text"
                        name="memberNum"
                        id="memberNum"
                        style="display: none"
                      /><br />
                      회원이름 : <input type="text" id="title" /><br />
                      시작시간 :
                      <input
                        type="datetime-local"
                        name="startTime"
                        id="start"
                      /><br />
                      종료시간 :
                      <input
                        type="datetime-local"
                        name="finishTime"
                        id="finish"
                      /><br />
                    </div>
                    <div class="modal-footer">
                      <button
                        type="button"
                        class="btn btn-secondary"
                        data-bs-dismiss="modal"
                      >
                        취소
                      </button>
                      <button
                        type="submit"
                        class="btn btn-primary"
                        id="saveChanges"
                      >
                        추가
                      </button>
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
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->

    <script type="text/javascript">
      $(document).ready(function () {
        $("#saveChanges").on("click", function () {
          $.ajax({
            type: "POST",
            url: "/ptClass/addClass",
            data: {
              employeeNum: $("#employeeNum").val(),
              memberNum: $("#memberNum").val(),
              startTime: $("#startTime").val(),
              finishTime: $("#finishTime").val(),
            },
            success: function (response) {
              window.location.replace(response);
            },
            error: function (error) {
              console.log("error");
            },
          });
        });
      });
    </script>
    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="../assets/vendor/libs/jquery/jquery.js"></script>
    <script src="../assets/vendor/libs/popper/popper.js"></script>
    <script src="../assets/vendor/js/bootstrap.js"></script>
    <script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="../assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="../assets/vendor/libs/apex-charts/apexcharts.js"></script>

    <!-- Main JS -->
    <script src="../assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="../assets/js/dashboards-analytics.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>

    <!-- icon js -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  </body>
</html>
