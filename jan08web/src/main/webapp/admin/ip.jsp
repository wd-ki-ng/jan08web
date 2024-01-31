<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 댓글관리</title>
<link href="../css/admin.css?ver=0.19" rel="stylesheet"/>
<link href="../css/ip.css" rel="stylesheet"/>
<script type="text/javascript" src="../js/menu.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
  <!-- Google Charts 라이브러리 로드 -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['ip', '접속수'],
          <c:forEach items="${list2 }" var="row">
          ['${row.iip}', ${row.count}],
          </c:forEach>
        ]);

        var options = {
          title: '가장 최근 접속한 IP 10개'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }

</script>
</head>
<body>
	<div class="wrap">
		<!-- menu -->
		<%@ include file="menu.jsp" %>
		<div class="main">
			<article>
				<h2>IP관리</h2>
				<div class="border1">
				0. 중복없이 IP리스트 뽑기
				1. 최다 접속 ip 5개 출력 -> 접속수
				2. 그래프 그리기 - 구글차트 - ip당 접속 건수 - 10개
				</div>
				<div>
				<table>
					<thead>
						<tr>
							<th>IP</th>
							<th>접속 횟수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list2 }" var="row1">
							<tr class="row1">
								<td class="d1" >${row1.iip }</td>
								<td class="d1" >${row1.count }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- 그래프로 그리기 -->
				</div>
  				<div id="piechart" style="width: 900px; height: 500px;"></div>

				<div class="nav-lists">
					<ul class="nav-lists-group">
						<li class="nav-lists-item" onclick="url('./ip?del=1')"><i class="xi-close-circle-o"></i> 보임</li>					
						<li class="nav-lists-item" onclick="url('./ip?del=0')"><i class="xi-close-circle-o"></i> 숨김</li>					
					</ul>
					<div class="search">
						<input type="text" id="search">
						<button id="searchBtn">검색</button>
					</div>
				</div>
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>IP</th>
							<th>접속일자</th>
							<th>URL</th>
							<th>기타</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="row">
							<tr class="row">
								<td class="d1">${row.ipno }</td>
								<td class="d2">${row.iip }</td>
								<td class="d1">${row.idate }</td>
								<td class="d2">${row.iurl }</td>
								<td class="d2">${row.idata }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</article>
		</div>
	</div>
</body>
</html>