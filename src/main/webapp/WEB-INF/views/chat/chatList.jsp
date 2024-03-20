<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<ul class="ul">
<li class="li">관리자
  <c:forEach items="${list}" var="li">
    <ol>
       <li class="ul">
       	<c:if test="${li.position == '대표'}">
       		<a href="#" class="chatList" data-empNum="${li.employeeNum}" data-name="${li.name}" data-pos="${li.position}"><i class='mx-1 bx bx-message-square'></i>${li.name} [${li.position}]</a>
       	</c:if>
       </li>                
    </ol>
  </c:forEach>
  <c:forEach items="${list}" var="li">
    <ol>
       <li class="ul">
       	<c:if test="${li.position != '트레이너'&&li.position != '대표'}">
       		<a href="#" class="chatList" data-empNum="${li.employeeNum}" data-name="${li.name}" data-pos="${li.position}"><i class='mx-1 bx bx-message-square'></i>${li.name} [${li.position}]</a>
       	</c:if>
       </li>                
    </ol>
  </c:forEach>
</li>
<li class="li" style="padding-top: 7%;">트레이너
  <c:forEach items="${list}" var="li">
    <ol>
       <li class="ul">
       	<c:if test="${li.position == '트레이너'}">
       		<a href="#" class="chatList" data-empNum="${li.employeeNum}" data-name="${li.name}" data-pos="${li.position}"><i class='mx-1 bx bx-message-square'></i>${li.name} [${li.position}]</a>
        	</c:if>
        </li>                
     </ol>
   </c:forEach>
 </li>
</ul> 