<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  #wrap{position:relative; height:100vh;}
  #wrap > #loginFrm {position: absolute;
    width: 35rem;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    background: rgb(209, 209, 209);
    padding: 3rem;
    height: 25rem;
    text-align: center;}
  #wrap > #loginFrm > h1 {margin-bottom:1rem;}
  #wrap > #loginFrm > .errorMessage {height: 2rem;margin-bottom: 1rem;font-size: 1.2rem;}
  #wrap > #loginFrm > form {display:flex; flex-direction: column;justify-content: center;}
  #wrap > #loginFrm > form > div {margin-bottom: 2rem;width:100%;text-align:left;padding: 0 3rem;}
  #wrap > #loginFrm > form > div.id_div::after, #wrap > #loginFrm > form > div.pw_div::after {
    display: inline-block; content: ""; width: 25rem; height: 2px;background-color: rgb(67, 67, 67);
  }
  #wrap > #loginFrm > form > div.idSave {text-align:right;padding:0;}
  #wrap > #loginFrm > form > div > label {width:7rem;display: inline-block;font-size: 1.3rem;text-align: center;font-weight:700;}
  #wrap > #loginFrm > form > div > input#employeeNum, #wrap > #loginFrm > form > div > input#password {width:15rem;border:none;background-color:rgb(209, 209, 209);}
