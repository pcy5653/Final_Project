<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<!-- beautify ignore:start -->
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="../assets/"
	data-template="vertical-menu-template-free">
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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
						<div class="container-xxl flex-grow-1 container-p-y">


							<div>
								
								<table
									style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;">
									<!-- Header -->
									<colgroup>
										<col width="310">
										<col width="490">
									</colgroup>
									<tbody>
										<tr>
											<td
												style="background: white; padding: 0px !important; border: 0px currentColor; height: 90px; text-align: center; color: black; font-size: 36px; font-weight: bold; vertical-align: top;"
												colspan="2"
												class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">

												${approvalVO.category}</td>
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
																${approvalVO.name}</td>
														</tr>
														<tr>
															<td
																style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

																기안일</td>
															<td
																style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
																${approvalVO.regDate }</td>
														</tr>
														<tr>
															<td
																style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

																문서번호</td>
															<td
																style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
																${approvalVO.approvalNum }</td>
														</tr>

													</tbody>
												</table>
											</td>
											<td
												style="background: white; padding-left: 85px !important; border: currentColor; text-align: right; color: black; font-size: 12px; font-weight: normal; vertical-align: top;">
												<table
													style="border: 1px solid rgb(0, 0, 0); font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;">
													<!-- User -->
													<colgroup>
														<col width="50">
														<col width="80">
														<col width="50">
														<col width="50">
														<col width="80">
														<col width="50">
													</colgroup>
													<tbody>
														<tr>
															<td
																style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

																직급</td>
															<td
																style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
																<c:if test="${middle.position=='ROLE_CEO'}">대표</c:if>
																<c:if test="${middle.position=='ROLE_GENERAL'}">총괄매니저</c:if>
																<c:if test="${middle.position=='ROLE_CUSTOMER'}">고객관리</c:if>
																<c:if test="${middle.position=='ROLE_RESOURCES'}">인사관리</c:if>
																<c:if test="${middle.position=='ROLE_FACILITY'}">시설관리</c:if>
																<c:if test="${middle.position=='ROLE_TRAINER'}">트레이너</c:if>
															</td>
															<td rowspan="3"
																style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
																<c:if test="${approvalVO.middleDate!=null}">
																	<img style="width: 5rem;height: 3rem" alt="" <c:if test="${approvalVO.state=='진행중' || approvalVO.state=='최종반려' || approvalVO.state=='완료'}">src="../file/employee/${middle.signFile}"</c:if><c:if test="${approvalVO.state=='중간반려'}">src="../file/employee/reject.png"</c:if>>
																</c:if>
																</td>
																<td
																style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

																직급</td>
															<td
																style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
																<c:if test="${last.position=='ROLE_CEO'}">대표</c:if>
																<c:if test="${last.position=='ROLE_GENERAL'}">총괄매니저</c:if>
																<c:if test="${last.position=='ROLE_CUSTOMER'}">고객관리</c:if>
																<c:if test="${last.position=='ROLE_RESOURCES'}">인사관리</c:if>
																<c:if test="${last.position=='ROLE_FACILITY'}">시설관리</c:if>
																<c:if test="${last.position=='ROLE_TRAINER'}">트레이너</c:if>
															</td>
																<td rowspan="3"
																style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
																<c:if test="${approvalVO.finalDate!=null}">
																	<img style="width: 5rem;height: 3rem" alt="" <c:if test="${approvalVO.state=='완료'}">src="../file/employee/${last.signFile}"</c:if><c:if test="${approvalVO.state=='최종반려'}">src="../file/employee/reject.png"</c:if>">
																</c:if>
																</td>
														</tr>
														<tr>
															<td
																style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

																결재자</td>
															<td 
																style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
																${middle.name}
												
															</td>
															<td
															style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

															결재자</td>
														<td 
															style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">

															${last.name}</td>
																
														</tr>
														<tr>
															<td
																style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

																결재일</td>
															<td 
																style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
																${approvalVO.middleDate}
															</td>
															<td
																style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

																결재일</td>
															<td 
																style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
																${approvalVO.finalDate}
															</td>
															
														</tr>

													</tbody>
												</table>
											</td>
											
										</tr>
									</tbody>
								</table>
								<c:if test="${approvalVO.category=='휴가신청서'}">
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
											<td
												style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
												colspan="3">${approvalVO.leaveKind }</td>
										</tr>
										<tr id="regDateRow">
											<td
												style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

												휴가일자</td>
											<td
												style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
												colspan="3">${approvalVO.startDate } ~
												${approvalVO.endDate }</td>

										</tr>
										<c:if test="${approvalVO.leaveKind=='연차'}">
											<tr>
												<td
													style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

													연차일수</td>
												<td
													style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
													colspan="3">${approvalVO.useDate } 일</td>

											</tr>
										</c:if>
										<c:if test="${approvalVO.leaveKind=='반차'}">
											<tr>
												<td
													style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

													연차일수</td>
												<td
													style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
													colspan="3">${approvalVO.useDate } 일</td>

											</tr>
											<tr>
												<td
													style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

													반차종류</td>
												<td
													style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
													colspan="3">
													<input type="radio" id="off"name="halfKind" value="오전" <c:if test="${approvalVO.halfKind=='오전'}">checked</c:if>>오전<input type="radio" id="off"name="halfKind" value="오후" <c:if test="${approvalVO.halfKind=='오후'}">checked</c:if>>오후
												</td>

											</tr>
										</c:if>

										<tr id="leaveReasonRow">
											<td
												style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

												휴가사유</td>
											<td
												style="background: rgb(255, 255, 255); border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
												colspan="3" class="dext_table_border_t"><textarea
													id="summernote" name="contents">${approvalVO.contents}</textarea></td>

										</tr>
										<c:if test="${approvalVO.state=='중간반려'||approvalVO.state=='최종반려'}">
											<tr id="rejectReasonRow">
												<td
													style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

												반려사유</td>
												<td 
													style="background: rgb(255, 255, 255); border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
													colspan="3" class="dext_table_border_t">${approvalVO.reason}</td>

											</tr>
										</c:if>
										<tr>
											<td
												style="border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 100px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle; background-color: rgb(255, 255, 255);"
												colspan="4" class="dext_table_border_t"><span
												style="font-weight: bold; font-family: &amp; amp; amp; amp; amp; quot; malgun gothic&amp;amp; amp; amp; amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">휴가기준
													제 13조에 의거 휴가를 신청하오니 허락하여 주시기 바랍니다.</span></td>
										</tr>
									</tbody>
								</table>
								</c:if>


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
</body>
</html>