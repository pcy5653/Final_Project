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
      text-align: right;
      margin: 30px;
    }
    #pt_block {
      display: none;
    }
    #btn {
      text-align: center;
      margin: 3rem 0 0;
    }
    .container-xxl {
      margin: 0rem 2.5rem 0 !important;
      max-width: calc(100% - 5.2rem) !important;
      padding: 0 !important;
    }
    .card-body{
      margin: 2.2rem 8rem;
    }
    .form-label, .col-form-label {
      font-size: 1rem !important;
    }
    #before_btn {
      margin-right: 1rem;
    }
    .form-check-label {
      padding-right: 1.7rem;
      font-size: 1rem;
    }
    #frm > .row {
      padding: 0 2rem;
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
                <div class="col-xxl">
                  <div class="card">
                  <h3 class="card-header">이용권 등록</h3>
                  <div class="card-body">
                    <form id="frm" method="post" action="/membership/form">
                      <div class="row mb-4">
                        <label for="name" class="col-sm-2 col-form-label">이용권이름</label>
                        <div class="col-sm-10">
                          <input type="text" id="name" name="name" class="form-control" placeholder="이용권 이름을 입력하세요">
                        </div>
                      </div>
                      <div class="row mb-4">
                          <label class="col-sm-2 col-form-label">종류</label>
                          <div class="col-sm-10">
                            <div class="form-check form-check-inline">
                              <input class="form-check-input" type="radio" name="type" id="health" value="h" checked>
                              <label class="form-check-label" for="health">헬스</label>
                            </div>
                            <div class="form-check form-check-inline">
                              <input class="form-check-input" type="radio" name="type" id="pt" value="p">
                              <label class="form-check-label" for="pt">PT</label>
                            </div>
                          </div>
                      </div>
                      <div class="row mb-4" id="month_block">
                        <label for="month" class="col-sm-2 col-form-label">이용개월</label>
                        <div class="col-sm-10">
                          <input type="text" id="month" name="month" class="form-control" placeholder="이용개월을 입력하세요">
                        </div>
                      </div>
                      <div class="row mb-4" id="pt_block">
                        <label for="ptCount" class="col-sm-2 col-form-label">피티횟수</label>
                        <div class="col-sm-10">
                          <input type="text" id="ptCount" name="ptCount" class="form-control" placeholder="피티횟수를 입력하세요">
                        </div>
                      </div>
                      <div class="row mb-4">
                        <label for="price" class="col-sm-2 col-form-label">가격</label>
                        <div class="col-sm-10">
                          <input type="text" id="price" name="price" class="form-control" placeholder="가격을 입력하세요">
                        </div>
                      </div>
                      <div id="btn">
                        <button type="button" id="before_btn" class="btn btn-primary">이전</button>
                        <button type="button" id="submit_btn" class="btn btn-primary">등록</button>
                      </div>
                    </form>
                  </div>
                  </div>
                </div>
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

    //이전버튼
    $('#before_btn').on('click', function(){
      $(location).attr('href', '/membership/list');
    })
    
    //등록버튼
    $('#submit_btn').on('click', function(){
      let nameCheck = emptyCheck($('#name'));
      let type = $('input[name="type"]:checked').val();
      let priceCheck = emptyCheck($('#price'));
      let monthCheck;
      let ptCountCheck;

      if(type=='h'){
        monthCheck = emptyCheck($('#month'));
        if(nameCheck==true||monthCheck==true||priceCheck==true){
          alert('모든 항목을 다 입력하세요');
        }else {
          $('#frm').submit();
        }
      }else {
        ptCountCheck = emptyCheck($('#ptCount'));
        if(nameCheck==true||ptCountCheck==true||priceCheck==true){
          alert('모든 항목을 다 입력하세요');
        }else {
          $('#frm').submit();
        }
      }
      
    })


    //PT(라디오버튼) 클릭 시 
    $('#pt').on('click', function(){
      $('#month_block').css('display', 'none');
      $('#pt_block').css('display', 'flex');
    })

    //헬스(라디오버튼) 클릭 시 
    $('#health').on('click', function(){
      $('#pt_block').css('display', 'none');
      $('#month_block').css('display', 'flex');
    })

    //항목이 비어있는지 체크하는 함수
    function emptyCheck(element){
      if($(element).val()==null || $(element).val().length==0){
        return true;
      }else {
        return false;
      }
    }

  </script>

</body>
</html>