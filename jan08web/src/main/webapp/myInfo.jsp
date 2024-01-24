<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 보기</title>
<link href="css/styles.css" rel="stylesheet" />
<link href="./css/index.css" rel="stylesheet"/>
<link href="./css/board.css" rel="stylesheet"/>
<link href="./css/menu.css" rel="stylesheet"/>
<script type="text/javascript" src="./js/menu.js"></script>

</head>
<body>
<%
if(session.getAttribute("mid") == null){
	response.sendRedirect("./login");
}
%>
	<div class="container">
		<header>
			<%@ include file="menu.jsp"%>
		</header>
		<div class="main">
			<div class="mainStyle">
				<article>
				<div>
					<form action="./myInfo" method="post" onsubmit="return check()">
						<input type="password" name="newPW" id="newPW" placeholder="변경할 암호를 입력하세요">
						<button type="submit">수정하기</button><br>
					</form>					
				</div>
				</article>
				<article>
					<table>
						<thead>
							<tr>
								<td>번호</td>
								<td>글번호</td>
								<td>글제목</td>
								<td>읽은날짜</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${readData}" var="d">
							<tr>
								<td>${d.vno}</td>
								<td>${d.board_no}</td>
								<td onclick="location.href='./detail?no=${d.board_no}'">${d.board_title}</td>
								<td>${d.vdate}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				

				
				</article>
			</div>
		</div>
		<footer>
		<c:import url="footer.jsp"/>
		</footer>
	</div>
	<script type="text/javascript">
		function check() {
			var pw = document.querySelector("#newPW");
			if(pw.value.length <5){
			alert("암호는 5글자 이상");
			return false;
			}
		}
	</script>
</body>
</html>