<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta charset="utf-8">
  <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <link rel="stylesheet" href="https://d10ajoocuyu32n.cloudfront.net/mobile/1.3.1/jquery.mobile-1.3.1.min.css">
  
  <!-- Extra Codiqa features -->
  <link rel="stylesheet" href="codiqa.ext.css">
  
  <!-- jQuery and jQuery Mobile -->
  <script src="https://d10ajoocuyu32n.cloudfront.net/jquery-1.9.1.min.js"></script>
  <script src="https://d10ajoocuyu32n.cloudfront.net/mobile/1.3.1/jquery.mobile-1.3.1.min.js"></script>

  <!-- Extra Codiqa features -->
  <script src="https://d10ajoocuyu32n.cloudfront.net/codiqa.ext.js"></script>
<title>m - 공연 정보 - ${perForInfo.title}</title>


<script type="text/javascript" src="resources/js/jquery-1.10.2.js"></script>


</head>
<body onload="initialize()">
	<input type="hidden" name="latitute" value="${place.gpsY}">
	<input type="hidden" name="longitute" value="${place.gpsX}">
	<input type="hidden" name="id" value="${place.culName}">
	
	
	<div data-role="page" id="page1">
    <div data-theme="a" data-role="header">
        <h3>
            The Show
        </h3>
    </div>
    <div data-role="content">
        <div data-role="fieldcontain">
            <label for="textarea1">
                ${perForInfo.title}
            </label>
        </div>
        <div style="position: relative; background-color: #fbfbfb; border: 1px solid #b8b8b8;">
         
           <img src="${perForInfo.imgUrl}" style="width: 90%; height: 60%"float="left">
   
   
      <img src="resources/images/date.png" ><br/><font face="휴먼매직체" > &#10;${perForInfo.startDate}&#09; ~ &#09;${perForInfo.endDate}</font><br/>
      <img src="resources/images/loca.png" ><br/><font face="휴먼매직체" > &#10;${perForInfo.place}</font><br/>
      <img src="resources/images/genre.png" ><br/><font face="휴먼매직체" >  &#10;${perForInfo.realmName}</font><br/>
      <img src="resources/images/price.png" ><br/><font face="휴먼매직체" >  &#10;${perForInfo.price}</font><br/>
      <img src="resources/images/call.png" ><br/><font face="휴먼매직체" > &#10;${perForInfo.phone}</font><br/>
      <img src="resources/images/dis.png"><br/>
      <c:if test="${perForInfo.discountRate != ''}">
         <font face="휴먼매직체" >&#10;Discount</font><br/>
      </c:if>
      <c:if test="${perForInfo.discountRate == ''}">
         <font face="휴먼매직체" >&#10;Not</font><br/>      
      </c:if>
      <c:if test="${perForInfo.discountRate != ''}">
         <img src="resources/images/disrate.png"><br/><font face="휴먼매직체" >&#10;${perForInfo.discountRate}%</font><br/>
         <img src="resources/images/print.png"><br/><font face="휴먼매직체" ><a href="${perForInfo.ticketImg}">&#10;할인쿠폰다운</a></font><br/>
      </c:if>
      
      
        </div>
      
        <img src="https://maps.googleapis.com/maps/api/staticmap?center=(${place.gpsY},${place.gpsX})&amp;zoom=18&amp;size=288x200&amp;markers=(${place.gpsY},${place.gpsX})&amp;sensor=false"
        width="288" height="200">
        
    </div>
</div>



	</body>
</html>

	
