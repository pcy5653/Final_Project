<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
                <div class="content-wrapper">
      <div class="container-xxl flex-grow-1 container-p-y" style="padding:0px;">
        <div class="row">

          <!-- <h5 class="py-3 my-4">근태관리 페이지</h5> -->
          <div class="col-xl-12">
            <!-- <h6 class="text-muted">Filled Pills</h6> -->
            <div class="nav-align-top mb-4">
              
              <div class="tab-content" style="width:100%; height:100%">
                <div class="tab-pane fade show active" id="navs-pills-justified-home" role="tabpanel">
                <form id="postForm" action="" method="post">
                  <div style="height : 20px"></div>
                  <table class="pull-right">
                    <tr>
                        <td>
                          <h3>🔐 락커 관리<span>(${pi.listCount })</span></h3>
                        </td>
                    </tr>        
                  </table>

                  <br>
                  <table style="width:100%;">
                    <tr style="width:100%">
                      <td style="width:20%; text-align:left;">
                      	<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#moveLocker">자리이동</button>
                      </td>
                      <td style="width:80%; text-align:right;">
                        
                        <button type="button" class="btn btn-primary me-2" data-bs-toggle="modal" data-bs-target="#createLocker">락커생성</button>
                        <button type="button" class="btn btn-secondary me-2" onclick="postFormSubmit('delete.lk');">락커삭제</button>
                        <button type="button" class="btn btn-info me-2" onclick="postFormSubmit('repair.lk')">수리완료</button>
                     
                      </td>
                    </tr>
                   
                  </table>
                  <br>
                  
                  <script>
	            	function postFormSubmit(url){
	            		$("#postForm").attr("action", url).submit();
	            	}
	              </script>
                  
                  <div id="machine-area">
                    <table style="width:100%; align:center;">
                    <c:choose>
                    <c:when test="${ empty list }">
                    	<tr>
                    		<td colspan="6">현재 등록 락커가 없습니다.</td>
                    	</tr>
                    </c:when>
                    
                    <c:otherwise>
                    
                    <c:set var="now" value="<%=new java.util.Date()%>" />
                    <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

                      <tr>
                      
                      	<c:forEach var="i" begin="0" end="7" step="1">
	                        <td class="locker-td">
	                        <input type="hidden" class="lk-no" name="lkNo" value="${ list[i].lkNo }">
	                        <input type="hidden" class="lk-userName" name="userName" value="${ list[i].userName }">
	                        <input type="hidden" class="lk-sDate" name="startDate" value="${ list[i].startDate }">
	                        <input type="hidden" class="lk-eDate" name="endDate" value="${ list[i].endDate }">
	                        <input type="hidden" class="lk-userNo" value="${ list[i].userNo }">
	                        <c:if test="${not empty list[i] }">
	                          <div class="locker">
	                            <c:if test="${ empty list[i].startDate }">
	                            	<input type="checkbox" class="lk-ck form-check-input" name="ckLocker" value="${ list[i].lkNo }">
	                       		</c:if>
	                       		<c:if test="${ not empty list[i].startDate}">
	                            	<input type="checkbox" class="lk-ck form-check-input" disabled>
	                       		</c:if>     
	                            <fmt:parseDate value="${list[i].startDate}" var="startDate" pattern="yyyy-MM-dd"/>
	                            <c:choose>
		                            <c:when test="${ empty list[i].startDate }">
		                            <label class="lk-label" style="background-color:#8592A3">미사용</label>
		                            </c:when>
		                            
		                            <c:when test="${ list[i].endDate < today }">
		                            <label class="lk-label" style="background-color:#ff3e1d">기간만료</label>
		                            </c:when>
		                            
		                            <c:when test="${ list[i].startDate <= today }">
		                            <label class="lk-label">사용중</label>
		                            </c:when>
		                            
		                            <c:otherwise>
		                            <label class="lk-label" style="background-color:#03C3EC">예약중</label>
		                            </c:otherwise>
	                            </c:choose>
	                            
	                            <c:choose>
		                            <c:when test="${ not empty list[i].startDate and list[i].lkBlock == '1' }">
			                            <button type="button" class="bt-text" data-bs-toggle="modal" data-bs-target="#updateModal">
			                              ${ list[i].userName } <br>
			                              ~${ list[i].endDate } <br>
			                              
			                             <c:choose>
			                             <c:when test="${ list[i].endDate >= today && list[i].startDate <= today}">
			                              	(${ list[i].toEndDate }일 후 만료)
			                              </c:when>
			                              
			                              <c:when test="${ list[i].endDate >= today && list[i].startDate > today}">
			                              	(${ list[i].toStartDate }일 후 시작)
			                              </c:when>
			                              
			                              <c:otherwise>
			                               
			                              </c:otherwise>
			                              </c:choose>
			                            </button>
		                            </c:when>
		                            
		                            <c:when test="${ list[i].lkBlock == '2' }">
		                            	<button type="button" class="bt-text" style="font-size:17px;color:#ffab00;">
		                            	수리중<br>
			                            </button>
		                            </c:when>
		                            <c:otherwise>
		                            	<button type="button" class="bt-text" data-bs-toggle="modal" data-bs-target="#enrollModal">
		                            	<br><br>
			                            </button>
		                            </c:otherwise>
	                            </c:choose>
	                            
	                            
	                          </div>
	                        </c:if> 
	                        </td>
                        </c:forEach>
                        
                      </tr>
                      
                      <tr>
                      
                      	<c:forEach var="i" begin="8" end="15" step="1">
	                        <td class="locker-td">
	                        <input type="hidden" class="lk-no" name="lkNo" value="${ list[i].lkNo }">
	                        <input type="hidden" class="lk-userName" name="userName" value="${ list[i].userName }">
	                        <input type="hidden" class="lk-sDate" name="startDate" value="${ list[i].startDate }">
	                        <input type="hidden" class="lk-eDate" name="endDate" value="${ list[i].endDate }">
	                        <input type="hidden" class="lk-userNo" value="${ list[i].userNo }">
	                        
	                          <c:if test="${not empty list[i]}">
	                          <div class="locker">
	                            <c:if test="${ empty list[i].startDate  }">
	                            	<input type="checkbox" class="lk-ck form-check-input" name="ckLocker" value="${ list[i].lkNo }">
	                       		</c:if>
	                       		<c:if test="${ not empty list[i].startDate}">
	                            	<input type="checkbox" class="lk-ck form-check-input" disabled>
	                       		</c:if> 
	                            
	                            <c:choose>
		                            <c:when test="${ empty list[i].startDate}">
		                            <label class="lk-label" style="background-color:#8592A3">미사용</label>
		                            </c:when>
		                            
		                            <c:when test="${ list[i].endDate < today }">
		                            <label class="lk-label" style="background-color:#ff3e1d">기간만료</label>
		                            </c:when>
		                            
		                            <c:when test="${ list[i].startDate <= today }">
		                            <label class="lk-label">사용중</label>
		                            </c:when>
		                            
		                            <c:otherwise>
		                            <label class="lk-label" style="background-color:#03C3EC">예약중</label>
		                            </c:otherwise>
	                            </c:choose>
	                            
	                            <c:choose>
		                            <c:when test="${ not empty list[i].startDate and list[i].lkBlock == '1' }">
			                            <button type="button" class="bt-text" data-bs-toggle="modal" data-bs-target="#updateModal">
			                              ${ list[i].userName } <br>
			                              ~${ list[i].endDate } <br>
			                              
			                              <c:choose>
			                              
			                              <c:when test="${ list[i].endDate >= today && list[i].startDate <= today}">
			                              	(${ list[i].toEndDate }일 후 만료)
			                              </c:when>
			                              
			                              <c:when test="${ list[i].endDate >= today && list[i].startDate > today}">
			                              	(${ list[i].toStartDate }일 후 시작)
			                              </c:when>
			                              
			                              <c:otherwise>
			                               
			                              </c:otherwise>
			                              </c:choose>
			                              
			                              
			                            </button>
		                            </c:when>
		                            
		                            
		                            <c:when test="${ list[i].lkBlock == '2' }">
		                            	<button type="button" class="bt-text" style="font-size:17px;color:#ffab00;">
		                            	수리중<br>
			                            </button>
		                            </c:when>
		                            
		                            <c:otherwise>
		                            	<button type="button" class="bt-text" data-bs-toggle="modal" data-bs-target="#enrollModal">
		                            	<br><br>
			                            </button>
		                            </c:otherwise>
	                            </c:choose>
	                            
	                            
	                          </div>
	                        </c:if>  
	                        </td>
                        </c:forEach>
                        
                      </tr>
                      
                      <tr>
                      
                      	<c:forEach var="i" begin="16" end="23" step="1">
                      		
	                        <td class="locker-td">
	                        <input type="hidden" class="lk-no" name="lkNo" value="${ list[i].lkNo }">
	                        <input type="hidden" class="lk-userName" name="userName" value="${ list[i].userName }">
	                        <input type="hidden" class="lk-sDate" name="startDate" value="${ list[i].startDate }">
	                        <input type="hidden" class="lk-eDate" name="endDate" value="${ list[i].endDate }">
	                        <input type="hidden" class="lk-userNo" value="${ list[i].userNo }">
	                        
	                          <c:if test="${not empty list[i] }">
	                          <div class="locker">
	                            <c:if test="${ empty list[i].startDate}">
	                            	<input type="checkbox" class="lk-ck form-check-input" name="ckLocker" value="${ list[i].lkNo }">
	                       		</c:if>
	                       		<c:if test="${ not empty list[i].startDate}">
	                            	<input type="checkbox" class="lk-ck form-check-input" disabled>
	                       		</c:if> 
	                            <c:choose>
		                            <c:when test="${ empty list[i].startDate or list[i].endDate < today }">
		                            <label class="lk-label" style="background-color:#8592A3">미사용</label>
		                            </c:when>
		                            
		                            <c:when test="${ list[i].endDate < today }">
		                            <label class="lk-label" style="background-color:#ff3e1d">기간만료</label>
		                            </c:when>
		                            
		                            <c:when test="${ list[i].startDate <= today }">
		                            <label class="lk-label">사용중</label>
		                            </c:when>
		                            
		                            <c:otherwise>
		                            <label class="lk-label" style="background-color:#03C3EC">예약중</label>
		                            </c:otherwise>
	                            </c:choose>
	                            
	                            <c:choose>
		                            <c:when test="${ not empty list[i].startDate and list[i].lkBlock == '1' }">
			                            <button type="button" class="bt-text" data-bs-toggle="modal" data-bs-target="#updateModal">
			                              ${ list[i].userName } <br>
			                              ~${ list[i].endDate } <br>
			                              
			                              <c:choose>
			                              
			                              <c:when test="${ list[i].endDate >= today && list[i].startDate <= today}">
			                              	(${ list[i].toEndDate }일 후 만료)
			                              </c:when>
			                              
			                              <c:when test="${ list[i].endDate >= today && list[i].startDate > today}">
			                              	(${ list[i].toStartDate }일 후 시작)
			                              </c:when>
			                              
			                              <c:otherwise>
			                               
			                              </c:otherwise>
			                              </c:choose>
			                              
			                            </button>
		                            </c:when>
		                            
		                            <c:when test="${ list[i].lkBlock == '2' }">
		                            	<button type="button" class="bt-text" style="font-size:17px;color:#ffab00;">
		                            	수리중<br>
			                            </button>
		                            </c:when>
		                            
		                            <c:otherwise>
		                            	<button type="button" class="bt-text" data-bs-toggle="modal" data-bs-target="#enrollModal">
		                            	<br><br>
			                            </button>
		                            </c:otherwise>
	                            </c:choose>
	                            
	                            
	                          </div>
	                        </c:if> 
	                        </td>
                        </c:forEach>
                        
                      </tr>
                      
                    </c:otherwise>
                    </c:choose>
                    </table>


                   
                  </div>

                  <br><br>
                </form>
                </div>
                
                <script>
				$(function(){
					$(".bt-text").click(function(){
						$("#sp-lkNo").text($(this).parents('div').siblings('input').val());
						$("#sm-lkNo").val($(this).parents('div').siblings('input').val());
						
						
						$("#sp-lkNo2").text($(this).parents('div').siblings('input').eq(0).val());
						$("#sm-lkNo2").val($(this).parents('div').siblings('input').eq(0).val());
						$("#sm-userName2").text($(this).parents('div').siblings('input').eq(1).val());
						$("#sm-sDate2").val($(this).parents('div').siblings('input').eq(2).val());
						$("#sm-eDate2").val($(this).parents('div').siblings('input').eq(3).val());
						$("#sm-userNo").val($(this).parents('div').siblings('input').eq(4).val());
					})	
				})
					
				</script>
                <!-- Modal -->
                <div class="modal fade" id="enrollModal" tabindex="-1" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                    <form id="postForm2" action="" method="post" >
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel1">락커 No.<span id="sp-lkNo"></span></h5>
                        <input type="hidden" id="sm-lkNo" name="lkNo" value="">
                        <button
                          type="button"
                          class="btn-close"
                          data-bs-dismiss="modal"
                          aria-label="Close"
                        ></button>
                      </div>
                      <div class="modal-body">
                        <div class="row">
                          <div class="col mb-3">
                            <div class="mb-3">
                              <label for="defaultSelect" class="form-label">회원 목록</label>
                              <select id="defaultSelect" class="form-select" name="strUserNo">
                              	<option selected disabled>회원을 선택하세요.</option>
                                <c:forEach var="u" items="${ userList }">
                                <option>${ u.userName }_${ u.userNo }
                                </option>
                                </c:forEach>
                              </select>
                            </div>
                          </div>
                        </div>
                        <div class="row g-2">
                          <div class="col mb-0">
                            <label for="emailBasic" class="form-label">시작일</label>
                            <input class="form-control" type="date" name="startDate" value="${ today }" id="html5-date-input" />
                          </div>
                          <div class="col mb-0">
                            <label for="dobBasic" class="form-label">종료일</label>
                            <input class="form-control" type="date" name="endDate" value="${ today }" id="html5-date-input" />
                          </div>
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-primary" onclick="postFormSubmit2('assign.lk');">락커등록</button>
                        <button type="button" class="btn btn-warning" onclick="postFormSubmit2('broken.lk');">고장등록</button>
                      </div>
                    </form>
                    
                    <script>
                    	function postFormSubmit2(url){
                    		$("#postForm2").attr("action", url).submit();
                    	}
                    </script>
                    </div>
                  </div>
                </div>
                
                <div class="modal fade" id="updateModal" tabindex="-1" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                    <form action="recover.lk">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel1">락커 No. <span id="sp-lkNo2"></span></h5>
                        <input type="hidden" id="sm-lkNo2" name="lkNo2" value="">
                        <button
                          type="button"
                          class="btn-close"
                          data-bs-dismiss="modal"
                          aria-label="Close"
                        ></button>
                      </div>
                      <div class="modal-body">
                        <div class="row">
                          <div class="col mb-3">
                            <div class="mb-3">
                              <label for="defaultSelect" class="form-label">회원 목록</label>
                              <select id="defaultSelect" class="form-select" disabled>
                                <option id="sm-userName2"></option>
                              </select>
                            </div>
                          </div>
                        </div>
                        <div class="row g-2">
                          <div class="col mb-0">
                            <label for="emailBasic" class="form-label">시작일</label>
                            <input class="form-control" id="sm-sDate2" type="date" value="" disabled />
                          </div>
                          <div class="col mb-0">
                            <label for="dobBasic" class="form-label">종료일</label>
                            <input class="form-control" id="sm-eDate2" type="date" value="" disabled />
                          </div>
                        </div>
                      </div>
                      <div class="modal-footer">
                        <input type="hidden" id="sm-userNo" name="userNo" value="" >
                        <button type="submit" class="btn btn-secondary">락커회수</button>
                      </div>
                    </form>
                    </div>
                  </div>
                </div>


                <!-- Modal : createLocker -->
                <div class="modal fade" id="createLocker" tabindex="-1" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                    <form action="add.lk">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel1">락커 생성</h5>
                        <button
                          type="button"
                          class="btn-close"
                          data-bs-dismiss="modal"
                          aria-label="Close"
                        ></button>
                      </div>
                      <div class="modal-body">
                        <div class="row">
                          <div class="col mb-3">
                            <div class="mb-3">
                              <label for="defaultSelect" class="form-label">락커갯수</label>
                              <input class="form-control" type="number" name="lkAmount" value="1" id="html5-number-input">
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="modal-footer">
                        <!-- <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                          Close
                        </button> -->
                        <button type="submit" class="btn btn-primary" >추가하기</button>
                      </div>
                    </form>
                    </div>
                  </div>
                </div>


                 <!-- Modal : moveLocker -->
                 <div class="modal fade" id="moveLocker" tabindex="-1" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                    <form action="move.lk">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel1">자리 이동</h5>
                        <button
                          type="button"
                          class="btn-close"
                          data-bs-dismiss="modal"
                          aria-label="Close"
                        ></button>
                      </div>
                      <div class="modal-body">
                        <div class="row">
                          <div class="col mb-3">
                            <div class="mb-3">
                              <label for="defaultSelect" class="form-label">회원 목록</label>
                              <select id="defaultSelect" class="form-select" name="strUserNo">
                              <option selected disabled>회원 이름을 선택하세요.</option>
                                <c:forEach var="u" items="${ userList2 }">
                                <option>${ u.userName }_${ u.userNo }</option>
                                </c:forEach>
                              </select>
                            </div>
                            <div class="mb-3">
                              <label for="defaultSelect" class="form-label">현재 자리 번호</label>
                              <select id="defaultSelect" class="form-select" name="lkNo">
                              <option selected disabled>현재 자리번호를 선택하세요.</option>
                                <c:forEach var="l" items="${ nList1 }">
                                <option>${ l.lkNo }</option>
                                </c:forEach>
                              </select>
                            </div>
                            <div class="mb-3">
                              <label for="defaultSelect" class="form-label">이동할 자리 번호</label>
                              <select id="defaultSelect" class="form-select" name="mvLkNo">
                              <option selected disabled>이동할 자리번호를 선택하세요.</option>
                                <c:forEach var="l" items="${ nList2 }">
                                <option>${ l.lkNo }</option>
                                </c:forEach>
                              </select>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="modal-footer">
                        <!-- <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                          Close
                        </button> -->
                        <button type="submit" class="btn btn-primary">자리이동</button>
                      </div>
                    </form>
                    </div>
                  </div>
                </div>

                <div>      
                  <div>
                    <div>
                    <!-- Basic Pagination -->
                    
                    
                    
                    <!--/ Basic Pagination -->  
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
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