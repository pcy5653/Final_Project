<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<style>
    	h3 {
	    	margin-top: 40px !important;
	    	text-align: center;
	    }

		.a1{
			color: white;
		}
		
		#btn{
		    text-align: center;
   			margin: auto;
		}
		table{
			table-layout: fixed;
		}
		#title1{
			font-size: 18px;
			
		}
		.table:not(.table-dark) th {
		    color: #566a7f;
		    text-align: center;
		}
		.titleCss{
		    background: rgb(229 229 229) !important;
		    font-size: 1.2rem !important;
		    line-height: 1.4rem;
		}
	</style>
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
              <div class="container-xxl flex-grow-1 container-p-y" style="max-width: 91rem !important;">
				<div class="card">
					<h3>공지사항</h3>
	
	              <div class="row">
	                <div class="mb-4">
	                    <div class="card-body" style="
					    border: 1px solid #ccc;
					    margin: 2rem 10rem;
					    padding: 0;
					    ">
	                      <div>
	                       
	                      	<table class="table">
	                      		<tr >
	                      			<th class="titleCss">제목</th>
	                      			<td id="title1" data-num="${notice.noticeNum}" colspan="5">
	                      			<strong class="
												<c:if test="${notice.category == '인사'}">badge bg-label-warning me-1</c:if>
												<c:if test="${notice.category == '시설'}">badge bg-label-success me-1</c:if>
												<c:if test="${notice.category == '휴무'}">badge bg-label-info me-1</c:if>
												<c:if test="${notice.category == '기타'}">badge bg-label-primary me-1</c:if>
									">${notice.category}</strong
	                      			> ${notice.title}</td>
	                      		</tr>
	                      		<tr>
	                      			<th class="titleCss">작성자</th>
	                      			<td colspan="2">${notice.name}</td>
	                      			<td></td>
	                      			<td></td>
	                      			<td></td>
	                      		</tr>
	                      		<tr>
	                      			<th class="titleCss">작성일</th>
	                      			<td>${notice.modDate}</td>
	                      			<th class="titleCss">조회</th>
	                      			<td>${notice.hit}</td>
	                      			<td></td>
	                      			<td></td>
	                      		</tr>
	                      	</table>
	                      </div>
	                      <div style="margin: 3%;">
	                      		${notice.contents}<br>
	                      </div>
                   		  <c:if test="${fn:length(notice.list) != 0}">
	                   		  <hr>
	                   		  <c:forEach items="${notice.list}" var="f">
	                   			  <a style="margin: 3%;" href="./noticefiledown?fileNum=${f.fileNum}">${f.oriName}</a><br>
	                   		  </c:forEach>
	                      </c:if>
	                    </div>
	                      <div id="btn" class="col-sm-10">
	                          	<a class="a1 btn btn-primary" href="./list">이전</a>
								<sec:authentication property="principal" var="user"/>
								<c:if test="${user.employeeNum == notice.employeeNum}">
		                            <a class="a1 btn btn-primary" href="./update?noticeNum=${notice.noticeNum}">수정</a>
		                            <button type="button" class="delete btn btn-primary">삭제</button>
                            	</c:if>
	                      </div>
	                  </div>
	                    <!-- /Account -->
	                  </div>
				</div>
                </div>
              </div>
              </div>
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
	<script>
		$('.delete').click(function(){
			let num = $('#title1').attr("data-num");
			
			let deletePost = '<form style="display:none;" id="delete2" action="./delete" method="post"><input name=noticeNum value="'
								+num+'"/></form>';
			$('#btn').append(deletePost);
			$('#delete2').submit();
			
		})
	</script>
</body>
</html>