</style>
<c:import url="/WEB-INF/views/layout/base.jsp"></c:import>
<c:import url="/WEB-INF/views/layout/js.jsp"></c:import>
</head>
<body>
  <div id="wrap" style="position: relative;">
    <div class="authentication-wrapper authentication-basic container-p-y">
      <div class="authentication-inner py-4">
        <!-- Forgot Password -->
        <div class="card" style="width: 25%; position:absolute;left:50%;top:50%;transform: translate(-50%, -50%);">
          <div class="card-body">
            <!-- Logo -->
            <div class="app-brand justify-content-center">
              <a href="#" style="width: 6rem; height: 6rem;">
                <img src="/img/CLOUDPT.jpg" alt="메인 로고" id="logo" style="width: 100%;height: 100%;">
                <!-- <span class="app-brand-logo demo">
                  <svg
                    width="25"
                    viewBox="0 0 25 42"
                    version="1.1"
                    xmlns="http://www.w3.org/2000/svg"
                    xmlns:xlink="http://www.w3.org/1999/xlink"
                  >
                    <defs>
                      <path
                        d="M13.7918663,0.358365126 L3.39788168,7.44174259 C0.566865006,9.69408886 -0.379795268,12.4788597 0.557900856,15.7960551 C0.68998853,16.2305145 1.09562888,17.7872135 3.12357076,19.2293357 C3.8146334,19.7207684 5.32369333,20.3834223 7.65075054,21.2172976 L7.59773219,21.2525164 L2.63468769,24.5493413 C0.445452254,26.3002124 0.0884951797,28.5083815 1.56381646,31.1738486 C2.83770406,32.8170431 5.20850219,33.2640127 7.09180128,32.5391577 C8.347334,32.0559211 11.4559176,30.0011079 16.4175519,26.3747182 C18.0338572,24.4997857 18.6973423,22.4544883 18.4080071,20.2388261 C17.963753,17.5346866 16.1776345,15.5799961 13.0496516,14.3747546 L10.9194936,13.4715819 L18.6192054,7.984237 L13.7918663,0.358365126 Z"
                        id="path-1"
                      ></path>
                      <path
                        d="M5.47320593,6.00457225 C4.05321814,8.216144 4.36334763,10.0722806 6.40359441,11.5729822 C8.61520715,12.571656 10.0999176,13.2171421 10.8577257,13.5094407 L15.5088241,14.433041 L18.6192054,7.984237 C15.5364148,3.11535317 13.9273018,0.573395879 13.7918663,0.358365126 C13.5790555,0.511491653 10.8061687,2.3935607 5.47320593,6.00457225 Z"
                        id="path-3"
                      ></path>
                      <path
                        d="M7.50063644,21.2294429 L12.3234468,23.3159332 C14.1688022,24.7579751 14.397098,26.4880487 13.008334,28.506154 C11.6195701,30.5242593 10.3099883,31.790241 9.07958868,32.3040991 C5.78142938,33.4346997 4.13234973,34 4.13234973,34 C4.13234973,34 2.75489982,33.0538207 2.37032616e-14,31.1614621 C-0.55822714,27.8186216 -0.55822714,26.0572515 -4.05231404e-15,25.8773518 C0.83734071,25.6075023 2.77988457,22.8248993 3.3049379,22.52991 C3.65497346,22.3332504 5.05353963,21.8997614 7.50063644,21.2294429 Z"
                        id="path-4"
                      ></path>
                      <path
                        d="M20.6,7.13333333 L25.6,13.8 C26.2627417,14.6836556 26.0836556,15.9372583 25.2,16.6 C24.8538077,16.8596443 24.4327404,17 24,17 L14,17 C12.8954305,17 12,16.1045695 12,15 C12,14.5672596 12.1403557,14.1461923 12.4,13.8 L17.4,7.13333333 C18.0627417,6.24967773 19.3163444,6.07059163 20.2,6.73333333 C20.3516113,6.84704183 20.4862915,6.981722 20.6,7.13333333 Z"
                        id="path-5"
                      ></path>
                    </defs>
                    <g id="g-app-brand" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                      <g id="Brand-Logo" transform="translate(-27.000000, -15.000000)">
                        <g id="Icon" transform="translate(27.000000, 15.000000)">
                          <g id="Mask" transform="translate(0.000000, 8.000000)">
                            <mask id="mask-2" fill="white">
                              <use xlink:href="#path-1"></use>
                            </mask>
                            <use fill="#696cff" xlink:href="#path-1"></use>
                            <g id="Path-3" mask="url(#mask-2)">
                              <use fill="#696cff" xlink:href="#path-3"></use>
                              <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-3"></use>
                            </g>
                            <g id="Path-4" mask="url(#mask-2)">
                              <use fill="#696cff" xlink:href="#path-4"></use>
                              <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-4"></use>
                            </g>
                          </g>
                          <g
                            id="Triangle"
                            transform="translate(19.000000, 11.000000) rotate(-300.000000) translate(-19.000000, -11.000000) "
                          >
                            <use fill="#696cff" xlink:href="#path-5"></use>
                            <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-5"></use>
                          </g>
                        </g>
                      </g>
                    </g>
                  </svg>
                </span> -->
                <span class="app-brand-text demo text-body fw-bolder">Sneat</span>
              </a>
            </div>
            <!-- /Logo -->
            <h4 class="mb-2" style="margin-top: 1.5rem; font-size: 1.2rem; text-align: center;">🔒비밀번호 찾기🔒</h4>
            <p class="mb-4">
              <div id="block1" style="display: none; text-align: center;" >	
                <label>일치하는 정보가 존재하지 않습니다.</label>
              </div>
            </p>
            <form:form modelAttribute="employeeVO" action="/employee/findPw" method="post" id="findPw" class="mb-3">
              <div class="row mb-3">
                <form:label path="employeeNum" class="col-md-2 col-form-label">아이디</form:label>
                <div class="col-md-10">
                  <form:input path="employeeNum" class="form-control" placeholder="직원 아이디를 입력하세요." autofocus="ture"/>
                </div>
              </div>
              <div class="row mb-3">  
                <form:label path="name" class="col-md-2 col-form-label">이름</form:label>
                <div class="col-md-10">
                  <form:input path="name" class="form-control" placeholder="이름을 입력하세요." autofocus="ture"/>    
                </div>
              </div>
              <div class="row mb-3">  
                <form:label path="phone" class="col-md-2 col-form-label">전화번호</form:label>
                <div class="col-md-10">
                  <form:input path="phone" class="form-control" placeholder="전화번호를 입력하세요." autofocus="ture"/>
                </div>
              </div>
              <div class="text-center" style="display: flex;justify-content: space-around;">
                <a href="../" class="d-flex align-items-center justify-content-center btn btn-primary" style="width:47%;">
                  Home
                </a>
                <button type="button" id="btn1" value="check" class="btn btn-primary d-grid w-100" style="width:calc(100% - 53%) !important;" data-check="${check}">비밀번호 발급받기</button>
              </div>
            </form:form>
            <div class="text-center" id="block2" style="display: none;">
              <div class="form-label-group">
                <input class="btn btn-lg btn-secondary btn-block text-uppercase" style="width: 97%;height: 2.5rem;line-height: 0rem;" id="btn2" type="button" data-phone="${phone}" data-num="${employeeNum}" data-name="${name}" value="임시비밀번호 받기">
              </div>
            </div>
          </div>
        </div>
        <!-- /Forgot Password -->
      </div>
    </div>
  </div>
      <div id="block1" style="display: none;" >
					
					<label>일치하는 정보가 존재하지 않습니다.</label>
      </div>
      <div id="block2" style="display: none;">
				<div class="form-label-group">
					<input class="btn btn-lg btn-secondary btn-block text-uppercase" id="btn2" type="button" data-phone="${phone}" data-num="${employeeNum}" data-name="${name}" value="임시비밀번호 전송">
				</div>
				
      </div>
  <script type="text/javascript">
    // redirect 로 보냈을 때, URL 경로나타내는 것을 삭제.
    //history.replaceState({}, null, location.pathname);
    //alert($("#btn1").val())
 </script>
</body>
<c:import url="/WEB-INF/views/layout/btmScript.jsp"></c:import>
<script>
  let dataCheck = document.getElementById("btn1").getAttribute("data-check");
  
  if (dataCheck === "1") {
        document.getElementById("block1").style.display = "block";
    } else if (dataCheck === "0") {
        document.getElementById("block2").style.display = "block";
    }
</script>
<script type="text/javascript" src="/js/employee/findPw.js"></script>


</html>





