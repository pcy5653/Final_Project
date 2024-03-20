<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

<script ></script>
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
              
               <div style='width:99%;'><i class='bx bxs-battery-charging' style='font-size:26px !important'></i>&nbsp;<label style='font-size:16px; font-weight:500'> 진행률</label>
		    <div class='progress' style='background:none; font-size:15px; margin-bottom:30px; width:99%; background:rgba(67,89,113,.1); height:20px; margin-top:2px; margin-right:60px'>
		        <div class="progress-bar bg-info" role="progressbar" style="height:20px" aria-valuemin="0" aria-valuemax="100  margin-right:60px"></div>
		    </div>
		    </div>
              
              
              		<!-- <button class="btn btn-primary" data-bs-toggle="modal"  data-bs-target="#exampleModal" ">운동추가</button> -->
                	<div id="add-btn-div" style="text-align: center; ">
		        <button type="button" class="btn btn-outline-primary add-btn" style='width:160px; margin-bottom: 2rem; text-align: center;'; data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="passValueToModal()">
		            + 운동 추가
		        </button>
		    </div>
		    <div style="text-align: right;">
		    	<button type="button" id="yesClass" class="btn btn-outline-primary add-btn" style='width:160px; margin-bottom: 2rem; text-align: center;'; onclick="postFormSubmit2('attendPt');">
		            완료
		        </button>
		        <!-- <button type="button" id="noClass" class="btn btn-outline-primary add-btn" style='width:160px; margin-bottom: 2rem; text-align: center;'; onclick="postFormSubmit2('absentPt');" >
		            결석
		        </button> -->
		        </div>
		    <i class='bx bx-layer-plus' style='font-size:26px'></i>&nbsp;<label style='font-size:16px; font-weight:500'> 운동목록</label>
		    <div id="todo-list" style='width:100%; height:100%;'>
		    <input type="hidden" id="getMemNum" value="${memberNum}">
	        	<table class="table">
                	
                			<thead>
                			<tr>
                				<th style="display: none;">${ptLogNum}</th>
                				<th>운동명</th>
                				<th>무게</th>
                				<th>갯수</th>
                				<th>세트 수</th>
                				
                			</tr>
                			</thead>
                			<tbody class="table-border-bottom-0">
                				<c:forEach items="${list}" var="vo">
               					
									<tr>
										<td style="display: none;">${employeeNum}</td>
										
										<td>${vo.name}</td>
										<td>${vo.weight}</td>
										<td>${vo.exCount}</td>
										
										<td>${vo.ptSet}</td>
										<!-- <td><i class="menu-icon tf-icons bx bx-dots-vertical-rounded"></i></td> -->
										<td>
											<c:if test="${vo.finish == 0 }">
												<button class="btn btn-outline-primary finishBtn${vo.ptTypeNum}" id="finishBtn" onclick="finish('${vo.ptTypeNum}')">완료</button>
											</c:if>
										</td>
									 	<td><button class="btn btn-outline-primary" id="delBtn" onclick="deleteType('${vo.ptTypeNum}')">삭제</button></td>
									 	
									
                					</tr>
                				</c:forEach>
                			</tbody>
                			
                		</table>
		    </div>
                	
                	
                		
	                		<!-- Modal -->
							
							
							<div class="modal fade" id="exampleModal" data-bs-backdrop="static" tabindex="-1" style="display: none;" aria-hidden="true">
		        <div class="modal-dialog">
		            <div class="modal-content">
		
		                <!-- Modal Header -->
		                <div class="modal-header">
		                    <h4 class="modal-title">운동 등록하기</h4>
		                    <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
		                </div>
		
		                <!-- Modal body -->
		                <div class="modal-body">
		                
		                <input type="text" id="employeeNumInput" name="ptLogNum" style="display: none;">
		               
		                    <div class="form-group">
		                        <label class="col-form-label">운동명 : </label>
		                        <input type="text" class="form-control" id="name2" name="name"   maxlength="40">
		                    </div>
		                    <div class="row g-2">
			                    <div class="col mb-0">
			                      <label for="emailBackdrop" class="form-label">무게 : </label>
			                      <input type="text" class="form-control" id="weight2" name="weight" value="KG">
			                    </div>
			                    <div class="col mb-0">
			                      <label for="emailBackdrop" class="form-label">횟수 : </label>
			                      <input type="number" class="form-control" id="exCount2" name="exCount"  min="1" value="1">
			                    </div>
			                    <div class="col mb-0">
			                      <label for="dobBackdrop" class="form-label">세트수 : </label>
			                      <input type="number" class="form-control" id="ptSet2" name="ptSet"  min="1" value="1">
			                    </div>
			                </div>
		                    
		                </div>
		
		                <!-- Modal footer -->
		                <div class="modal-footer">
		                	<button type="button" class="btn btn-outline-secondary x" data-bs-dismiss="modal">취소</button>
		                    <button type="button" class="btn btn-primary" id="addTypeForm">추가</button>
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
    <script type="text/javascript">
    function passValueToModal() {
        var employeeNum = document.querySelector('th').innerText;
        var modal = new bootstrap.Modal(document.getElementById('exampleModal'));
        // 여기서는 employeeNum을 모달에 적합한 방식으로 전달할 수 있습니다.
        // 예를 들어, 모달 내의 입력 필드 값으로 설정할 수 있습니다.
        var inputField = document.getElementById('employeeNumInput');
        inputField.value = employeeNum;
        console.log(employeeNum)
        
        $('#addTypeForm').on('click', function(event) {
            event.preventDefault(); // 기본 제출 동작 방지
            console.log("운동 추가 버튼이 클릭되었습니다.");
            let employeeNumInput = $('#employeeNumInput').val()
            let name = $('#name2').val();
            let weight = $('#weight2').val();
            let exCount = $('#exCount2').val();
            let ptSet =  $('#ptSet2').val();
            console.log(employeeNumInput);
            console.log(name);
            console.log(weight);
            console.log(exCount);
            console.log(ptSet);
            // Ajax를 사용하여 폼 데이터 서버로 전송
             $.ajax({
                type: "POST",
                url: "/trainer/addType",
                data: {
                    ptLogNum: employeeNumInput,
                    name:name ,
                    weight: weight,
                    exCount: exCount,
                    ptSet: ptSet
                }, // 폼 데이터 직렬화하여 전송
                success: function(response) {
                    alert("운동 추가 성공");
                    location.reload();
                },
                error: function(error) {
                    console.log("에러 발생", error);
                }
            }); 
        });
        
        
        
        
    }
    
    
    
    
   function deleteType(ptTypeNum){
    	$.ajax({
    		type:"POST",
    		url:"./delType",
    		data:{
    			ptTypeNum : ptTypeNum
    		},
    		success: function(response){
    			alert("운동 삭제 성공");
    			location.reload();
    		},
    		error:function(error){
    			console.log("에러");
    		}
    	})
   }
   
    function progress(){
	   
	   $.ajax({
		   url:'./finish',
		   data:{
			   ptLogNum:${ptLogNum},
			   
		   },
		   success:function(result){
			   var currProgress = result.currProgress;
			   console.log("진행률 : " + currProgress);
			   $(".progress-bar").text(currProgress + "%");
			   $(".progress-bar").attr("aria-valuenow", currProgress);
			   $('.progress-bar').css({"width": currProgress + "%"});
				
		   },
		   error:function(){
			   console.log("error")
		   }
	   })
   }  
    function finish(ptTypeNum){
        console.log("운동이 완료되었습니다");
        
        // Ajax를 사용하여 폼 데이터 서버로 전송
         $.ajax({
            
            url: "./upExerciseStatusOne",
            data: {
                ptTypeNum: ptTypeNum,
                
            }, // 폼 데이터 직렬화하여 전송
            success: function(response) {
                alert("운동완료");
                $('.finishBtn' + ptTypeNum).hide();
                progress();
            },
            error: function(error) {
                console.log("에러 발생", error);
            }
        }); 
    }
    $(document).ready(function(){
    	progress();
    })
   function postFormSubmit2(url) {
           	if(url === 'absentPt'){
           		var memberNum = document.getElementById('getMemNum').value;
           		
           		$.ajax({
           			type: 'POST',
           			url:'./absentPt',
           			data:{
           				memberNum:memberNum
           			},
           			success:function(data){
           				alert("결석 처리 완료");
						$('#yesClass').hide();           				
           				$('#noClass').hide();
           				location.href="/ptClass/myPtList"
           			},
           			error: function (error) {
                           // 에러 처리
                           console.error('고장 등록 실패', error);
                       }
           		});
           	}
           	if(url === 'attendPt'){
           		var memberNum = document.getElementById('getMemNum').value;
           		
           		$.ajax({
           			type: 'POST',
           			url:'./attendPt',
           			data:{
           				memberNum:memberNum
           			},
           			success:function(data){
           				alert("운동 완료");
						$('#yesClass').hide();           				
           				$('#noClass').hide();
           				location.href="/ptClass/myPtList"
           			},
           			error: function (error) {
                           // 에러 처리
                           console.error('고장 등록 실패', error);
                       }
           		});
           	}
               

               
           }
    </script>
  </body>
</html>