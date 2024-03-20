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
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<style>
    	h3 {
	    	margin-top: 40px !important;
	    	text-align: center;
	    }
	   	.radio1{
	   		margin-right: 1rem;
	   	}
	   	.form-label, .col-form-label {
		    font-size: 0.9rem;
		    text-transform: uppercase;
		    letter-spacing: inherit;
		}
		.a1{
			color: white;
		}
		.justify-content-end {
			padding-left: 31%;
			margin-top: 50px;
		}
		.radioBox{
    		padding-top: 0.5%;
		}
		.files{
			height: 39.15px;
		}
		.x{
			padding-top: 6px;
			cursor: pointer;
		}
		.note-editor .note-editing-area {
		    position: relative;
		    height: 300px;
		}
		.file1{
			display: flex;
			padding-top: 6px;
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
				  <h3>공지사항 등록</h3>
	
	              <div class="row">
	                <div class="mb-4">
	                    <div class="card-body">
	                      <form action="./add" id="frm" method="post" enctype="multipart/form-data">
	                        <div class="row mb-3">
	                          <label class="col-sm-2 col-form-label" for="check">상단고정</label>
	                          <div class="radioBox col-md">
	                          <span class="radio1">
			                        <input
			                        name="pin"
			                        class="form-check-input"
			                        type="radio"
			                        value="1"
			                        id="pin1"
			                        
			                        />
		                        	<label class="form-check-label" for="pin1"> 고정 </label>
		                        </span>
		                        <span class="radio1">
			                        <input
			                        name="pin"
			                        class="form-check-input"
			                        type="radio"
			                        value="0"
			                        id="pin2"
			                        checked
			                        />
		                        	<label class="form-check-label" for="pin2"> 안함 </label>
	                        	</span>
	                        	</div>
	                        </div>
	                        <div class="row mb-3">
	                        <label class="col-sm-2 col-form-label" for="basic-default-name">카테고리</label>
		                        <div class="radioBox col-md">
			                        <span class="radio1">
				                        <input
				                        name="category"
				                        class="form-check-input"
				                        type="radio"
				                        value="인사"
				                        id="cat1"
				                        checked
				                        />
			                        	<label class="form-check-label" for="cat1"> 인사 </label>
			                        </span>
			                        <span class="radio1">
				                        <input
				                        name="category"
				                        class="form-check-input"
				                        type="radio"
				                        value="휴무"
				                        id="cat2"
				                        />
			                        	<label class="form-check-label" for="cat2"> 휴무 </label>
		                        	</span>
		                        	<span class="radio1">
				                        <input
				                        name="category"
				                        class="form-check-input"
				                        type="radio"
				                        value="시설"
				                        id="cat3"
				                        />
			                        	<label class="form-check-label" for="cat3"> 시설 </label>
		                        	</span>
		                        	<span class="radio1">
				                        <input
				                        name="category"
				                        class="form-check-input"
				                        type="radio"
				                        value="기타"
				                        id="cat4"
				                        />
			                        	<label class="form-check-label" for="cat4"> 기타 </label>
		                        	</span>
		                        </div>
	                        </div>
	                        <div class="row mb-3">
	                          <label class="col-sm-2 col-form-label" for="title">제목</label>
	                          <div class="col-sm-10">
	                            <input type="text" class="form-control" id="title" name="title" required="true" autofocus="" placeholder="제목을 입력해주세요" />
	                          </div>
	                        </div>
	                        <div class="row mb-3">
	                          <label class="col-sm-2 col-form-label" for="basic-default-name">내용</label>
	                          <div class="col-sm-10">
	                            <textarea rows="" cols="" id="summernote" name="contents" class="form-control"></textarea>
	                          </div>
	                        </div>
	                        <div class="row mb-3" >
	                        	<label id="label" class="col-sm-2 col-form-label" for="files">첨부파일 <button type="button" id="fileAdd" class="btn btn-primary">+</button></label>
	                        	<div class="col-sm-10" id="fileBox">
	                        	
	                          	</div>
	                        </div>
	                        <div class="row justify-content-end">
	                          <div class="col-sm-10">
	                          	<a class="a1 btn btn-primary" href="./list">이전</a>
	                            <button id="addBtn" type="button" class="btn btn-primary">등록</button>
	                          </div>
	                        </div>
	                      </form>
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
  
	<script>
      $('#summernote').summernote({
        placeholder: '공지사항 내용을 입력해주세요.',
        tabsize: 2,
        height: 300,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
    </script>
    <script>
    	let max = 5;
    	let count = 0;	
    	
    		
	    $('#fileAdd').click(function(){
    	if(count < max){
	    	
		    let fileTag = '<div class="file1"><input type="file" class="files form-control" '
		    			  +'id="files" name="fileAdd"/><span class="x">x</span></div>';
	    	$('#fileBox').append(fileTag);
	        
	    	count ++;
    	}else{
    		alert("첨부파일은 최대 5개까지만 업로드 가능합니다.");
    	}
	     });
	     
	    $('#fileBox').on("click",'.x',function(){
	    	
	    	$(this).parent().remove();
	    	count --;
	    })
	    
	    // 제목과 내용 검증
		document.getElementById('addBtn').addEventListener('click', function (event) {
			console.log("클릭");
		    let checkResults=[false,false];
		 	let notTitle = document.querySelector('input[name="title"]');        
		 	let notContents = document.querySelector('textarea[name="contents"]');        
			
			if (notTitle.value.trim() === '') {            
				event.preventDefault();            
			 	alert('제목은 필수입니다.');
			 	notTitle.focus();
			 	checkResults[0]=false;
			 }else{
				 checkResults[0]=true;
				 if (notContents.value.trim() === '') {            
						event.preventDefault();            
						alert('내용은 필수입니다.');
						checkResults[1]=false;
					 	}else{
					 		checkResults[1]=true;
					 		let c = checkResults.includes(false);
					 		if(!c){
					 			console.log(document.getElementById('frm'));
					 			document.getElementById('frm').submit();
					 		}
					 	}
			 }		 
		 });
    </script>
    <c:import url="/WEB-INF/views/layout/js.jsp"></c:import>
  </body>
</html>