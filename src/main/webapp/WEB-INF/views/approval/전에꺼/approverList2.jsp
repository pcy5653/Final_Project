<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/layout/css.jsp"></c:import>
<c:import url="/WEB-INF/views/layout/topScript.jsp"></c:import>
<link rel="stylesheet" href="/css/main.css" />

<c:import url="../temp/bootStrap.jsp"/>

</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
		<div id="right">
			<header>
				<div class="header_wrap">
					<div class="header_message">
						<p>이재혁 님 환영합니다</p>
					</div>
					<div class="header_navi">
						<a href="#">조직도</a> <a href="#">로그인</a> <a href="#">로그아웃</a> <a
							href="#">마이페이지</a>
					</div>
				</div>
			</header>
			<!-- main내용  -->
			<section id="mainContents">
			<div>
				<!-- 검색창 -->
				<div>
					<form action="./approverList" method="get"
						style="width: 20%; float: right; margin-right: 180px;">
						<div id="frm" style="width: 300px;">
							<input type="hidden" value="${pager.page}" id="page" name="page">
							<input type="hidden" value="${pager.division}" name="division">
							<!-- 파라미터 이름 kind -->
							<select name="kind" id="k" class="search">
								<option class="kind" value="title">제목</option>
								<option class="kind" value="contents">내용</option>
							</select> <input type="text" name="search" value="${pager.search}"
								class="search" placeholder="검색어를 입력하세요."
								style="text-align: center;">
							<button type="submit">검색</button>
						</div>

					</form>
				</div>
				<div>
					<form action="./approverList" id="divisionForm" method="get">
						<input type="hidden" value="" id="division" name="division">
					</form>
					<button id="allBtn">전체</button>
					<button id="lvBtn">휴가신청</button>
					<button id="exBtn">지출신청</button>
					<button id="abBtn">휴직신청</button>
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
								<th>결재상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="vo">
								<tr>
									<td>${vo.regDate}</td>
									<td>${vo.category}</td>
									<td>${vo.title}</td>
									<td>${vo.approvalNum}</td>
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
				<button>
					<a href="/approval/add">새결재작성</a>
				</button>
				</div>
			</section>

		</div>
	</div>
	<script src="/resources/js/approval/approverList.js"></script>
</body>
<c:import url="/WEB-INF/views/layout/btmScript.jsp"></c:import>
</html>