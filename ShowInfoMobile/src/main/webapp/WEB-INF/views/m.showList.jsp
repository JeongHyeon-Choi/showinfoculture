<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<title>m - 공연 목록</title>

<script type="text/javascript" src="resources/js/jquery-1.10.2.js">
	//해당 소스 안머금. 왜지?
	var this_url = document.location.href;
	$(document).ready(function() {
		alert(this_url);
		$('#selectmenu').change(function() {
			if ($("#selectmenu option:selected").val() != '') {
				location.href = $("#gourl option:selected").val();
			}

		});
		
		
	});
</script>

<link rel="stylesheet"
	href="https://d10ajoocuyu32n.cloudfront.net/mobile/1.3.1/jquery.mobile-1.3.1.min.css">

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
						<option value="1">전체보기</option>
						<option
							value="http://220.76.235.230:8080/show/catShow.do?catVal=B000">
							음악</option>
						<option
							value="http://220.76.235.230:8080/show/catShow.do?catVal=A000">
							연극/뮤지컬</option>
						<option
							value="http://220.76.235.230:8080/show/catShow.do?catVal=L000">
							전시</option>
						<option
							value="http://220.76.235.230:8080/show/catShow.do?catVal=D000">
							미술</option>
						<option
							value="http://220.76.235.230:8080/show/catShow.do?catVal=C000">
							무용</option>
						<option value="http://220.76.235.230:8080/show/discountList.do">
							할인공연</option>
					</select>
				</div>
				<div data-role="fieldcontain" align="center">
					<input name="search" type="text"
						style="border: #870073 4px solid; font-size: 20px; font-family: MD아롱체 font-weight : bold; padding: 10 0 0 0; margin: 0 0 0 0;">
				</div>
			</div>
			<div data-role="content">
				<c:forEach var="perForList" items="${perForList}">
					<c:if test="${perForList.count == 0}">
							공연 목록을 찾을 수 없습니다
						</c:if>
					<div
						style="position: relative; background-color: #fbfbfb; border: 1px solid #b8b8b8;"
						align="center">
						<a
							href="/show/read.do?seq=${perForList.seq}&place=${perForList.place}&title=${perForList.title}">
							<c:if test="${perForList.thumbnail==null}">no image</c:if> <c:if
								test="${perForList.thumbnail!=null}">
								<img src="${perForList.thumbnail}"
									style="width: 90%; height: 60%" float="left">
							</c:if>


						</a> <br> <a
							href="/show/read.do?seq=${perForList.seq}&place=${perForList.place}&title=${perForList.title}">${perForList.title}</a>
						<br>${perForList.place}
					</div>
				</c:forEach>
				<div align="center">${pageCode}</div>
			</div>
			<div align="center">
				<a href="/show/list.do?pc=pc">PC버전으로 보기</a>
			</div>
		</div>
	</form>

</body>
</html>

