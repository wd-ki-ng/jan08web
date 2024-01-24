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
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<link href="./css/menu.css" rel= "stylesheet"/>
<link href="./css/index.css" rel= "stylesheet"/>
<script type="text/javascript" src="./js/menu.js"></script>
<style type="text/css">
#title{
		width: 100%;
		height: 30px;
		margin-bottom: 10px
}

</style>
</head>
<body>
	<header>
		<%@ include file="./menu.jsp" %>
		<!-- jsp:은 출력 결과만 화면에 나옵니다. -->
	</header>
	<div class="main">
		<div class="mainstyle">
			<article>
			<h1>글 수정하기</h1>
						
			<div class="writeFORM">
				<form action="./edit" method="post">
					<input type="text" name="title" id="title" value="${edit.title }">
					<textarea id="summernote" name="content" >${edit.content }</textarea>
					<button type="submit" >수정</button>
					<input type="number" name="no" value="${edit.no }">
				</form>
				</div>
			</article>
		
		</div>
	</div>

	<script type="text/javascript">
	$(document).ready(function() {
		$('#summernote').summernote({
			height: 200
			});
		});
	</script>
		<footer>
	<c:import url="footer.jsp"/>
	</footer>
</body>
</html>