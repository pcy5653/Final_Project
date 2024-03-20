<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
   <!-- moment lib -->
	<script src='https://cdn.jsdelivr.net/npm/moment@2.27.0/min/moment.min.js'></script>
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
                <div class="col-xxl">
                  <div class="card mb-4">
                    <div class="card-header">
                      <h3 class="emp_title" style="text-align: center;margin-top: 1rem;"><span style="font-weight: 800;">${employeeVO.name} ${employeeVO.position}</span> 정보수정</h3>
                      <c:if test="${fn:contains(['대표','총괄 매니저','고객관리 매니저','인사 매니저','시설 매니저','가발령'], employeeVO.position)}">
                        <div id="allDiv">
                          <form:form modelAttribute="employeeVO" method="post" enctype="multipart/form-data" id="frm" action="./infoUpdate">
                            <div class="proFile_con" style="text-align: center;margin: 2rem auto 3rem; display: flex; flex-direction: column;align-items: center;">
                              <img src="../file/employee/${employeeVO.proFile}" alt="직원 프로필" style="width:10rem; height:10rem;border-radius: 50%; object-fit: cover;"  onerror="this.style.display='none'">
                              <p>${employeeVO.proOriginal}</p>
                              <input type="file"  name="empfile" id="proFile" style="width: 13rem;"  class="form-control" required/>
                            </div>
                            <div style="display: flex; justify-content: space-between; margin-bottom: 5rem;">
                              <div  class="empLeft" style="width: 47%;">
                                <div class="row mb-3">
                                  <label for="emploiyeNum" class="col-sm-2 col-form-label">사번</label>
                                  <div class="col-sm-10">
                                    <input type="text" class="form-control" name="employeeNum" id="employeeNum" value="${employeeVO.employeeNum}" data-num="${emploiyeNum}" readonly="true">
                                  </div>
                                </div>
                                <div class="row mb-3">
                                  <form:label path="name" class="col-md-2 col-form-label">이름</form:label>
                                  <div class="col-sm-10">
                                    <form:input path="name" id="name" class="form-control" value="${employeeVO.name}" ></form:input>
                                  </div> 
                                  <form:errors path="name"></form:errors>
                                </div>
                                <div class="row mb-3">
                                  <form:label path="phone" class="col-md-2 col-form-label">전화번호</form:label>
                                  <div class="col-sm-10">
                                    <form:input path="phone" id="phone"  class="form-control" ></form:input>
                                  </div>
                                  <form:errors path="phone"></form:errors>
                                </div>
                                <div class="mb-3 row">
                                  <label for="html5-text-input" class="col-md-2 col-form-label">주소</label>
                                  <div class="col-md-10">
                                    <input class="form-control address input" name="address" type="text" id="html5-text-input"  value="${employeeVO.address}" placeholder="우편번호"/>
                                    <button type="button" id="addressBtn" class="btn btn-primary">우편번호 찾기</button>
                                    <input class="form-control" type="hidden" id="html5-text-input"  placeholder="주소" />
                                    <input class="form-control" type="hidden" id="html5-text-input"  placeholder="상세주소" value="" />
                                    <div id="addressMsg"></div>
                                  </div>
                                </div>
                              </div>
                              <div class="empRight" style="width: calc(100% - 53%);">
                                <div class="row mb-3" >
                                  <form:label path="birth" class="col-md-2 col-form-label">생년월일</form:label>
                                  <div class="col-md-10">
                                    <form:input type="date" path="birth" id="birth"  class="form-control" ></form:input>
                                  </div>
                                  <form:errors path="birth"></form:errors>
                                </div>
                                <div class="row mb-3">
                                  <form:label path="joinDate" class="col-md-2 col-form-label">입사일</form:label>
                                  <div class="col-md-10">
                                    <form:input path="joinDate" id="joinDate"  class="form-control" value="" readonly="true"></form:input>
                                  </div>
                                  <form:errors path="joinDate"></form:errors>
                                </div>
                                <div class="row mb-3">
                                  <label for="html5-text-input" class="col-md-2 col-form-label">성별</label>
                                  <input type="hidden" id="genderVal" cssClass="input_con" readonly="ture" value="${employeeVO.gender}"></input>
                                  <div class="col-md-10" style="display: flex;">
                                    <div class="form-check mt-3" style="margin-top:0 !important; margin-right: 2rem;">
                                      <label class="form-check-label" for="gender_M"> 남 </label>
                                      <input class="form-check-input" name="gender" type="radio" value="남" id="gender_M" />
                                    </div>
                                    <div class="form-check">
                                      <label class="form-check-label" for="gender_W"> 여 </label>
                                      <input  class="form-check-input" name="gender" type="radio" value="여" id="gender_W"/>
                                    </div>
                                  </div>
                                </div>
                                <div class="row mb-3"  style="display:flex; align-items: center;">
                                  <label for="leaveDate"class="col-md-2 col-form-label">총 연차 갯수</label>
                                  <input style="display: none;" name="leaveDate" id="leaveDate"  class="form-check-input" value="${employeeVO.leaveDate}">${employeeVO.leaveDate}</input>
                                  <input style="display: none;" name="position" id="position"  class="form-check-input" value="${employeeVO.position}" ></input>
                                </div>
                                <div class="row mb-3">
                                  <label for="state"class="col-md-2 col-form-label">직원상태</label>
                                  <input type="radio" name="state" id="state" class="form-check-input state_input" style="padding-right: 0;
                                  margin-right: calc(var(--bs-gutter-x) * 0.5);" value="재직" checked>재직</input>
                                </div>
                                <c:if test = "${employeeVO.position eq 'ROLE_TRAINER'}" >

                                  
                                </c:if>
                              </div>
                            </div>
                            <div class="upBtn" style="text-align: center;">
                              <button type="button" id="backBtn" class="btn btn-primary">이전</button>
                              <button type="submit" id="upBtn" class="btn btn-primary">수정 완료</button>
                            </div>
                          </form:form>
                        </div>
                      </c:if>
                      <!-- 트레이너 ver -->
                      <c:if test="${employeeVO.position.toString() eq '트레이너'}">
                        <div id="trainerDiv" style="position: relative;">
                          <form:form modelAttribute="employeeVO" method="post" enctype="multipart/form-data" id="frm" action="./infoUpdate">
                            <div class="proFile_con" style="text-align: center;margin: 2rem auto 3rem;">
                              <img src="../file/employee/${employeeVO.proFile}" alt="직원 프로필" style="width:10rem; height:10rem;border-radius: 50%;object-fit: cover;"  onerror="this.style.display='none'">
                              <p>${employeeVO.proOriginal}</p>
                              <input type="file"  name="empfile" id="proFile" style="width: 13rem;" required/>
                            </div>
                            <div style="display: flex; justify-content:space-evenly">
                              <div  class="empLeft" style="width: 47%;">
                                <div class="row mb-3">
                                  <label for="emploiyeNum" class="col-sm-2 col-form-label">사번</label>
                                  <div class="col-sm-10">
                                    <input type="text" class="form-control" name="employeeNum" id="employeeNum" value="${employeeVO.employeeNum}" data-num="${emploiyeNum}" readonly="true">
                                  </div>
                                </div>
                                <div class="row mb-3">
                                  <form:label path="name" class="col-md-2 col-form-label">이름</form:label>
                                  <div class="col-sm-10">
                                    <form:input path="name" id="name" class="form-control" value="${employeeVO.name}" ></form:input>
                                  </div> 
                                  <form:errors path="name"></form:errors>
                                </div>
                                <div class="row mb-3">
                                  <form:label path="phone" class="col-md-2 col-form-label">전화번호</form:label>
                                  <div class="col-sm-10">
                                    <form:input path="phone" id="phone"  class="form-control" ></form:input>
                                  </div>
                                  <form:errors path="phone"></form:errors>
                                </div>
                                <div class="mb-3 row">
                                  <label for="html5-text-input" class="col-md-2 col-form-label">주소</label>
                                  <div class="col-md-10">
                                    <input class="form-control address input" name="address" type="text" id="html5-text-input"  value="${employeeVO.address}" placeholder="우편번호"/>
                                    <button type="button" id="addressBtn" class="btn btn-primary">우편번호 찾기</button>
                                    <input class="form-control" type="hidden" id="html5-text-input"  placeholder="주소" />
                                    <input class="form-control" type="hidden" id="html5-text-input"  placeholder="상세주소" value="" />
                                    <div id="addressMsg"></div>
                                  </div>
                                </div>
                                <div class="row mb-3" >
                                  <form:label path="birth" class="col-md-2 col-form-label">생년월일</form:label>
                                  <div class="col-md-10">
                                    <form:input type="date" path="birth" id="birth"  class="form-control" ></form:input>
                                  </div>
                                  <form:errors path="birth"></form:errors>
                                </div>
                                <div class="row mb-3">
                                  <form:label path="joinDate" class="col-md-2 col-form-label">입사일</form:label>
                                  <div class="col-md-10">
                                    <form:input path="joinDate" id="joinDate"  class="form-control" value="" readonly="true"></form:input>
                                  </div>
                                  <form:errors path="joinDate"></form:errors>
                                </div>
                                <div class="row mb-3">
                                  <label for="html5-text-input" class="col-md-2 col-form-label">성별</label>
                                  <input type="hidden" id="genderVal" cssClass="input_con" readonly="ture" value="${employeeVO.gender}"></input>
                                  <div class="col-md-10" style="display: flex;">
                                    <div class="form-check mt-3" style="margin-top:0 !important; margin-right: 2rem;">
                                      <label class="form-check-label" for="gender_M"> 남 </label>
                                      <input class="form-check-input" name="gender" type="radio" value="남" id="gender_M" />
                                    </div>
                                    <div class="form-check">
                                      <label class="form-check-label" for="gender_W"> 여 </label>
                                      <input  class="form-check-input" name="gender" type="radio" value="여" id="gender_W"/>
                                    </div>
                                  </div>
                                </div>
                                <div class="row mb-3"  style="display:flex; align-items: center;">
                                  <label for="leaveDate"class="col-md-2 col-form-label">총 연차 갯수</label>
                                  <input style="display: none;" name="leaveDate" id="leaveDate"  class="form-check-input" value="${employeeVO.leaveDate}">${employeeVO.leaveDate}</input>
                                  <input style="display: none;" name="position" id="position"  class="form-check-input" value="${employeeVO.position}" ></input>
                                </div>
                                <div class="row mb-3">
                                  <label for="state"class="col-md-2 col-form-label">직원상태</label>
                                  <input type="radio" name="state" id="state" class="form-check-input state_input" style="padding-right: 0;
                                  margin-right: calc(var(--bs-gutter-x) * 0.5);" value="재직" checked>재직</input>
                                </div>
                              </div>
                              <div class="empRight" style="width: calc(100% - 53%);">
                                
                              </div>
                            </div>
                            <div class="upBtn" style="text-align: center;">
                              <button type="button" id="backBtn" class="btn btn-primary">이전</button>
                              <button type="submit" id="upBtn" class="btn btn-primary">수정 완료</button>
                            </div>
                          </form:form>
                          <div id="carcer" style="width:30rem;position:absolute;right:8rem;top:17rem;">
                            <form id="careerFrm" style="text-align: center;">
                              <div class="row mb-3" style="display: flex;justify-content: center;">
                                <div id="careerCon">
                                  <c:forEach items="${employeeVO.careers}" var="career" >
                                    <!-- <div id="infoCareerText">
                                      <div class="row mb-3">
                                        <label for="career" class="col-sm-2 col-form-label" style="text-align: center;line-height: 77.88px;font-size: 0.9rem;font-weight: 600;">경력</label>
                                        <div class="col-sm-10">
                                          <input type="text" class="form-control career" id="basic-default-name" value="${career.caTitle}" readonly/>
                                          <input type="text" class="form-control career" id="basic-default-name" value="${career.caPassDate}" readonly/>
                                        </div>
                                      </div>
                                    </div>  -->
                                  </c:forEach>
                                  <div id="careerInputCon"></div>
                                </div>

                                <label for="caTitle" class="col-md-2 col-form-label">경력 명</label>
                                <div class="col-sm-10"> 
                                  <input name="caTitle" id="caTitle" class="form-control" ></input>
                                </div>
                                <label for="caPassDate" class="col-md-2 col-form-label" >날짜</label>
                                <div class="col-sm-10"> 
                                  <input type="date" name="caPassDate" id="caPassDate" class="form-control"></input>
                                </div>
                                <button id="carBtn" type="button" class="btn btn-primary" style="width: 10rem;">추가</button>
                              </div>
                            </form>

                            <form id="certificationFrm" style="text-align: center;">
                              <div class="row mb-3" style="display: flex;justify-content: center;">
                                <div id="certificationCon">
                                  <c:forEach items="${employeeVO.certifications}" var="certification">
                                    <!-- <div id="certification">
                                      <div class="row mb-3">
                                        <label for="certification" class="col-sm-2 col-form-label" style="text-align: center;line-height: 77.88px;font-size: 0.9rem;font-weight: 600;">경력</label>
                                        <div class="col-sm-10">
                                          <input type="text" class="form-control certification" id="basic-default-name" value="${certification.cerTitle}" readonly/>
                                          <input type="text" class="form-control certification" id="basic-default-name" value="${certification.cerPassDate}" readonly/>
                                        </div>
                                      </div>
                                    </div> -->
                                  </c:forEach>
                                  <div id="certificationInputCon"></div>
                                </div>  
                                <label for="cerTitle" class="col-md-2 col-form-label">자격증 명</label>
                                <div class="col-sm-10"> 
                                  <input name="cerTitle" id="cerTitle" class="form-control"></input>
                                </div>
                                <label for="cerPassDate" class="col-md-2 col-form-label">날짜</label>
                                <div class="col-sm-10"> 
                                  <input type="date" name="cerPassDate" id="cerPassDate" class="form-control"></input>
                                </div>
                                <button id="cerBtn" type="button" class="btn btn-primary" style="width: 10rem;">추가</button>
                              </div>  
                            </form>
                          </div>
                        </div>
                      </c:if>
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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="/js/employee/infoUpdate.js"></script>
<script>


  // $("#carBtn").click(function(){
  //   $.ajax({
  //     type:'post',
  //     url:"/employee/setInfoCareerUpdate",
  //     data : {
  //       caTitle : caTitle,
  //       caPassDate : caPassDate,
  //       emploiyeNum : emploiyeNum
  //     },
  //     success:function(result){
  //       if(result.trim==1)
  //     }
  //   })
  // })

  $("#carBtn").click(function(){

    let caTitle = document.getElementById("caTitle").value;
    let caPassDate = document.getElementById("caPassDate").value; 
    

    // 경력 업데이트
    if(caTitle != null && caPassDate != null){  
      $.ajax({
        type:'post',
        url:"/employee/infoCareerUpdate",
        data : {
          caTitle : caTitle,
          caPassDate : caPassDate
        },
          success:function(result){
            result.trim==1
            caData();
          }
        })
      }else{
        alert("둘다 입력해야 등록이 가능합니다.");
      }
  })  

  function caData(){
    $.ajax({
      type:'get',
      url:"/employee/infoCareerUpdate",
      success:function(data){

        // JSON 데이터를 파싱하여 처리
        var careerList = JSON.parse(JSON.stringify(data));

        // 마지막 항목 선택
        var lastCareer = careerList[careerList.length - 1];

        // 마지막 항목만 렌더링
        $("#careerInputCon").append('<input type="text" name="caTitle" class="form-control" id="basic-default-name" value="' + lastCareer.caTitle + '" readonly="true">');
        $("#careerInputCon").append('<input type="text" name="caPassDate" class="form-control" id="basic-default-name" value="' + lastCareer.caPassDate + '" readonly="true">');
      }
    })
  }



  // 자격증 업데이트
