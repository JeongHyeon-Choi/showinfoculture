<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${ticket == null}">
		<p>할인 정보가 없습니다.</p>
	</c:if>
	<c:if test="${ticket != null}">
		<table align="left">
			<tr>
				<td align="center">${ticket.seq}</td>
			</tr>
			<tr>
				<td align="center">${ticket.title}</td>
			</tr>
			<tr>
				<td align="center"><img src="${ticket.img}"style="width: 300px; height: 300px; float: left;" align="middle"title="${ticket.imgDesc}"></td>
			</tr>
			<tr>
				<td align="center"><a href="${ticket.ticketImg}">할인 티켓 인쇄</a></td>
			</tr>
			<tr>
				<td align="center">${ticket.price}</td>
			</tr>
			<tr>
				<td align="center">${ticket.startDate}&nbsp;-&nbsp;${ticket.endDate}</td>
			</tr>
			<tr>
				<td align="center">${ticket.place} &nbsp;&nbsp; &lt; ${ticket.area} &gt;</td>
			</tr>
			<tr>
				<td align="center">${ticket.discountRate}% &nbsp;&nbsp; &lt; ${ticket.useCond} &gt;</td>
			</tr>
		</table>
	</c:if>
</body>
</html>