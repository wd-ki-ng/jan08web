<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판입니다</title>
<link href="../css/admin.css?ver=0.14" rel="stylesheet"/>
<link href="../css/board.css?ver=0.14" rel="stylesheet"/>
<script type="text/javascript" src="../js/menu.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
</head>
<body>
<h1>관리자 페이지입니다.</h1>
	<div class="wrap">
		<!--메뉴 틀-->
		<%@ include file="menu.jsp" %>
			<!-- 본문내용 -->
		<div class="main">
			<!--  이 페이지에 오는 모든 사람은 관리자인지 검사를 합니다.
			관리자 경우 보여주고, 로그인 하지 않았거나 일반 사용자는 로그인 페이지로 이동시킵니다.-->		
			<div>
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>날짜</th>
							<th>방문자</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="row">
						<tr>
							<td>${row.no}</td>
							<td>${row.title}<c:if test="${row.comment ne 0 }"><span>[${row.comment}]</span></c:if></td>
							<td>${row.write}</td>									
							<td>${row.date}</td>									
							<td>${row.count}</td>
							<td>
								<select name="del">
									<option <c:if test="${row.del eq 0}">selected="selected"</c:if> value="0" >0 삭제</option>
									<option <c:if test="${row.del eq 1}">selected="selected"</c:if> value="1" >1 유지</option>
								</select>	
								</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>