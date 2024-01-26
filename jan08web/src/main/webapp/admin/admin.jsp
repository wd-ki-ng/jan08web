<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지입니다.</title>
<link href="../css/admin.css" rel="stylesheet"/>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script type="text/javascript" src="../js/menu.js"></script>
</head>
<body>
	<h1>관리자 페이지입니다.</h1>
	<!-- 외부 틀 -->
	<div class="wrap">
	<!--메뉴 틀-->
		<div class="menu">
		<!-- 메뉴 내용 -->
			<nav>
				<ul>
					<li onclick="url('./members')"><i class="xi-users xi-2x"></i>회원 관리</li>
					<li onclick="url('./board')"><i class="xi-document xi-2x"></i>게시글 관리</li>
					<li onclick="url('./comments')"><i class="xi-forum-o xi-2x"></i>댓글 관리</li>
					<li onclick="url('./info')"><i class="xi-lock-o xi-2x"></i>king님</li>
					<li></li>
					<li></li>
				</ul>
			</nav>	
		</div>
		<!-- 본문내용 -->
		<div class="main">
		<!--  이 페이지에 오는 모든 사람은 관리자인지 검사를 합니다.
		관리자 경우 보여주고, 로그인 하지 않았거나 일반 사용자는 로그인 페이지로 이동시킵니다.-->
		<article>
			<div class="info">
				왼쪽 메뉴를 선택해 주세요
			</div>
		</article>
		
		</div>
	</div>
</body>
</html>