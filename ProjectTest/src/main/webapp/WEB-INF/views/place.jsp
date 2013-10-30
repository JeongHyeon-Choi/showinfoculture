<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>place</title>
<style type="text/css">
html {
	height: 100%
}

body {
	height: 100%;
	margin: 0px;
	padding: 0px
}

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
	
	//초기 실행 함수

	function initialize(coords) {
		
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

// 		alert(lat + ":" + lng + ":" + name);
	
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
		addMarker(latlng); //마커출력
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
</script>
</head>

<body onload="myLocation()">
	<c:if test="${place != null}">
	<input type="hidden" name="latitute" value="${place.gpsY}">
	<input type="hidden" name="longitute" value="${place.gpsX}">
	<input type="hidden" name="id" value="${place.culName}">

	<table width="500" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="500" height="500"><div id="map_canvas"
					style="width: 100%; height: 100%"></div></td>
		</tr>
	</table>
</c:if>


	<c:if test="${place == null}">
		<p>공연장 정보가 없습니다.</p>
	</c:if>

	<table align="left">
		<tr>
			<td align="center">${place.seq}</td>
		</tr>
		<tr>
			<td align="center">${place.culName}</td>
		</tr>
		<tr>
			<td align="center">${place.culGrpName}</td>
		</tr>
		<tr>
			<td align="center">${place.culTel}</td>
		</tr>
		<tr>
			<td align="center">${place.culHomeUrl}</td>
		</tr>
		<tr>
			<td align="center">${place.gpsX}</td>
		</tr>
		<tr>
			<td align="center">${place.gpsY}</td>
		</tr>


	</table>
</body>
</html>