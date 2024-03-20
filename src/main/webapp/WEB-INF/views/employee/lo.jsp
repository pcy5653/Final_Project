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
<c:import url="/WEB-INF/views/layout/css.jsp"></c:import>
<c:import url="/WEB-INF/views/layout/topScript.jsp"></c:import>
<link rel="stylesheet" href="/css/main.css" />

</head>
<body>
  <div id="wrap">
    <div id="loginFrm">
      <h1>logo</h1> 
      <div class="errorMessage">
        <!-- login 실패시 message가 뜸. code=키이름 var=키값을 담는 곳 -->
        <spring:message code="${param.message}" var="message"></spring:message>
        <h3>${message}</h3>
      </div>
      <!-- action 생략가능, 현재 url = action -->
      <form:form modelAttribute="employeeVO" action="/employee/login" method="post">
        <div class="id_div">
          <form:label path="employeeNum">직원 아이디</form:label>
          <form:input path="employeeNum"/>
        </div>
        <div class="pw_div">  
          <form:label path="password">비밀번호</form:label>
          <form:password path="password"/>
        </div>
        <div class="idSave">
          <input type="checkbox" id="rememberId" name="rememberId">
          <label for="rememberId">아이디저장</label>
        </div>
        <div class="findPw_div">
          <a href="/findPw" id="findPw">비밀번호 찾기</a>
        </div>
      	<button type="submit">로그인</button>
      </form:form>
    </div>
  </div>
  <script type="text/javascript">
    // redirect 로 보냈을 때, URL 경로나타내는 것을 삭제.
    history.replaceState({}, null, location.pathname);
 </script>
</body>
<c:import url="/WEB-INF/views/layout/btmScript.jsp"></c:import>
</html>