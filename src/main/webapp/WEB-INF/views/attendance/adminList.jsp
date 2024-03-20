<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<h3 style="padding: 10px;">근태 수정 요청 목록</h3>

<div class="s_box">
  <form>
      <input type="hidden" value="1" name="page" id="page">
      <select name="kind" class="form-select" id="k" data-kind="${pager.kind}" aria-label="Default select example">
          <option class="kind" value="name">이름</option>
          <option class="kind" value="status">상태</option>
      </select>
      <input type="text" id="search" name="search" value="${pager.search}" placeholder="검색어를 입력하세요" class="form-control" aria-label="Search">
      <button type="button" id="search_btn" class="btn btn-primary">조회</button>
  </form>
</div>

<div class="card" style="margin-top: 3.6rem;">
  <div id="req_list">
    <table class="table table-hover">
      <thead>
        <tr>
          <th>번호</th>
          <th>작성자</th>
          <th>작성일</th>
          <th>근태수정요청일</th>
          <th>출/퇴근</th>
          <th>상태</th>
          <th>상세</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${list}" var="vo" varStatus="i">
          <tr>
            <td>${i.index+1}</td>
            <td>${vo.employeeVO.name}</td>
            <td>${vo.regDate}</td>
            <td>${vo.modifyDate}</td>
            <td>${vo.type}</td>
            <td>
              <c:choose>
                <c:when test="${vo.status eq '요청'}">
                          <a href="/admin/attendanceModify/update?attendanceModifyNum=${vo.attendanceModifyNum}">
                            ${vo.status}
                          </a>				
                </c:when>
                <c:otherwise>
                  ${vo.status}
                </c:otherwise>
              </c:choose>
            </td>
            <td>
              <a href="/admin/attendanceModify/detail?attendanceModifyNum=${vo.attendanceModifyNum}">
                <i class='bx bx-info-circle'></i>
              </a>
            </td>
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
