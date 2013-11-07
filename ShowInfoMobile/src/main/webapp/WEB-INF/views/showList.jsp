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
		background: #9354ED top left repeat;
		-webkit-border-radius: 4px;
		-moz-border-radius: 4px;
		border-radius: 4px;
		border: 1px solid #9354ED;
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
		padding: 20px 20px;
		display: block;
		text-decoration: none;
		font:15px "MD아롱체";
		color: #ffffff;
		text-shadow: 0 -1px 1px #586835;
		border-right: 1px solid #839b4e;
	}
	#container a:hover {
		color: #ffffff;
		text-shadow: 0 1px 1px #bdcd9c;
	}
	#container li {
		float: left;
		border-right: 1px solid #b2c58b;
	}
	#container li:hover {
		background: #F361DC top left repeat;
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
	<table align="center" valign="middle" cellpadding="0" cellspacing="1">
	<tr align="center" valign="middle">
	<td colspan="3">
		<h1><a href="/show/list.do"><img width="600" height="80" src="resources/images/mainlogo.png" /></a></h1>
	</td>
	</tr>

	<tr align="center" valign="middle">
	<td >
		<form action="/show/search.do" method="post">

		<input name="search" type="text" style="border: #870073 4px solid;  cursor:pointer; height:40px; width:350px;  font-size:20px; font-family:MD아롱체; font-weight:bold; padding:10 0 0 0; margin:0 0 0 0;" > 

	</td> 
	
	<td>
		<input type="submit" value="Search" style="background: url(resources/images/searchbutton.png) no-repeat; cursor:hand; height: 60px;  width: 100px; text-indent: -1000em; border: 0px; padding:0 0 0 0; margin:0 0 0 0; " >
	</td>
	

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
		 <li><a href="/show/discountList.do"><span>Special Offers</span></a></li>
		 <li><a href='#'><span>Best Shows</span></a></li>
		 <li><a href='#'>Best Reviews</a>
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
				 <td align="center" width="230px" height="60px" font="MD아롱체" font-size="8px">
				 <a href="/show/read.do?seq=${perForList.seq}&place=${perForList.place}&title=${perForList.title}">${perForList.title}</a></td>
			</tr>
			<tr>
				 <td align="center" width="230px" height="60px" font="MD아롱체" font-size="10px">${perForList.place}</td>
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
