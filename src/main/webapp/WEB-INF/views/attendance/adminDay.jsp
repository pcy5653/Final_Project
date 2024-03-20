<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h3>
  <button class="icon_btn" id="pre_day"><i class="fa-solid fa-chevron-left fa-xs"></i></button>
    <span id="work" data-date="${attendance.workDate}">${attendance.workDate}</span>
  <button class="icon_btn" id="next_day"><i class="fa-solid fa-chevron-right fa-xs"></i></button>
</h3>

<div class="s_box">
  <form>
      <input type="hidden" value="1" name="page" id="page">
      <select name="kind" class="form-select" id="k" data-kind="${pager.kind}" aria-label="Default select example">
          <option class="kind" value="name">이름</option>
          <option class="kind" value="state">상태</option>
      </select>
      <input type="text" name="search" id="search" value="${pager.search}" placeholder="검색어를 입력하세요" class="form-control" aria-label="Search">
      <button type="button" id="submit_btn" class="btn btn-primary">조회</button>
  </form>
</div>
<div class="b_box">
  <button id="month_btn" class="btn btn-primary">월별 근태 확인</button>
</div>
<c:if test="${empty list}">
  <div class="not">
    조회된 내용이 없습니다
  </div>
</c:if>
<c:if test="${not empty list}"> 
<div class="card">
  <div id="attendance_day">
    <table class="table table-hover">
      <thead>
        <tr>
          <th>번호</th>
          <th>이름</th>
          <th>출근시간</th>
          <th>퇴근시간</th>
          <th>상태</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${list}" var="vo" varStatus="i">
          <tr>
            <td>${i.index+1}</td>
            <td>${vo.employeeVO.name}</td>
            <td>${vo.onTime}</td>
            <td>${vo.offTime}</td>
            <td>${vo.state}</td>
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
      <a class="page-link move" data-num="${i}" href="#">${i}</a>
    </li>
  </c:forEach>
  <li class="page-item next ${pager.next?'':'disabled'}">
    <a class="page-link move" data-num="${pager.lastNum+1}" href="#"><i class="tf-icon bx bx-chevrons-right"></i></a>
  </li>
</ul>
</c:if>
