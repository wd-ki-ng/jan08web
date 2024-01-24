<%@page import="java.sql.Connection"%>
<%@page import="com.king.db.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/styles.css" rel="stylesheet" />
<link href="./css/menu.css" rel= "stylesheet"/>
<link href="./css/index.css" rel= "stylesheet"/>
<script type="text/javascript" src="./js/menu.js"></script>
</head>
<body>
	<header>
		<%@ include file="./menu.jsp" %>
		<!-- jsp:은 출력 결과만 화면에 나옵니다. -->
	</header>
		
	<div class="main">
		<div class="mainstyle">
		<%--
		//서버에서 보내준 map : ${map}<br>
		
		<c:forEach items="${map}" var="i">
			이름 : ${i.name}<br>
			나이 : ${i.age}<br>
			주소 : ${i.addr}<br>
		</c:forEach>
		
		<c:set value="${map}" var="m" scope="page"></c:set>
		<c:out value="${m}"></c:out><br>  
		<c:out value="${m[1]}"></c:out>
		<c:out value="${m[0]['name']}"></c:out>
		
		
		<c:set value="king1" var="mname" scope="session"/>
		<c:set value="king1" var="mid" scope="session"/>
		
		<c:if test="">
		
		</c:if>
		
		<c:choose>
		<c:when test=""></c:when>
		<c:otherwise></c:otherwise>
		</c:choose>
		
		스프링-->스프링 부트....스프링부트 타임리프
		controller- servlet
		Service--- 로직
		Model ---- DAO DTO
		XML --- 확장 html
		
		
			<article>
				<c:set var="number" value="105"/>
				<c:out value="${number}"/><br>
				
				<c:forEach begin="1" end="9" var="row" step="1">
					 2 x ${row} = ${row * 2 }<br>
				</c:forEach>

				<c:if test="${number eq 105 }">
					number는 105입니다.<br>
					eq 11 == 5				false<br>
					ne 11 != 5				true<br>
					lt 11 〈 5 작다			false<br>
					gt 11 〉 5 크다			true<br>
					le 11〈= 5 작거나 같다	false<br>
					ge 11〉= 5 크거나 같다	true<br>
					&&			and<br>
					||			or<br>
					empty		비어있는지<br>
					not empty	비어있지 않은지<br>
				</c:if>
				<hr>
				1~45까지 짝수만 출력하세요
				<c:forEach begin="0" end="45" var="num" step="2">
				${num }
				</c:forEach>
				<hr>
				
				1~45까지 짝수만 출력하세요
				<c:forEach begin="1" end="45" var="nums">
					<c:if test=" ${nums % 2 eq 0}">
						${nums }
					</c:if>
				</c:forEach>
			</article> 
			<article>
				<c:import url="menu.jsp"/>
				 <c:redirect url="./board"/>
				<br>
				<c:forEach begin="1" end="10" var="row" varStatus="s">
				${s.begin } / ${s.end } <br>
				</c:forEach>
			</article>
			--%>
		</div>
	</div>
	<footer>
	<c:import url="footer.jsp"/>
	</footer>
</body>
</html>