<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<nav>
			<ul>
				<li onclick="url('./')">홈</li>
				<li onclick="url('./board')">게시판</li>
				<li onclick="url('./qna')">문의게시판</li>
				<li onclick="url('./notice')">공지사항</li>
				<li onclick="url('./bootstrap')">부트스트랩</li>
				<li onclick="url('./team')">팀</li>
				<li onclick="url('./info')">info</li><c:choose><c:when test="${sessionScope.mname eq null }">
				<li onclick="url('./login')">로그인</li></c:when><c:otherwise>
				<li onclick="url('./myInfo')">${sessionScope.mname }</li>
				<li onclick="url('./logout')">로그아웃</li></c:otherwise></c:choose>
				<%-- 
				<% if(session.getAttribute("mname") == null) { %>
				<li onclick="url('./login')">로그인</li>
				<% } else {%>
				<li onclick="url('./logout')">로그아웃</li>				
				<% } %>
				<li onclick="url('./info')">info</li>
				--%>
			</ul>
		</nav>

