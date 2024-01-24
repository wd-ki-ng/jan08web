
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게-시판</title>
<link href="css/styles.css" rel="stylesheet" />
<link href="./css/menu.css" rel= "stylesheet"/>
<link href="./css/index.css" rel= "stylesheet"/>
<link href="./css/detail.css" rel= "stylesheet"/>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script type="text/javascript" src="./js/menu.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script type="text/javascript">
$(document).ready(function(){
	//alert("준비되었습니다");
	$(".commentDelete").click(function(){
		//alert("삭제버튼을 눌렀습니다.");
		//부모객체 찾아가기 = this 
		//let text = $(this).parent(".cname").text();
		//부모요소 아래 자식요소 찾기 children()
		//let cno = $(this).parent(".cname").children(".cno").val();
		//let cno = $(this).parent().children(".cno").val();
		//형제요소 찾기 .siblings()->형제중에 이름으로 찾아가기
		//.prev()바로 이전 .next() 바로 다음
		//let cno = $(this).siblings(".cno").val();
		
		//let parent = $(this).closest(".comment").hide();
		//ajax
		if(confirm("삭제하시겠습니까?")){
			let cno = $(this).prev().val();
			let point = $(this).closest(".comment");
			$.ajax({
				url : './commentDel',	//주소			따로 순서는 없음.
				type : 'post',			//get, post
				dataType : 'text',		//수신타입 json
				data : {'no':cno},		//보낼값
				success : function(result){
					//alert("서버에서 온 값 : " + result);
					if(result == 1){
						// 정상삭제 : this의 부모(.comment)를 찾아서 remove하겠습니다.
						//let parent = $(this).closest(".comment").html();
						
						//alert(parent);
						//point.remove();
						point.remove();
					} else {
						alert("삭제할 수 없습니다. 관리자에게 문의하세요.")
					}
				},
				error : function(request,status,error){
					alert("문제가 발생했습니다.");
				}
			}); //end ajax
		} // end del if
	});
	
	$(".commentUpdate").click(function(){
		if(confirm("수정하시겠습니까?")){
			let cno = $(this).siblings(".cno").val();
			let comment = $(this).closest(".chead").children(".ccoment").text();
			alert(cno + "   :   " + comment);
			/* $.ajax({
				url : './commentEdit',	//주소			따로 순서는 없음.
				type : 'post',			//get, post
				dataType : 'text',		//수신타입 json
				data : {no:cno},		//보낼값
				success : function(result1){
					//alert("서버에서 온 값 : " + result);
					
				},
				error : function(request,status,error){
					alert("문제가 발생했습니다.");
				}
			}); //end ajax */
			});
		} //end Edit if
	});//commentEdit 종료
	
	//댓글버튼을 누르면 댓글창이 나옴
	$(".comment-write").hide();
	
	$(".xi-comment-o").click(function(){
		$(".xi-comment-o").hide();
		//$(".comment-write").show();
		$(".comment-write").slideToggle('slow');
	});
	
	$("#comment-btn").click(function(){
		let content = $("#commentcontent").val();
		let bno = ${detail.no};//여기는 글번호
		//alert("content : " + content + " no : " + bno);
		//가상 form 만들기 = 동적생성
		//전송 --> content가 5글자 이상인 경우 실행하겠습니다.
		if(content.length < 5){
			alert("무플방지위원회. 다섯글자 이상 적어주세요.")
			$("#commentcontent").focus();
		} else {
			let form = $('<form></form>');
			form.attr('name','form');
			form.attr('method','post');
			form.attr('action', './comment');
			
			form.append($('<input/>',{type:'hidden', name:'commentcontent', value:content}));
			form.append($('<input/>',{type:'hidden', name:'bno', value:bno}));
			
			//c#과 자바는 서로 다른 시스템 -> 異種시스템
			form.appendTo("body");
			form.submit();
			/* let form = document.createElement('form');
			form.name='form';
			form.method='post';
			form.action='./comment';

			//붙이기
			let text = document.createElement('input');
			text.setAttribute("type", "hidden");
			text.setAttribute("name", "commentcontent");
			text.setAttribute("value", content);
			
			let no = document.createElement('input');
			no.setAttribute("type", "hidden");
			no.setAttribute("name", "bno");
			no.setAttribute("value", ${detail.no});
			//form에 붙이기
			form.appendChild(text);
			form.appendChild(no);
			//전송하기
			document.body.appendChild(form);
			form.submit(); */
		}
	});
});
</script>
</head>
<body>
	<header>
		<%@ include file="./menu.jsp" %>
	</header>
	<div class="main">
		<div class="mainstyle">
			<article>
				<div class="detailDIV"><!--제목  -->
					<div class="detailTITLE"><!--날짜  -->
						${detail.title }
					</div>
					<div class="detailWRITECOUNT">
						<div class="detailWRITE">
							${detail.write }
							<c:if test="${sessionScope.mname ne null && detail.mid eq sessionScope.mid}">
								<img alt="삭제" src="./image/trash.png" onclick="del()">
								<img alt="수정" src="./image/edit.png" onclick="edit()">
							</c:if>
						</div>
						<div class="detailCOUNT">${changeIP} / ${detail.count }</div>
					</div>
					<div class="detailCONTENT">
						${detail.content }
					</div>
				</div>
				<c:if test="${sessionScope.mid ne null }">
					<!-- 댓글쓰는 창을 여기다가 만들어주겠습니다. 2024-01-22 -->
					<button class="xi-comment-o">댓글쓰기</button>
				<div class="comment-write">
					<div class="comment-form">
						<textarea class="commentcontent"  id="commentcontent"></textarea>
						<button id="comment-btn" >댓글쓰기</button>
					</div>
				</div>
				</c:if>
				<div class="comments">
				<c:forEach items="${commentList}" var="co">
					<div class="comment">
						<div class="chead">
							<div class="cname">${co.mname} / ${co.mid}
								<input type="hidden" class="cno" value="${co.cno}">
								<img alt="삭제" src="./image/trash.png" class="commentDelete">
								<!-- <img alt="삭제" src="./image/trash.png" id="commentDelete"> 
								ID는 유일객체이기 때문에 여러개에 동시에 적용시키기에는 제한됨 -->
								<img alt="수정" src="./image/edit.png" class="commentUpdate">
							</div>
							<div class="cdate"> ${co.cdate}</div>
						</div>
						<div class="ccomment">${co.comment}</div>
					</div>
				</c:forEach>
				</div>
				<article>
				<button onclick="url('./board?page=${param.page}')">뒤로</button>
				</article>
			</article>
		</div>
	</div>
	<script type="text/javascript">
		function del() {
			//alert(삭제를 눌렀습니다.);
			var ch = confirm("글을 삭제하시겠습니까?");
			if(ch){
				location.href="./delete?no=${detail.no}";
			}
		}
		function edit() {
			var ch = confirm("글을 수정하시겠습니까?");
			if(ch){
				location.href="./edit?no=${detail.no}";
			}
		}
		function commentDel(cno) {
			var ch = confirm("삭제하시겠습니까?");
			if(ch){
				location.href="./commentDel?no=${detail.no}&cno="+cno;
			}
		}
		function commentEdit(cno) {
			var ch = confirm("수정하시겠습니까?");
			if(ch){
				location.href="./commentEdit?no=${detail.no}&cno="+cno;
			}
		}
	</script>
		<footer>
	<c:import url="footer.jsp"/>
	</footer>
</body>
</html>