$("#cerBtn").click(function(){

  let cerTitle = document.getElementById("cerTitle").value;
  let cerPassDate = document.getElementById("cerPassDate").value;

  console.log(cerTitle);
  console.log(cerPassDate);

  if(cerTitle != null && cerPassDate != null){  
      $.ajax({
        type:'post',
        url:"/employee/infoCertificationUpdate",
        data : {
          cerTitle : cerTitle,
          cerPassDate : cerPassDate
        },
        success:function(result){
          result.trim==1
          cerData();
        }
      })
    }else{
      alert("둘다 입력해야 등록이 가능합니다.");
    }
  })  

  function cerData(){
    $.ajax({
      type:'get',
      url:"/employee/infoCertificationUpdate",
      success:function(data){

        // JSON 데이터를 파싱하여 처리
        var certificationList = JSON.parse(JSON.stringify(data));

        // 마지막 항목 선택
        var lastCertification = certificationList[certificationList.length - 1];

        // 마지막 항목만 렌더링
        $("#certificationInputCon").append('<input type="text" name="cerTitle" class="form-control" id="basic-default-name" value="' + lastCertification.cerTitle + '" readonly="true">');
        $("#certificationInputCon").append('<input type="text" name="cerPassDate" class="form-control" id="basic-default-name" value="' + lastCertification.cerPassDate + '" readonly="true">');
      }
    })
  }

  const caText = document.getElementById("infoCareerText");
  const cerText = document.getElementById("infoCertificationText")
  const ca = document.getElementsByClassName("career");
  const cer = document.getElementsByClassName("certification");

  
  for(ci of ca){
    if(ci.value == ''){
      ci.style="none";
    }
  }

  for(ceri of ca){
    if(ceri.value == ''){
      ceri.style="none";
    }
  }

  //현재 날짜
  const today = new Date(); 
  //원하는 형식으로 포맷
  let formattedDay = moment(today).format("YYYY-MM-DD"); 
  //현재 날짜 이후의 날짜 선택 불가하게 설정 
  $('#birth').attr('max', formattedDay);

</script>
</body>
</html>