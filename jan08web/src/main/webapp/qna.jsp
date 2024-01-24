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
			<article>
			<h1>qna입니다.</h1>
				
			</article>
		
		</div>
	</div>
		<footer>
	<c:import url="footer.jsp"/>
	</footer>
</body>
</html>