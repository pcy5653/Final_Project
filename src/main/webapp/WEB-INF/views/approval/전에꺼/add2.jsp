<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>Insert title here</title>
				<c:import url="/WEB-INF/views/layout/css.jsp"></c:import>
				<c:import url="/WEB-INF/views/layout/topScript.jsp"></c:import>
				<link rel="stylesheet" href="/css/main.css" />

				<c:import url="../temp/bootStrap.jsp" />
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
									<a href="#">조직도</a> <a href="#">로그인</a> <a href="#">로그아웃</a> <a href="#">마이페이지</a>
								</div>
							</div>
						</header>
						<!-- main내용  -->
						<section id="mainContents">

							<div>
								<button id=leaveBtn>휴가신청</button>
								<button>휴직신청서</button>
								<button>지출신청서</button>
							</div>
							<div>
								<button id="approvalInfoBtn" onclick="click_add()">결재정보</button>
								<form action="add" method="post">
									<table
										style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;">
										<!-- Header -->
										<colgroup>
											<col width="310">
											<col width="490">
										</colgroup>
										<tbody>
											<tr>
												<td style="background: white; padding: 0px !important; border: 0px currentColor; height: 90px; text-align: center; color: black; font-size: 36px; font-weight: bold; vertical-align: top;"
													colspan="2"
													class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">

													휴가신청서</td>
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
													style="background: white; padding: 0px !important; border: currentColor; text-align: right; color: black; font-size: 12px; font-weight: normal; vertical-align: top;">
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

																직급</td>
															<td
																style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">

																<input type="text" id="middlePosition" value=""
																	readonly>
															</td>
														</tr>
														<tr>
															<td
																style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

																결재자</td>
															<td
																style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">

																<input type="text" id="middle" name="middle" value=""
																	readonly>

															</td>
														</tr>
														<tr>
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
												<td
													style="background: white; padding: 0px !important; border: currentColor; text-align: right; color: black; font-size: 12px; font-weight: normal; vertical-align: top;">
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

																직급</td>
															<td
																style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">

																<input type="text" id="lastPosition" value=""
																	readonly>
															</td>
														</tr>
														<tr>
															<td
																style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

																결재자</td>
															<td
																style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">

																<input type="text" id="last" name="last" value=""
																	readonly>

															</td>
														</tr>
														<tr>
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
													<input type="date" name="startDate" id="">~<input
														type="date" name="endDate" id="">
												</td>

											</tr>

											<tr id="leaveReasonRow">
												<td
													style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

													휴가사유</td>
												<td style="background: rgb(255, 255, 255); border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
													colspan="3" class="dext_table_border_t">
													<textarea id="summernote" name="contents"></textarea>

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
									<input type="hidden" name="category" value="휴가신청서">
									<input type="submit">
								</form>


							</div>
						</section>

					</div>
				</div>
				<script src="/resources/js/approval/add.js"></script>
			</body>
			<c:import url="/WEB-INF/views/layout/btmScript.jsp"></c:import>

			</html>