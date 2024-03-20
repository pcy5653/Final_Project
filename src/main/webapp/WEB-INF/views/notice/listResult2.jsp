<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<div class="table-responsive text-nowrap">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회</th>
						</tr>
					</thead>
					<tbody class="table-border-bottom-0">
						<c:forEach items="${list}" var="li"  varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td><span class="
												<c:if test="${li.category == '인사'}">badge bg-label-warning me-1</c:if>
												<c:if test="${li.category == '시설'}">badge bg-label-success me-1</c:if>
												<c:if test="${li.category == '휴무'}">badge bg-label-info me-1</c:if>
												<c:if test="${li.category == '기타'}">badge bg-label-primary me-1</c:if>
									">${li.category}</span>
									<a class="a2" href="./detail?noticeNum=${li.noticeNum}">${li.title}</a></td>
								<td>${li.name}</td>
								<td>${li.modDate}</td>
								<td>${li.hit}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<nav aria-label="Page navigation" style="background-color: white;">
				<ul id="pageBox" class="pagination justify-content-center">
					<li class="page-item prev ${pager.pre?'':'disabled'}">
						<button class="pageBtn2 page-link" data-p="${pager.startNum-1}">
							<i class="tf-icon bx bx-chevrons-left"></i>
						</button>
					</li>
					<c:if test="${pager.lastNum==0}">
						<li class="page-item">
							<button class="pageBtn2 page-link" data-p="1">1</button>
						</li>
					</c:if>
					<c:forEach  begin="${pager.startNum}" end="${pager.lastNum}" var="i">
						<li class="page-item">
							<button class="pageBtn2 page-link" data-p="${i}" <c:if test="${i eq pager.page}">style="background-color: #696cff; color: white;"</c:if>
							>${i}</button>
						</li>
					</c:forEach>
					<li class="page-item next ${pager.next?'':'disabled'}">
						<button class="pageBtn2 page-link" data-p="${pager.lastNum+1}">
							<i class="tf-icon bx bx-chevrons-right"></i>
						</button>
					</li>
				</ul>
			</nav>