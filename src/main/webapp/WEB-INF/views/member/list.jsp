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
  <style>
    .form-label, .col-form-label {
      font-size: 0.8rem !important;
      text-align: left !important;
    }
    .modal-body {
      margin: 0 0 0 1rem;
    }
    .col-sm-2 {
      width: 21% !important;
    }
    .col-sm-10 {
      width: 75% !important;
    }
    .form-control[readonly] {
      background-color:rgba(105, 108, 255, 0.16) !important;
    }
    .modal-footer {
      justify-content: center !important;
    }
    .table > :not(:first-child) {box-shadow: 0 2px 3px rgba(0,0,0,0.01), 0 2px 3px rgba(0,0,0,0.12);}
    .table th {
      font-size: 0.9rem !important;
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
          <div class="layout-page">
            <!-- Navbar -->
            <c:import url="/WEB-INF/views/layout/header.jsp"></c:import>

            <!-- Content wrapper -->
            <div class="content-wrapper">
              <!-- Content 내용 여기로 -->
              <div class="container-xxl flex-grow-1 container-p-y" style="padding: 1rem 0 !important; width: 80%;">
                <h3 style="text-align: center; margin:2rem 0 1rem;">전체 회원 목록</h3>   
                <div class="container-xxl flex-grow-1 container-p-y" style="padding-top: 0 !important; text-align: center;">
                  <div>
                    <div class="m-5" style="margin: 2.5rem auto 2rem !important;">
                      <form action="./list" method="get" id="frm" style="display: flex; justify-content: center;">
                        <input type="hidden" value="${pager.page}" id="page" name="page">
                        <!-- 파라미터 이름 kind -->
                        <select name="kind" id="k" class="search form-select" aria-label="Default select example" style="width: 10%;" data-kind="${pager.kind}" >
                          <option class="kind" value="name">이름</option>
                        </select> 
                        <input type="text" name="search" value="${pager.search}" class="search form-control" style="width: 30%;" aria-label="Search" placeholder="검색어를 입력하세요.">
                        <button type="submit" class="btn btn-primary">조회</button>
                      </form>
                    </div>
                  </div>
                  <!-- 이용권등록 Modal -->
                  <div class="modal fade" id="smallModal" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title">이용권 등록</h5>
                          <button type="button" class="btn-close close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                          <div class="row mb-3">
                            <label for="memberNum" class="col-sm-2 col-form-label">회원번호</label>
                            <div class="col-sm-10">
                              <input type="text" id="memberNum" name="memberNum" class="form-control" readonly>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <label for="name" class="col-sm-2 col-form-label">회원이름</label>
                            <div class="col-sm-10">
                              <input type="text" id="name" name="memberName" class="form-control" readonly>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <label for="num" class="col-sm-2 col-form-label">이용권</label>
                            <div class="col-sm-10">
                              <select id="membership" name="membershipNum" class="form-select">
                                <c:forEach items="${membership}" var="li">
                                  <option value="${li.membershipNum}" data-count="${li.ptCount}" data-month="${li.month}">
                                    ${li.name}
                                  </option>                              
                                </c:forEach>
                              </select>
                            </div>
                          </div>
                          <div class="row mb-3" id="employee_add">
                            <label for="num" class="col-sm-2 col-form-label">담당 트레이너</label>
                            <div class="col-sm-10">
                              <select id="employee" name="employeeNum" class="form-select">
                                <c:forEach items="${employee}" var="li">
                                  <option value="${li.employeeNum}">
                                    ${li.name}
                                  </option>                              
                                </c:forEach>
                              </select>
                            </div>
                          </div>
                        </div>
                        <div class="modal-footer">
                          <button type="button" id="addRegistrationBtn" class="btn btn-primary close">
                            등록
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div style="text-align: right; margin-bottom: 3rem; margin-right: 1rem;">
                    <a href="/member/add" class="btn btn-primary">회원등록</a>
                  </div>
                  <div id="req_list" class="table-responsive text-nowrap">
                    <table class="table table-hover" style="text-align: center; background-color: white;">
                      <thead style="background: #e7e7ff;;">
                        <tr>
                          <th>번호</th>
                          <th>이름</th>
                          <th>전화번호</th>
                          <th>헬스 가입일</th>
                          <th>헬스 만료일</th>
                          <th>피티 등록일</th>
                          <th>피티횟수</th>
                          <th>담당 트레이너</th>
                          <th>등록여부</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach items="${list}" var="vo" varStatus="i">
                          <tr>
                            <td>${i.index+1}</td>
                            <td><a href="./detail?memberNum=${vo.memberNum}">${vo.memberName}</a></td>
                            <td>${vo.phone}</td>
                            <td>${vo.joinDate}</td>
                            <td>${vo.expirationDate}</td>
                            <c:forEach items="${vo.registrationVO}" var="re" begin="0" end="0">
                              <td>${re.regDate}</td>
                            </c:forEach>
                            <td class="ptCount" data-ptcount="${vo.ptCount}">${vo.ptCount}</td>
                            <td>${vo.employeeVO.name}</td>
                            <td id="ptAdd">
                              <button class="membershipAddBtn btn btn-primary btn-sm "
                              data-num="${vo.memberNum}"
                              data-name="${vo.memberName}"
                              ></button>
                            </td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
              <ul class="pagination justify-content-center">
                <li class="page-item prev ${pager.pre?'':'disabled'}">
                  <a class="page-link move" data-num="${pager.startNum-1}" href="#"><i class="tf-icon bx bx-chevrons-left"></i></a>
                </li>
                <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
                   <li class="page-item">
                     <a class="page-link move b1" value="1" data-num="${i}" href="#">${i}</a>
                   </li>
                </c:forEach>
                <li class="page-item next ${pager.next?'':'disabled'}">
                  <a class="page-link move" data-num="${pager.lastNum+1}" href="#"><i class="tf-icon bx bx-chevrons-right"></i></a>
                </li>
              </ul>
              <!-- 페이징 -->
							      

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
    <script type="text/javascript" src="/js/employee/list.js"></script>
    <script>
      $(document).ready(function(){
          const ptCount = $('.ptCount');
          const membershipAdd = $('.membershipAddBtn');
          
          ptCount.each(function(i) {
              const ptCountValue = $(this).data('ptcount');

              if(ptCountValue === ''){
                  membershipAdd.eq(i).text('등록');
              } else {
                  membershipAdd.eq(i).text('완료');
                  membershipAdd.eq(i).prop('disabled', true);
              }
          });
      });

      //등록버튼 클릭 시 
      $('.membershipAddBtn').on('click', function(){
        const num = $(this).attr('data-num'); //회원번호
        const name = $(this).attr('data-name'); //회원이름

        $('#memberNum').val(num);
        $('#name').val(name);
        $('#smallModal').modal('show'); //모달 활성화
      })

      let membershipNum = $('#membership').val();
      let count = $('#membership').find("option:selected").data("count");
      let month = $('#membership').find("option:selected").data("month");

      let employeeNum = $('#employee').val();

      //option이 바뀔 때마다 
      $('#membership').on('change', function(){
        membershipNum = $('#membership').val();
        count = $(this).find("option:selected").data("count");
        month = $(this).find("option:selected").data("month");

        if(count == ''){
          $('#employee_add').css('display', 'none');
        }else {
          $('#employee_add').css('display', 'flex');
        }
      })
      
      //option이 바뀔 때마다 
      $('#employee').on('change', function(){
        employeeNum = $('#employee').val();
      })

      //모달창의 등록버튼 클릭 시 
      $('#addRegistrationBtn').on('click', function(){
        const memberNum = $('#memberNum').val();
        // console.log('m - '+memberNum, 'ms-' +membershipNum, 'c'+count, 'm'+month)
        setAdd(memberNum, membershipNum, count, month, employeeNum);
      })

      //이용권 등록
      function setAdd(memberNum, membershipNum, count, month, employeeNum){
        $.ajax({
          type: 'post',
          url: '/registration/form',
          data: {
            memberNum: memberNum,
            membershipNum: membershipNum,
            ptCount: count,
            month: month,
            employeeNum: employeeNum
          },
          success: function(result){
            if(result.trim()>0){
              alert('이용권이 등록되었습니다');
              $('#smallModal').modal('hide'); //모달 비활성화
              location.reload();
            }else {
              alert('이용권 등록에 실패하였습니다.');
            }
          }
        })
      }
    

    </script>
  </body>
</html>