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
  <div id="wrap">
    <div id="findPwFrm">
      <h3>비밀번호 찾기</h3> 
      <div class="errorMessage">
        <!-- login 실패시 message가 뜸. code=키이름 var=키값을 담는 곳 -->
        <spring:message code="${param.message}" var="message"></spring:message>
        <h3>${message}</h3>
      </div>
      <!-- action 생략가능, 현재 url = action -->
      <form:form modelAttribute="employeeVO" action="/employee/findPw" method="post" id="findPw">
        <div class="row mb-3">
          <form:label path="employeeNum">아이디</form:label>
          <form:input path="employeeNum"/>
          
        </div>
        <div class="row mb-3">  
          <form:label path="name">이름</form:label>
          <form:input path="name"/>
         
        </div>
        <div class="row mb-3">  
          <form:label path="phone">전화번호</form:label>
          <form:input path="phone"/>
          
        </div>
      	<button type="button" id="btn1" value="check" data-check="${check}">비밀번호 발급받기</button>
      </form:form>
    </div>
  </div>
      <div id="block1" style="display: none;" >	
					<label>일치하는 정보가 존재하지 않습니다.</label>
      </div>
      <div id="block2" style="display: none;">
				<div class="form-label-group">
					<input class="btn btn-lg btn-secondary btn-block text-uppercase" id="btn2" type="button" data-phone="${phone}" data-num="${employeeNum}" data-name="${name}" value="임시비밀번호 발급">
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





