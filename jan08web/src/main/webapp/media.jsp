<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="./css/styles.css" rel="stylesheet" />
<title>미디어 쿼리 연습</title>
<Style type="text/css">
/* 모든기기 공통css */
body{
	background-color: orange;
}

/* desktop 규격*/
@media screen and (min-width:1024px){
	body {
		background-color : yellow;
	}
}

/* tablet 규격*/
@media screen and (max-width:1023px){
	body {
		background-color : green;
	}
}

/* mobile 규격*/
@media screen and (max-width:540px){
	body {
		background-color : hotpink;
	}
}
</Style>
<script type="text/javascript">
//console.log(window.innerWidth);
//console.log(window.innerHeight);

window.onresize = function(event){
	document.getElementById('size').textContent = window.innerWidth + " x " + window.innerHeight;
}
</script>
</head>
<body>
	<h1 id="size">너비 X 높이</h1>
</body>
</html>