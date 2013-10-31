<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<title>공연 목록</title>

<style type="text/css">
	#header{position:relative; width:auto;}
		h1{width: auto; font:bold 30px "Castellar"; Color:#5D5D5D; text-align:center;}
	#container,
	#container ul,
	#container li #container a {
		list-style: none;
		margin: 0;
		padding: 0;
		border: 0;
		font-size: 18px;
		font-family: Helvetica;
		line-height: 1;
	}
	#container {
		width: auto; height: 100px;
	}
	#container ul {
		zoom: 1;
		background: #a7bc7a top left repeat;
		-webkit-border-radius: 4px;
		-moz-border-radius: 4px;
		border-radius: 4px;
		border: 1px solid #839b4e;
		-moz-box-shadow: 0 3px 3px rgba(0, 0, 0, 0.3);
		-webkit-box-shadow: 0 3px 3px rgba(0, 0, 0, 0.3);
		box-shadow: 0 3px 3px rgba(0, 0, 0, 0.3);
	}
	#container ul:before {
		content: '';
		display: block;
	}
	#container ul:after {
		content: '';
		display: table;
		clear: both;
	}
	#container a,
	#container a:link,
	#container a:visited {
		padding: 15px 20px;
		display: block;
		text-decoration: none;
		color: #ffffff;
		text-shadow: 0 -1px 1px #586835;
		border-right: 1px solid #839b4e;
	}
	#container a:hover {
		color: #586835;
		text-shadow: 0 1px 1px #bdcd9c;
	}
	#container li {
		float: left;
		border-right: 1px solid #b2c58b;
	}
	#container li:hover {
		background: #9cb369 top left repeat;
	}
	#container li:first-child {
		border-left: none;
		-webkit-border-radius: 4px 0 0 4px;
		-moz-border-radius: 4px 0 0 4px;
		border-radius: 4px 0 0 4px;
	}
	#menu {leftmargin:200;}
</style>

</head>
<body>
<div id="header">
	<table align="center">
	<tr>
	<td>
		<h1><a href="/show/list.do"><img src="resources/images/logo.png" /></a></h1>
	</td>

	<td>
		<form action="/show/search.do" method="post">
		<input name="search" type="text" style="border: #407FC2 6px solid; height:60px; width:600px; padding:5px 0 0 7px; background-color:#fff; font-size:15px; font-family:돋움, Dotum; font-weight:bold; margin:5px 0 6px 6px";> 
	</td>
	
	<td>
		<input type="submit" value="Search" style="background: url(resources/images/search.png) no-repeat; width: 150px; height: 70px; padding:5px 0 0 7px; text-indent: -1000em; border: 0px; cursor: pointer; float: left; margin:5px 0 6px 6px"; >
	</td>
	
<!-- 		<input name="search" type="text"  style="border:3 solid #407FC2; width:810px; height:50px; background-color: ; padding-left: 25px; padding-top: 7px; font-size:18px; color: #666; font-weight:bold;  width: 345px; height: 24px; margin-top: 1px; margin-right: 3px; vertical-align: middle;"> -->
	<!-- 	 maxlength="20" size="20" BACKGROUND-COLOR: "#999999" -->
<!-- 		<input type="submit" value="Search"  STYLE="width:100; height:25; cursor:hand; color:black; font-weight:bold">  -->
	<!-- 	 background:url(); --></td>
		</tr>
	</table>
	<div id='container'>
	<table width="1000px" align="center">
	<tr>
	<td>
	<ul>
		 <li><a href="/show/catShow.do?catVal=B000"><span>콘서트/전통</span></a></li>
		 <li><a href="/show/catShow.do?catVal=A000"><span>연극/뮤지컬</span></a></li>
		 <li><a href="/show/catShow.do?catVal=L000"><span>전시/기타</span></a></li>
		 <li><a href="/show/catShow.do?catVal=D000"><span>미술</span></a></li>
		 <li><a href="/show/catShow.do?catVal=C000"><span>무용</span></a></li>
		 <li><a href='/show/discountList.do'><span>Special Offers</span></a></li>
		 <li><a href='#'><span>Best Shows</span></a></li>
		 <li><a href='#'><span>Best Reviews</span></a></li>
	</ul>
	</td>
	</tr>
	</table>
	</div>
	<div id="menu">
	<table width="1000px" align="center">
	<tr>
	<td>
	<c:forEach var="perForList" items="${perForList}">
		<c:if test="${perForList.count == 0}">
			공연 목록을 찾을 수 없습니다
		</c:if>
		<table align="left">
			<tr>
				<td><a href="/show/read.do?seq=${perForList.seq}&place=${perForList.place}&title=${perForList.title}">
				<img src="${perForList.thumbnail}" style="width:230px; height:300px" float="left"></a></td>
			</tr>
			<tr>
				 <td align="center" width="230px" height="60px" font="고딕" font-size="8px">
				 <a href="/show/read.do?seq=${perForList.seq}&place=${perForList.place}&title=${perForList.title}">${perForList.title}</a></td>
			</tr>
			<tr>
				 <td align="center" width="230px" height="60px" font="돋움" font-size="10px">${perForList.place}</td>
			</tr>	 
		</table>
	</c:forEach>
	</td>
	</tr>
	<tr align="center">
	<td>
	${pageCode}
	</td>
	</tr>
	</table>
	</div>
</body>
</html>
