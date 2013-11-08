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
<style type="text/css">
	#map_canvas {
		height: 100%
	}
</style>
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCVvs21MnH8Gz7oCWA3Ql-Qj716oBXeWX0&sensor=true">	
</script>
<script type="text/javascript" src="resources/js/jquery-1.10.2.js"></script>
<script type="text/javascript">

	var map;
	var markersArray = [];
	var infowindow = new google.maps.InfoWindow();

	var addmap = '<td id="how" colspan="3" align="center" width="600px" height="450px">'+
	'<c:if test="${place != null}">'+
	'<div id="map_canvas" style="width: 100%; height: 100%"></div>'+
	'</c:if> <c:if test="${place == null}">'+
	'<div id="no_how" >공연장 정보가 없습니다.</div></c:if></td>';
	
	//초기 실행 함수
	function initialize() {
		
		var lat;
		var lng;
		var my_latlng;
		var name;
	
		lat = $("input[name=latitute]").eq(0).val();
		lng = $("input[name=longitute]").eq(0).val();
		name = $("input[name=id]").eq(0).val();
		
		my_latlng = new google.maps.LatLng(lat, lng);
		
		var mapOptions = {
			zoom : 18,
			center : my_latlng,
			streetViewControl : true,
			mapTypeControl : true,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		}		
		map = new google.maps.Map(document.getElementById('map_canvas'),mapOptions);
	
	//		alert(lat + ":" + lng + ":" + name);
	
		addMarker(my_latlng, name);
	}
	
	//지도에 마커출력
	function addMarker(latlng, name) {
		marker = new google.maps.Marker({
			position : latlng,
			map : map
		});
	
		//지도에 출력된 마커를 클릭했을 경우 이벤트(infoWindow 출력)
		google.maps.event.addListener(marker, 'click', function(event) {
			popInfoWindow(latlng, name);
		});
	}
	
	// infoWindow 출력
	function popInfoWindow(latlng, name) {
		var geocoder = new google.maps.Geocoder();
		map.setCenter(latlng);
		addMarker(latlng, name); //마커출력
		geocoder.geocode({
			'latLng' : latlng
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				if (results[1]) {
					var contentString = '<div id="content">'
							+ '<br><div id=="adress">' + '<b>' + name + '</b>'
							+ '<br></div>' + '<p>' + '<b>주소 :</b> '
							+ results[1].formatted_address + '</p>' + '</div>';
					infowindow.setContent(contentString);
					infowindow.open(map, marker);
				} else {
					alert("No results found");
				}
			} else {
				alert("Geocoder failed due to: " + status);
			}
		});
	}
	
	function myLocation() {
		/* 객체가 존재하면 */
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(successHandler,
					errorHandler);
		} else {
			alert("not support geolocation");
		}
	}
	
	/* 위치정보를 가져오는 사용자정의 핸들러함수 */
	function successHandler(position) {
		initialize(position.coords);
	}
	
	/* 실패한 경우 */
	function errorHandler(error) {
		var errorCode = error.code;
		var errorMessage = error.message;
	
		var loc = document.getElementById("location");
		loc.innerHTML = "실패 : " + errorCode + " / " + errorMessage;
	}
	
	function how() {
		$('tr[id=about]').hide();
		$("tr[id=map]").children().remove();
		$(addmap).appendTo("tr[id=map]");
		initialize();
	}

	function about() {
		$('tr[id=about]').show();
		$("tr[id=map]").children().remove();
	}
	function start() {
		about();
	}
</script>

</head>
<body onload="myLocation()">
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
            <textarea name="Title" id="textarea1" placeholder=""></textarea>
        </div>
        <div style="width: 288px; height: 100px; position: relative; background-color: #fbfbfb; border: 1px solid #b8b8b8;">
           <img src="${perForInfo.imgUrl}" style="width: 90%; height: 80%"float="left">
        </div>
        <img src="https://maps.googleapis.com/maps/api/staticmap?center=(${place.gpsX}, ${place.gpsY})&amp;zoom=14&amp;size=288x200&amp;markers=(${place.gpsX},${place.gpsY}), WI&amp;sensor=false"
        width="288" height="200">
    </div>
</div>



	
<table align="center" style="width:900px" cellpadding="0" cellspacing="1">

	<tr>
		<th colspan="3" align="center"><h2><font face="휴먼매직체" >&#9829;&nbsp;&nbsp; ${perForInfo.title} &nbsp;&nbsp;&#9829;</font></h2>
		<hr size="3" color = "black"><br><br></th>
	</tr>
	
	<tr> 
		<td width="300" rowspan="9"><img src="${perForInfo.imgUrl}" style="width:300px; height:450px"></td>
	</tr>
	
	<tr>
		<td width="150"><img src="resources/images/date.png" ></td> 
		<td width="300"><h3><font face="휴먼매직체" >${perForInfo.startDate} ~ ${perForInfo.endDate}</font></h3></td>
	</tr>
	<tr>
		<td><img src="resources/images/loca.png" ></td>  
		<td><h3> <font face="휴먼매직체" > ${perForInfo.place}</font></h3></td>
	</tr>
	<tr>
		<td><img src="resources/images/genre.png" ></td> 
		 <td><h3><font face="휴먼매직체" >  ${perForInfo.realmName}</font></h3></td>
	</tr>
	<tr>
		<td><img src="resources/images/price.png" ></td> 
		 <td><h3><font face="휴먼매직체" >  ${perForInfo.price}</font> </h3> </td>
	</tr>
	<tr>
		<td><img src="resources/images/call.png" ></td>  
		<td><h3> <font face="휴먼매직체" >${perForInfo.phone}</font></h3></td>
	</tr>
	
	
		<tr>
			<td><img src="resources/images/dis.png"> </td>  
			<c:if test="${perForInfo.discountRate != ''}">
				<td><h3> <font face="휴먼매직체" >Discount</font></h3></td>
			</c:if>
			
			<c:if test="${perForInfo.discountRate == ''}">
				<td><h3> <font face="휴먼매직체" >Not</font></h3></td>
			</c:if>
		</tr>

	<c:if test="${perForInfo.discountRate != ''}">
		<tr>
			<td><img src="resources/images/disrate.png"> </td>  
			<td><h3> <font face="휴먼매직체" >${perForInfo.discountRate}%</font></h3></td>
		</tr>
		
		<tr>
			<td><img src="resources/images/print.png"> </td>  
			<td><h4> <font face="휴먼매직체" ><a href="${perForInfo.ticketImg}">할인쿠폰다운</a></font></h4></td>
		</tr>
			
		<tr>
			<td colspan="3" align ="center"><br><br><hr size="3" color = "black"></td>
		</tr>
	</c:if>
	</table>
	<table width="1000" align="center" cellspacing="30">
		<tr>
			<td><img src="resources/images/about.png" onclick="about()" style="cursor:pointer;"></td>
			<td><img src="resources/images/how.png" onclick="how()" style="cursor:pointer;"></td>
			<td><a href="${perForInfo.bookUrl}" target=_blank><img
					src="resources/images/buy.png"></a></td>
		</tr>
		<tr id="about">
			<td colspan="3" align="center">${perForInfo.contents1}</td>
		</tr>
		<tr id="map"></tr>
	</table>
	</body>
</html>

	
