<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
			<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
				<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		/* Remove default bullets */
	ul, #myUL {
	  list-style-type: none;
	}
	
	/* Remove margins and padding from the parent ul */
	#myUL {
	  margin: 0;
	  padding: 0;
	}
	
	/* Style the caret/arrow */
	.caret {
	  cursor: pointer;
	  user-select: none; /* Prevent text selection */
	}
	
	/* Create the caret/arrow with a unicode, and style it */
	.caret::before {
	  content: "\25B6";
	  color: black;
	  display: inline-block;
	  margin-right: 6px;
	}
	
	/* Rotate the caret/arrow icon when clicked on (using JavaScript) */
	.caret-down::before {
	  transform: rotate(90deg);
	}
	
	/* Hide the nested list */
	.nested {
	  display: none;
	}
	
	/* Show the nested list when the user clicks on the caret/arrow (with JavaScript) */
	.active {
	  display: block;
	}
	</style>
  <c:import url="/WEB-INF/views/layout/base.jsp"></c:import>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> 
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
                
							<div>
								<div class="nav-align-top mb-4">
									<ul class="nav nav-tabs" role="tablist">
										<li class="nav-item" role="presentation">
											<a href="/approval/add?division=휴가신청서" class="nav-link">휴가신청서</a>
										</li>
										<li class="nav-item" role="presentation">
											<a href="/approval/add?division=휴직신청서" class="nav-link">휴직신청서</a>
										</li>
										<li class="nav-item" role="presentation">
											<a href="/approval/add?division=지출결의서" class="nav-link">지출결의서</a>
										</li>
										
									</ul>
								</div>
								
							</div>
							<div>
								
								
								<button type="button" id="tempBtn" class="btn btn-primary">임시저장</button>
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
									결재선
								</button>
								<form action="add" method="post" id="addForm">
									<sec:authorize access="isAuthenticated()">
										<sec:authentication property="principal.username" var="username" />
											<input type="hidden" name="employeeNum" value="${username}">
									</sec:authorize>
									
									<table
										style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;">
										<!-- Header -->
										<colgroup>
											<col width="310">
											<col width="490">
										</colgroup>
										<tbody>
											<tr>
												<td id="division" style="background: white; padding: 0px !important; border: 0px currentColor; height: 90px; text-align: center; color: black; font-size: 36px; font-weight: bold; vertical-align: top;"
													colspan="2"
													class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">

													${param.division}</td>
											</tr>
											<tr>
												<td
													style="background: white; padding: 0px !important; border: currentColor; text-align: left; color: black; font-size: 12px; font-weight: normal; vertical-align: top;">

													<table 
														style="border: 1px solid rgb(0, 0, 0); font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;">
														<!-- User -->
														<colgroup>
															<col width="100">
															<col width="220">
														</colgroup>
														<tbody>
															<tr>
																<td
																	style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

																	기안자</td>
																<td
																	style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
																	<sec:authorize access="isAuthenticated()">
																		<sec:authentication property="principal.name"
																			var="name" />
																		<input type="text" id="name" name="name"
																			value="${name}" readonly>
																	</sec:authorize>
																</td>
															</tr>
															<tr>
																<td
																	style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

																	기안일</td>
																<td
																	style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
																	<c:set var="ymd" value="<%=new java.util.Date()%>" />
																	<fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd" />

																</td>
															</tr>
															<tr>
																<td
																	style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
	
																	문서번호</td>
																<td
																	style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
	
																</td>
															</tr>

														</tbody>
													</table>
												</td>
												<td 
													style="background: white; padding-left: 190px !important; border: currentColor; text-align: right; color: black; font-size: 12px; font-weight: normal; vertical-align: top;">
													<table
													style="border: 1px solid rgb(0, 0, 0); font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;">
													<!-- User -->
													<colgroup>
														<col width="50">
														<col width="100">
														<col width="50">
														<col width="100">
													</colgroup>
													<tbody>
														<tr>
															<td
																style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

																직급</td>
															<td id="middlePosition"
																style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">

																
															</td>
															<td
																style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

																직급</td>
															<td id="lastPosition"
																style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">

																
															</td>
														</tr>
														<tr>
															<td
																style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

																중간결재자</td>
															<td id="middleName"
																style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;"></td>
															<td
																style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
																최종결재자</td>
															<td id="lastName"
																style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;"></td>
														</tr>
														<tr>
															<td
																style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

																결재일</td>
															<td
																style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">

															</td>
															<td
																style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

																결재일</td>
															<td
																style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">

															</td>
														</tr>

													</tbody>
												</table>
												</td>
												
											</tr>
										</tbody>
									</table>
									<c:if test="${param.division=='휴가신청서'}">
									<table
										style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 10px; border-collapse: collapse;">
										<!-- 품의서 -->
										<colgroup>
											<col width="200">
											<col width="350">
											<col width="200">
											<col width="200">
										</colgroup>
										<tbody>
										<tr>
												<td
													style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

													제목</td>
												<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
													colspan="3">
													<input type="text" name="title" id="title">
												</td>
											</tr>
											<tr>
												<td
													style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

													휴가종류</td>
												<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
													colspan="3">
													<select name="leaveKind" id="leaveSelect">
														<option value="">=== 휴가 종류 선택 ===</option>
														<option value="연차" name="leaveKind">연차</option>
														<option value="반차" name="leaveKind">반차</option>
														<option value="병가" name="leaveKind">병가</option>
														<option value="기타" name="leaveKind">기타</option>
													</select>
												</td>
											</tr>
											<tr id="regDateRow">
												<td
													style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

													휴가일자</td>
												<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
													colspan="3">
													<input type="date" id="startDate" name="startDate">
													~ <input type="date" id="endDate" name="endDate">
												</td>

											</tr>

											<tr id="leaveReasonRow">
												<td
													style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

													휴가사유</td>
												<td style="background: rgb(255, 255, 255); border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
													colspan="3" class="dext_table_border_t">
													<textarea id="contents" name="contents"></textarea>

												</td>

											</tr>
											<tr>
												<td style="border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 100px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle; background-color: rgb(255, 255, 255);"
													colspan="4" class="dext_table_border_t"><span
														style="font-weight: bold; font-family: &amp; amp; amp; quot; malgun gothic&amp;amp; amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">휴가기준
														제 13조에 의거 휴가를 신청하오니 허락하여 주시기 바랍니다.</span></td>
											</tr>
										</tbody>
									</table>
									</c:if>
									<c:if test="${param.division=='휴직신청서'}">
									<table
										style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 10px; border-collapse: collapse;">
										<!-- 품의서 -->
										<colgroup>
											<col width="200">
											<col width="350">
											<col width="200">
											<col width="200">
										</colgroup>
										<tbody>
										<tr>
												<td
													style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

													제목</td>
												<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
													colspan="3">
													<input type="text" name="title">
												</td>
											</tr>
											<tr>
												<td
													style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

													휴직종류</td>
												<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
													colspan="3">
													<input type="text" name="title">
												</td>
											</tr>
											<tr id="regDateRow">
												<td
													style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

													휴직기간</td>
												<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
													colspan="3">
													<input type="date" id="startDate" name="startDate">
													~ <input type="date" id="endDate" name="endDate">
												</td>

											</tr>

											<tr id="leaveReasonRow">
												<td
													style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

													휴직사유</td>
												<td style="background: rgb(255, 255, 255); border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
													colspan="3" class="dext_table_border_t">
													<textarea id="summernote" name="contents"></textarea>

												</td>

											</tr>
											<tr>
												<td
													style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

													첨부파일</td>
												<td style="background: rgb(255, 255, 255); border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
													colspan="3" class="dext_table_border_t">
													<input type="file"> <p>*질병일경우 진단서 첨부</p>

												</td>
											</tr>
										</tbody>
									</table>
									</c:if>
									<c:if test="${param.division=='지출결의서'}">
										<table
										style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 10px; border-collapse: collapse;">
										<!-- 품의서 -->
										<colgroup>
											<col width="200">
											<col width="350">
											<col width="200">
											<col width="200">
										</colgroup>
										<tbody>
										<tr>
												<td
													style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

													제목</td>
												<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
													colspan="3">
													<input type="text" name="title">
												</td>
											</tr>

											<tr id="leaveReasonRow">
												<td
													style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

													내용</td>
												<td style="background: rgb(255, 255, 255); border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
													colspan="3" class="dext_table_border_t">
													<textarea id="summernote" name="contents"></textarea>

												</td>

											</tr>
											<tr>
												<td
													style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

													첨부파일</td>
												<td style="background: rgb(255, 255, 255); border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
													colspan="3" class="dext_table_border_t">
													<input type="file">

												</td>
											</tr>
											
										</tbody>
									</table>
									<table
										style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 10px; border-collapse: collapse;">
										<!-- 품의서 -->
										<colgroup>
											<col width="200">
											<col width="200">
											<col width="200">
											<col width="200">
											<col width="200">
											
										</colgroup>
										<tbody id="moneyBody">
											<tr>
												<td
													style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

													일자</td>
													<td
													style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

													분류</td>
													<td
													style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

													금액</td>
													<td
													style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

													사용내역</td>
													<td
													style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

													비고</td>
										
												
											</tr>
											<tr>
												<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
													>
													<input type="date" name="title">
												</td>
												<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
													>
													<input type="text" name="title">
												</td>
												<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
													>
													<input type="text" name="money">
												</td>
												<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
													>
													<input type="text" name="title">
												</td>
												<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
													>
													<input type="text" name="title">
												</td>
											</tr>
											
										</tbody>
									</table>
									</c:if>
									<input type="hidden" id="middle" name="middle">
									<input type="hidden" id="last" name="last">
									<input type="hidden" name="category" value="${param.division}">
									<button type="button" id="approvalBtn" class="btn btn-primary">제출</button>
									<button type="button" id="backBtn" class="btn btn-primary">이전</button>
								
									  
								
								</form>


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
	

  
  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	  <div class="modal-content">
		<div class="modal-header">
		  <h1 class="modal-title fs-5" id="exampleModalLabel">결재선선택</h1>
		  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<div class="modal-body">
			<div class=row>
				<div class="col-sm-3">
			
				<div>조직도</div>
				<div class="card border scrollable-card">
					<div class="overflow-auto " id="readyMem">
						<ul id="myUL">
							<li><span class="caret">대표</span>
								<ul class="nested">
									<c:forEach items="${employeeVO}" var="vo">
										<c:if test="${vo.position=='ROLE_CEO'}">
											<li id="ceo" class="ceo" data-empnum="${vo.employeeNum}" data-name="${vo.name}" data-position="${vo.position}">${vo.name}</li>
										</c:if>
									</c:forEach>
								</ul>
							</li>
							<li><span class="caret">총괄</span>
								<ul class="nested">
									<c:forEach items="${employeeVO}" var="vo">
										<c:if test="${vo.position=='ROLE_GENERAL'}">
											<li id="general" class="general" data-empnum="${vo.employeeNum}" data-name="${vo.name}" data-position="${vo.position}">${vo.name}</li>
										</c:if>
									</c:forEach>
								</ul>
							</li>
							<li><span class="caret">고객관리</span>
								<ul class="nested">
									<c:forEach items="${employeeVO}" var="vo">
										<c:if test="${vo.position=='ROLE_CUSTOMER'}">
											<li id="customer"class="customer" data-empnum="${vo.employeeNum}" data-name="${vo.name}" data-position="${vo.position}">${vo.name}</li>
										</c:if>
									</c:forEach>
								</ul>
							</li>
							<li><span class="caret">인사관리</span>
								<ul class="nested">
									<c:forEach items="${employeeVO}" var="vo">
										<c:if test="${vo.position=='ROLE_RESOURCES'}">
											<li id="resources"class="resources" data-empnum="${vo.employeeNum}" data-name="${vo.name}" data-position="${vo.position}">${vo.name}</li>
										</c:if>
									</c:forEach>
								</ul>
							</li>
							<li><span class="caret">시설관리</span>
								<ul class="nested">
									<c:forEach items="${employeeVO}" var="vo">
										<c:if test="${vo.position=='ROLE_FACILITY'}">
											<li id="facility"class="facility" data-empnum="${vo.employeeNum}" data-name="${vo.name}" data-position="${vo.position}">${vo.name}</li>
										</c:if>
									</c:forEach>
								</ul>
							</li>
							<li><span class="caret">트레이너</span>
								<ul class="nested">
									<c:forEach items="${employeeVO}" var="vo" varStatus="i">
										<c:if test="${vo.position=='ROLE_TRAINER'}">
											<li id="trainer" class="trainer">${vo.name}</li>
										</c:if>
									</c:forEach>
								</ul>
							</li>
						</ul>
					</div>
				</div>
				
				</div>
				
				<div class="col-sm-4">
				
				<div>선택사원</div>
				<div class="card border scrollable-card" style="height:5rem">
					<div class="overflow-auto" id="selectEmp" data-empnum="" data-name="" data-position="">
						
				
						
					</div>
				
				</div>
				
				</div>
				
				<div class="col-sm-1 ">
					<div class="scrollable-card1 text-center d-flex flex-column justify-content-center align-items-center">
						
					</div>
					
					<div class="scrollable-card1 text-center d-flex flex-column justify-content-center align-items-center mt-5">
						
					</div>
					

			
					</div>
						
					
					<div class="col-sm-4 scrollable-card">
					<div id="middleBtn">중간 승인자</div>
					<div class="card border scrollable-card1 overflow-auto" id="mLine" data-empnum="" data-name="" data-position="" style="height:2rem">
						
					</div>
					
					<div id="lastBtn">최종 승인자</div>
					<div class="card border scrollable-card1 overflow-auto" id="lLine" data-empnum="" data-name="" data-position="" style="height:2rem">
						
					</div>
					
					
					</div>
				
				</div>
					</div>
					<button type="button" class="btn btn-primary" id="okBtn">확인</button>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		  
		</div>
		
	  </div>
	</div>
  </div>
	<script src="/js/approval/add.js"></script>
    <c:import url="/WEB-INF/views/layout/js.jsp"></c:import>
  </body>
</html>