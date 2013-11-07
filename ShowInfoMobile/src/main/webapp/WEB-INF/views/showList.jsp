<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<title>공연 목록</title>

<style type="text/css">
	#header{position:relative; width:auto;}
		h1{width: auto; font:bold 30px "Castellar"; Color:#5D5D5D; text-align:center;}
#cssmenu ul {
  list-style-type: none;
  width: 943px;
  position: relative;
  display: block;
  height: 33px;
  font-size: 18px;
  background: url(resources/images/bg.png) repeat-x top left;
  font-family: Verdana, Helvetica, Arial, sans-serif;
  border: 1px solid #000;
  margin: 0;
  padding: 0;
}
#cssmenu li {
  display: block;
  float: left;
  margin: 0;
  padding: 0;
}
#cssmenu li a {
  float: left;
  color: #A79787;
  text-decoration: none;
  height: 24px;
  padding: 9px 15px 0;
  font-weight: normal;
}
#cssmenu li a:hover,
#cssmenu .active {
  color: #fff;
  background: url(resources/images/bg.png) repeat-x top left;
  text-decoration: none;
}
#cssmenu .active a {
  color: #fff;
  font-weight: 700;
}
#cssmenu ul {
  background-color: #DC4900;
}
#cssmenu li a:hover,
#cssmenu li.active {
  background-color: #F46D00;
}

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

		<input name="search" type="text" style="border: #870073 4px solid;  cursor:pointer; height:40px; width:350px;  font-size:20px; font-family:돋움, Dotum; font-weight:bold; padding:10 0 0 0; margin:0 0 0 0;" > 

	</td> 
	
	<td>
		<input type="submit" value="Search" style="background: url(resources/images/searchbutton.png) no-repeat; cursor:hand; height: 60px;  width: 100px; text-indent: -1000em; border: 0px; padding:0 0 0 0; margin:0 0 0 0; " >
	</td>
	

		</tr>
	</table>
	<div id='cssmenu'>
	<table width="1000px" align="center">
	<tr>
	<td>
<ul>
   <li style="width:18%; text-align: center;" class='active'><a href='/show/list.do'><span>All Category</span></a></li>
   <li style="width:10%; text-align: center;"><a href='/show/catShow.do?catVal=B000'><span>Music</span></a></li>
   <li style="width:18%; text-align: center;"><a href='/show/catShow.do?catVal=A000'><span>Play/Musical</span></a></li>
   <li style="width:16%; text-align: center;"><a href='/show/catShow.do?catVal=L000'><span>Exhibition</span></a></li>
   <li style="width:9%; text-align: center;"><a href='/show/catShow.do?catVal=D000'><span>Art</span></a></li>
   <li style="width:11%; text-align: center;"><a href='/show/catShow.do?catVal=C000'><span>Dance</span></a></li>
   <li class='last' style="width:18%; text-align: center;"><a href='/show/discountList.do'><span>Special Offers</span></a></li>
</ul>
	</td>
	</tr>
	</table>
	</div>
	<div id="menu">
	<table width="1000px" align="center" style="margin-top: 20px">
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
