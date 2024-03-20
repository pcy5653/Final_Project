<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>Insert title here</title>
  <style>
    h3 {
      margin-top: 40px !important;
      text-align: center;
    }
    #membership {
      text-align: end;
      margin: 2.2rem 7rem 1.8rem;
    }
    #pager {
      margin-bottom: 50px;
    }
    .container-xxl {
      margin: 0rem 2.5rem 0 !important;
      max-width: calc(100% - 5.2rem) !important;
      padding: 0 !important;
    }
    .card {
      margin: 1.2rem 7rem 1.8rem;
    }
    .table th {
      font-size: 0.9rem !important;
    }
    .table thead {
      background: #e7e7ff;
    }
    .table {
      text-align: center;
    }
  </style>

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
          <div class="layout-page" style="padding-left: 0 !important;">
            <!-- Navbar -->
            <c:import url="/WEB-INF/views/layout/header.jsp"></c:import>

            <!-- Content wrapper -->
            <div class="content-wrapper">
              <!-- Content 내용 여기로 -->
              <div class="container-xxl flex-grow-1 container-p-y">
                <h3>이용권 목록</h3>

                <div id="membership">
                  <button id="add_btn" class="btn btn-primary">이용권 등록</button>
                </div>
				        <div class="card">
                  <div id="list">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th>번호</th>
                          <th>이용권이름</th>
                          <th>종류</th>
                          <th>피티횟수/이용개월</th>
                          <th>가격</th>
                          <th></th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach items="${list}" var="vo" varStatus="i">
                          <tr>
                            <td>${i.index+1}</td>
                            <td>${vo.name}</td>
                            <td>
                              <c:choose>
                            		<c:when test="${vo.type.toString() eq 'h'}">
                            			헬스
                            		</c:when>
                            		<c:otherwise>
                            			PT
                            		</c:otherwise>
                            	</c:choose>
                            </td>
                            <td>
                            	<c:choose>
                            		<c:when test="${vo.type.toString() eq 'h'}">
                            			${vo.month}개월
                            		</c:when>
                            		<c:otherwise>
                            			${vo.ptCount}회
                            		</c:otherwise>
                            	</c:choose>
                            </td>
                            <td>${vo.price}원</td>
                            <td>
                              <button class="btn btn-sm btn-primary del_btn" data-num="${vo.membershipNum}">삭제</button>
                            </td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
              
              <div id="pager">
                <c:if test="${not empty list}">
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
              </div>  
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
    //이용권등록버튼 클릭 시 
    $('#add_btn').on('click', function(){
      $(location).attr('href', '/membership/form');
    })

    //삭제버튼 클릭 시
    $('.del_btn').on('click', function(){
      const result = confirm('정말 삭제하시겠습니까?');
      if(result==true){
        // console.log($(this).data('num'))
        setDel($(this).data('num'));
      }
      
    })
    
    //이용권 삭제 
    function setDel(membershipNum){
      $.ajax({
        type: 'get',
        url: '/membership/delete',
        data: {
          membershipNum: membershipNum
        },
        success: function(result){
          if(result.trim()>0){
            alert('이용권이 삭제되었습니다');
            location.reload();
          }else {
            alert('등록된 사용자가 있어 삭제가 불가합니다');
          }
        }
      })  
    }

    //페이지번호 클릭 시 
    $('.pagination').on('click', '.move', function(){
      const num = $(this).attr('data-num');
      $(location).attr('href', '?page='+num)
    })
  </script>

</body>
</html>