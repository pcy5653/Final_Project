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
		#radioBox{
			padding-top: 0.5%;
		}
		.files{
			height: 39.15px;
		}
		.x,.x2{
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
					<h3>공지사항 수정</h3>
	
	              <div class="row">
	                <div class="mb-4">
	                    <div class="card-body">
	                      <form action="./update" id="frm" method="post" enctype="multipart/form-data">
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
			                        <c:if test="${notice.pin eq '1'}">checked</c:if>
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
			                        <c:if test="${notice.pin eq '0'}">checked</c:if>
			                        />
		                        	<label class="form-check-label" for="pin2"> 안함 </label>
	                        	</span>
	                        	</div>
	                        </div>
	                        <div class="row mb-3">
	                        <label class="col-sm-2 col-form-label" for="basic-default-name">카테고리</label>
		                        <div id="radioBox" class="col-md">
			                        <span class="radio1">
				                        <input
				                        name="category"
				                        class="form-check-input"
				                        type="radio"
				                        value="인사"
				                        id="cat1"
				                        <c:if test="${notice.category eq '인사'}">checked</c:if>
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
				                        <c:if test="${notice.category eq '휴무'}">checked</c:if>
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
				                        <c:if test="${notice.category eq '시설'}">checked</c:if>
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
				                        <c:if test="${notice.category eq '기타'}">checked</c:if>
				                        />
			                        	<label class="form-check-label" for="cat4"> 기타 </label>
		                        	</span>
		                        </div>
	                        </div>
	                        <div class="row mb-3">
	                          <label class="col-sm-2 col-form-label" for="title">제목</label>
	                          <div class="col-sm-10">
	                            <input type="text" class="form-control" id="title" name="title" value="${notice.title}" />
	                            <input type="hidden" class="form-control" id="employeeNum" name="employeeNum" value="${notice.employeeNum}" />
	                          	<input type="hidden" class="form-control" id="noticeNum" name="noticeNum" value="${notice.noticeNum}" />
	                          </div>
	                        </div>
	                        <div class="row mb-3">
	                          <label class="col-sm-2 col-form-label" for="basic-default-name">내용</label>
	                          <div class="col-sm-10">
	                            <textarea rows="" cols="" id="summernote" name="contents" class="form-control">${notice.contents}</textarea>
	                          </div>
	                        </div>
	                        <div class="row mb-3" >
	                        	<label id="label" data-list="${size}" class="col-sm-2 col-form-label" for="files">첨부파일 <button type="button" id="fileAdd" class="btn btn-primary">+</button></label>
	                        	<div class="col-sm-10" id="fileBox">
	                        		<c:forEach items="${notice.list}" var="f">
	                        			<div class="file1"><div class="files alert alert-primary alert-dismissible">${f.oriName}</div>
									 	<span class="x2" data-file="${f.fileName}" data-num="${f.fileNum}">x</span></div>
	                        		</c:forEach>
	                          	</div>
	                        </div>
	                        <div class="row justify-content-end">
	                          <div class="col-sm-10">
	                          	<a class="a1 btn btn-primary" href="./detail?noticeNum=${notice.noticeNum}">이전</a>
	                          	<button type="button" id="updateBtn" class="btn btn-primary">수정</button>
								
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
    	let size = $('#label').attr("data-list");
    	console.log(size);
    	let max = 5;
    	let count = 0+size;
    		
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
	    
	     $('#fileBox').on("click",'.x2',function(){
	    	if(confirm("삭제시 복원이 불가능 합니다.")){
		    	let num = $(this).attr("data-num");
		    	let name = $(this).attr("data-file");
		    	
	    		fileDelete(num, name);
	    		
	    		$(this).parent().remove();
		    	count --;
		    	
	    	}
	    })
	    
	    function fileDelete(fileNum, fileName){
	    	$.ajax({
				type:"post",
				url:"./filedelete",
				data:{
					"fileNum":fileNum,
					"fileName":fileName
				},
				success:function(response){
					r=response.trim();
					console.log(r);
					if(r>0){
						alert("삭제 성공");
					}else{
						alert("삭제 실패");
					}
					
				},
				error:function(){
					console.log("ajax 실패");
				}
			})
	    }
	    
	    // 제목과 내용 검증
		document.getElementById('updateBtn').addEventListener('click', function (event) {
			console.log("클릭");
		 	let notTitle = document.querySelector('input[name="title"]');        
		 	let notContents = document.querySelector('textarea[name="contents"]');        
			
			if (notTitle.value.trim() === '') {
				event.preventDefault();            
			 	alert('제목은 필수입니다.');
			 	notTitle.focus();
			 	
			 }else{
				 if (notContents.value.trim() === '') {
						event.preventDefault();            
						alert('내용은 필수입니다.');
						
			 	 }else{
			 			document.getElementById('frm').submit();
			 	 }
			 }
		 });
    </script>
    <c:import url="/WEB-INF/views/layout/js.jsp"></c:import>
  </body>
</html>