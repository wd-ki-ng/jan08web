<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 관리입니다</title>
<link href="../css/admin.css?ver=0.14" rel="stylesheet"/>
<link href="../css/board.css?ver=0.14" rel="stylesheet"/>
<script type="text/javascript" src="../js/menu.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script type="text/javascript">
$(function(){
	$('#searchBtn').click(function(){
		let search = $('#search').val();
		location.href="./board?search="+search;
	});
	$('.changeDel').click(function(){
		let eyes = $(this);
		let del = $(this).siblings('#del');
		let className = $(this).parents('tr');
		let no = className.children().first().text();
		
		$.ajax({
		url : './board',
		type : 'post',
		dataType : 'text',
		data : {'no': no, 'del' : del.val()},
		success : function(result){
			if(result == 1){
			if(del.val() == 1){
				className.attr('class','row0');
				del.val(0);
				eyes.attr('class','xi-eye-off-o changeDel');
				
			} else {
				className.attr('class','row1');
				del.val(1);
				eyes.attr('class','xi-eye changeDel');
			}
			} else {
				alert("문제가 발생했습니다.");
			}
		},
		error : function(error){
			alert("문제가 발생했습니다.");
		}
	}); //end ajax
		
	});
});
</script>
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
			<article>
				<h2>게시글 관리</h2>
			<div class="search">
				<input type="text" id="search"><button id="searchBtn">검색</button>
			</div>
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
							<td class="d2">${row.no}</td>
							<td class="d2">${row.title}<c:if test="${row.comment ne 0 }"><span>[${row.comment}]</span></c:if></td>
							<td class="d1">${row.write}</td>									
							<td class="d1">${row.date}</td>									
							<td class="d1">${row.count}</td>
							<td class="d1">
							<input type="hidden" id="del" value="${row.del}">
							<c:if test="${row.del eq 0}"><i class="xi-eye-off-o changeDel"></i></c:if>
							<c:if test="${row.del eq 1}"><i class="xi-eye changeDel"></i></c:if>
								<!-- 
								<select name="del">
									<option <c:if test="${row.del eq 0}">selected="selected"</c:if> value="0" >0 삭제</option>
									<option <c:if test="${row.del eq 1}">selected="selected"</c:if> value="1" >1 유지</option>
								</select>
								 -->	
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			</article>
		</div>
	</div>
</body>
</html>