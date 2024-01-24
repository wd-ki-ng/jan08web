<%@page import="java.sql.Connection"%>
<%@page import="com.king.db.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/styles.css" rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<link href="./css/menu.css" rel="stylesheet" />
<link href="./css/index.css" rel="stylesheet" />
<script type="text/javascript" src="./js/menu.js"></script>
<style type="text/css">
.login {
	margin: 0 auto;
	padding: 0;
	width: 500px;
	height: 500px;
	text-align: center;
	background-color: lime;
}

.login input {
	margin: 10px auto;
	padding-top: 10px;
	width: 350px;
	height: 60px;
	text-align: right;
	box-sizing: border-box;
	padding-top: 10px;
}

.login button {
	text-align: center;
	width: 25%;
	height: 50px;
}
</style>
<script type="text/javascript">
	function err() {
		let errBox = document.querySelector("#errorMSG");
		errBox.innerHTML = "<marquee>올바른 id 와 pw를 입력하세요.</marquee>";
		errBox.style.color = 'red';
		errBox.style.fontSize = "14pt";
	}
</script>
</head>
<body>
	<div class="container">
		<header>
			<%@ include file="./menu.jsp" %>
			<!-- jsp:은 출력 결과만 화면에 나옵니다. -->
		</header>
		<div class="main">
			<div class="mainstyle">
				<article>
					<h1>login</h1>
					<%--
 					<c:if test="${param.error ne null}">
						<script type="text/javascript">
							alert("올바른 암호와 아이디를 입력하세요.");
							var errorBox = document.getElementByID("errorMSG");
							errorBox.innerHTML = "올바른 암호와 아이디를 입력하세요.";
						</script>
					</c:if>
					 --%>
					<div class="login">
						<form action="./login" method="post">
							<img alt="로그인하세요" src="./image/login.png"><br> 
							<input type="text" name="id" placeholder="아이디를 입력하세요"><br>
							<input type="password" name="pw" placeholder="비밀번호를 입력하세요"><br>
							<button type="submit">로그인</button>
							<button type="reset">지우기</button>
							<div id="errorMSG"></div>
						</form>
							<a href=./join>회원가입</a>
					</div>
				</article>
			</div>
		</div>
	</div>
	<c:if test="${param.error ne null }">
		<script type="text/javascript">
			err();
		</script>
	</c:if>
		<footer>
	<c:import url="footer.jsp"/>
	</footer>
</body>
</html>