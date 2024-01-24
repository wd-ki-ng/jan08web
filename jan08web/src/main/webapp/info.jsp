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
				<h1>info</h1>
				<h2>2024-01-10 / 웹 서버프로그램 구현</h2>
				<ul>
					<li>톺아보기</li>
					<li>각각 게시판 서블릿 jsp</li>
					<li>글쓰기</li>
					<li>삭제하기</li>
					<li>수정하기</li>
				</ul>
				<h2>java - servlet - jsp(jsp/jstl/el) - thymelea</h2>
				<h2>2024-01-15</h2>
				<ul>
				<li>세션으로 로그인 만들기</li>
				<li>board테이블 변경</li>
				<li>내 정보 보기</li>

			</article>
		</div>
	</div>
		<footer>
	<c:import url="footer.jsp"/>
	</footer>
</body>
</html>