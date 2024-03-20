<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags" %>
<style>
  .menu-vertical .menu-inner > .menu-item {
    width: 100%;
    padding: 0.2rem 1.8rem;
  }
  .menu-vertical .menu-inner > .menu-item .menu-link {
    font-size: 1.1rem;
    font-weight: 600;
  }
  .subDiv {
    font-size: 1rem;
  }
  #logo{
  	width: 130px;
    height: 130px;
  }
  .menu .app-brand.demo {
    height: 80px;
    margin-top: 12px;
  }
  .menu-vertical .app-brand {
    padding-right: 2rem;
    padding-left: 3rem;
  }
</style>
<aside
  id="layout-menu"
  class="layout-menu menu-vertical menu bg-menu-theme"
  style="width: 23rem"
>
  <div class="app-brand demo" style="display: flex; justify-content: center;">
    <a href="/home" class="app-brand-link">
    	<img id="logo" alt="" src="/img/CLOUDPT.jpg">
    </a>
    <a
      href="javascript:void(0);"
      class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none"
    >
      <i class="bx bx-chevron-left bx-sm align-middle"></i>
    </a>
  </div>

  <div class="menu-inner-shadow"></div>

  <ul class="menu-inner py-1">
    <!-- Dashboard -->
    <li class="menu-item active">
      <a href="/home" class="menu-link">
        <i class="menu-icon tf-icons bx bx-home-circle"></i>
        <div data-i18n="Analytics">홈</div>
      </a>
    </li>

    <!-- Layouts -->
    <li class="menu-item">
      <a href="javascript:void(0);" class="menu-link menu-toggle">
        <i class="menu-icon tf-icons bx bx-user"></i>
        <div data-i18n="Layouts">직원 관리</div>
      </a>

      <ul class="menu-sub">
        <li class="menu-item">
          <a href="/employee/list" class="menu-link">
            <div data-i18n="Without menu" class="subDiv">전체 직원 목록</div>
          </a>
        </li>
      </ul>
    </li>

    <li class="menu-item">
      <a href="javascript:void(0);" class="menu-link menu-toggle">
        <i class="menu-icon tf-icons bx bx-group"></i>
        <div data-i18n="Account Settings">회원 관리</div>
      </a>
      <ul class="menu-sub">
        <li class="menu-item">
          <a href="/member/list" class="menu-link">
            <div data-i18n="Account" class="subDiv">전체 회원 목록</div>
          </a>
        </li>
      </ul>
    </li>
    <li class="menu-item">
      <a href="javascript:void(0);" class="menu-link menu-toggle">
        <i class="menu-icon tf-icons bx bx-credit-card"></i>
        <div data-i18n="Authentications">이용권 관리</div>
      </a>
      <ul class="menu-sub">
        <li class="menu-item">
          <a href="/membership/list" class="menu-link">
            <div data-i18n="Basic" class="subDiv">이용권 목록</div>
          </a>
        </li>
      </ul>
    </li>
    <li class="menu-item">
      <a href="javascript:void(0);" class="menu-link menu-toggle">
        <i class="menu-icon fa-solid fa-dumbbell"></i>
        <div data-i18n="Misc">시설 관리</div>
      </a>
      <ul class="menu-sub">
        <li class="menu-item">
          <a href="/machine/list" class="menu-link">
            <div data-i18n="Error" class="subDiv">전체 기구 목록</div>
          </a>
        </li>
        <li class="menu-item">
          <a href="/locker/lockerList2" class="menu-link">
            <div data-i18n="Under Maintenance" class="subDiv">
              전체 락커 목록
            </div>
          </a>
        </li>
      </ul>
    </li>
    <!-- Cards -->
    <sec:authorize access="isAuthenticated()">
          <sec:authorize access="hasRole('ROLE_TRAINER')">
    <li class="menu-item">
      <a href="#" class="menu-link menu-toggle">
        <i class="menu-icon fa-solid fa-list-check"></i>
        <div data-i18n="Misc">수업 관리</div>
      </a>
      <ul class="menu-sub">
        <li class="menu-item">
          <a href="/ptClass/ptList" class="menu-link">
            <div data-i18n="Error" class="subDiv">수업 조회</div>
          </a>
        </li>
        <li class="menu-item">
          <a href="/ptClass/myPtList" class="menu-link">
            <div data-i18n="Under Maintenance" class="subDiv">회원 조회</div>
          </a>
        </li>
      </ul>
    </li>
    </sec:authorize>
        </sec:authorize>
    <!-- User interface -->
    <li class="menu-item">
      <a href="javascript:void(0)" class="menu-link menu-toggle">
        <i class="menu-icon fa-solid fa-clipboard-user"></i>
        <div data-i18n="User interface">근태 관리</div>
      </a>
      <ul class="menu-sub">
        <li class="menu-item">
          <a href="/attendance/info" class="menu-link">
            <div data-i18n="Accordion" class="subDiv">내 근태 조회</div>
          </a>
        </li>
        <li class="menu-item">
          <a href="/attendanceModify/list" class="menu-link">
            <div data-i18n="Badges" class="subDiv">근태 수정 요청 목록</div>
          </a>
        </li>
        <li class="menu-item">
          <a id="attendance" href="/admin/attendance" class="menu-link">
            <div data-i18n="Alerts" class="subDiv">전체 근태 조회</div>
          </a>
        </li>
      </ul>
    </li>

    <li class="menu-item">
      <a href="javascript:void(0)" class="menu-link menu-toggle">
        <i class="menu-icon fa-solid fa-file"></i>
        <div data-i18n="Boxicons">결재관리</div>
      </a>
      <ul class="menu-sub">
        <li class="menu-item">
          <a href="/approval/list" class="menu-link">
            <div data-i18n="Accordion" class="subDiv">기안문서함</div>
          </a>
        </li>
        <sec:authorize access="isAuthenticated()">
          <sec:authorize access="!hasRole('ROLE_TRAINER')">
            <li class="menu-item">
              <a href="/approval/approverList" class="menu-link">
                <div data-i18n="Alerts" class="subDiv">결재문서함</div>
              </a>
            </li>
          </sec:authorize>
        </sec:authorize>
        <li class="menu-item">
          <a href="/approval/signMain" class="menu-link">
            <div data-i18n="Badges" class="subDiv">서명관리</div>
          </a>
        </li>
      </ul>
    </li>

    <li class="menu-item">
      <a href="/leave/list" class="menu-link">
        <i class="menu-icon fa-solid fa-plane"></i>
        <div data-i18n="Boxicons">휴가</div>
      </a>
    </li>

    <li class="menu-item">
      <a href="/chat/room" class="menu-link">
        <i class="menu-icon fa-solid fa-comments"></i>
        <div data-i18n="Boxicons">메신저</div>
      </a>
    </li>

    <!--  <li class="menu-item">
              <a href="javascript:void(0)" class="menu-link menu-toggle">
                <i class="menu-icon fa-solid fa-circle-user"></i>
                <div data-i18n="User interface">트레이너</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="#" class="menu-link">
                    <div data-i18n="Accordion">운동 일지</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="/trainer/ptLog" class="menu-link">
                    <div data-i18n="Alerts">PT일지</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="/trainer/diet" class="menu-link">
                    <div data-i18n="Badges">식단 관리</div>
                  </a>
                </li>
                </ul> -->

    <li class="menu-item">
      <a href="/notice/list" class="menu-link">
        <i class="menu-icon fa-solid bx bxs-megaphone"></i>
        <div data-i18n="Boxicons">공지사항</div>
      </a>
    </li>

    <!-- Extended components -->
  </ul>
  <script type="text/javascript">
  
//현재 URL 가져오기
  var currentUrl = window.location.href;
  var pathWithoutHost = currentUrl.replace('http://localhost:82', '');

  console.log('현재 경로:', pathWithoutHost);
  // 모든 메뉴 항목 가져오기
  var menuItems = document.querySelectorAll('.menu-item');
  console.log('a경로:',menuItems);
  </script>
</aside>
<!-- / Menu -->