<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>m - 할인 목록</title>
<meta charset="utf-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<link rel="stylesheet"
	href="https://d10ajoocuyu32n.cloudfront.net/mobile/1.3.1/jquery.mobile-1.3.1.min.css">

<!-- Extra Codiqa features -->
<!-- <link rel="stylesheet" href="codiqa.ext.css"> -->

<!-- jQuery and jQuery Mobile -->
<script src="https://d10ajoocuyu32n.cloudfront.net/jquery-1.9.1.min.js"></script>
<script
	src="https://d10ajoocuyu32n.cloudfront.net/mobile/1.3.1/jquery.mobile-1.3.1.min.js"></script>

<!-- Extra Codiqa features -->
<script src="https://d10ajoocuyu32n.cloudfront.net/codiqa.ext.js"></script>


</head>
<body>
	<form action="/show/search.do" method="post">
		<div data-role="page" id="page1">
			<div data-theme="a" data-role="header">
				<h3>The Show</h3>
				<div aldata-role="fieldcontain" align="center">
					<select id="selectmenu" name="" data-mini="true"
						onchange="location.href=this.value">
						<option value="1">All Category</option>
						<option
							value="http://220.76.235.230:8080/show/catShow.do?catVal=B000">
							Music</option>
						<option
							value="http://220.76.235.230:8080/show/catShow.do?catVal=A000">
							Play/Musical</option>
						<option
							value="http://220.76.235.230:8080/show/catShow.do?catVal=L000">
							Exhibition</option>
						<option
							value="http://220.76.235.230:8080/show/catShow.do?catVal=D000">
							Art</option>
						<option
							value="http://220.76.235.230:8080/show/catShow.do?catVal=C000">
							Dance</option>
						<option value="http://220.76.235.230:8080/show/discountList.do">
							Special Offers</option>
					</select>
				</div>
				<div data-role="fieldcontain" align="center">
					<input name="search" type="text"
						style="border: #870073 4px solid; font-size: 20px; font-family: MD아롱체 font-weight : bold; padding: 10 0 0 0; margin: 0 0 0 0;">
				</div>
			</div>
			<div data-role="content">
				<c:forEach var="discountList" items="${discountList}">
					<c:if test="${discountList.count == 0}">
							공연 목록을 찾을 수 없습니다
						</c:if>
					<div
						style="position: relative; background-color: #fbfbfb; border: 1px solid #b8b8b8;"
						align="center">
						<a
							href="/show/discountRead.do?title=${discountList.title}&place=${discountList.place}">
							<img src="${discountList.img}" style="width: 90%; height: 60%"
							float="left">
						</a> <br> <a
							href="/show/discountRead.do?title=${discountList.title}&place=${discountList.place}">${discountList.title}</a>
						<br>${discountList.place}
					</div>
				</c:forEach>
				<div align="center">${pageCode}</div>
			</div>
			<div align="center">
				<form action="/show/list.do?pc=1" method="get">
					<input type="submit" value="PC버전으로 보기">
				</form>
			</div>
		</div>
	</form>
</body>
</html>

