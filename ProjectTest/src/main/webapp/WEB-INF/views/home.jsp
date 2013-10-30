<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<form action="/test/test.do" method="post">
<input name="search" type="text">
<input type="submit" value="Search">
<p></p>
<c:forEach var="perForList" items="${perForList}">
	<table align="left">
		<tr>
			<td align="center"><img src="${perForList.thumbnail}" style="width:300px; height:300px; float:left;" align="middle"></td>
		</tr>
		<tr>
			 <td align="center"><a href="/test/testTicket.do?ticket=${perForList.title}">${perForList.title}</td>
		</tr>
		<tr>
	
			 <td align="center"><a href="/test/testPlace.do?place=${perForList.place}">${perForList.place}</td>
		</tr>	 
	</table>
<%-- 	${perForList.seq}<br> --%>
<%-- 	${perForList.title}<br> --%>
<%-- 	${perForList.startDate}<br> --%>
<%-- 	${perForList.endDate}<br> --%>
<%-- 	${perForList.place}<br> --%>
<%-- 	${perForList.realmName}<br> --%>
<%-- 	<img src="${perForList.thumbnail}"><br><br> --%>
<%-- 	${perForList.thumbnail}<br><br> --%>
</c:forEach>
</form>
</body>
</html>
