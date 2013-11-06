<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:fb="http://ogp.me/ns/fb#">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공연 정보 - ${perForInfo.title}</title>
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

 <div id="fb-root"></div>
      <script>
        window.fbAsyncInit = function() {
			
			//초기화
			FB.init({
				appId      : '542875349069066', // App ID
				//channelUrl : '//127.0.0.1:8020/rotuebook_html5/WebContent/testCase//FB_channel.html', // Channel File
				status     : true, // check login status
				cookie     : true, // enable cookies to allow the server to access the session
				xfbml      : true  // parse XFBML
			});
			
			// Additional initialization code here
			/*
			FB.ui({ method: 'feed', 
			  message: 'Facebook for Websites is super-cool'
			 });
			*/
			
			//페이지 로드 했을시 호출 
			FB.getLoginStatus(function(response) {
				if (response.status === 'connected') {
					
					FB.api('/me', function(user) {
						if (user) {
							console.log(user.name);
			
							var image = document.getElementById('image');
							image.src = 'http://graph.facebook.com/' + user.id + '/picture';
							var name = document.getElementById('name');
							name.innerHTML = user.name
							var id = document.getElementById('id');
							id.innerHTML = user.id

						}
					});	
					var uid = response.authResponse.userID;
					var accessToken = response.authResponse.accessToken;
					 console.log(accessToken);
					 
				} else if (response.status === 'not_authorized') {
					// the user is logged in to Facebook, 
					// but has not authenticated your app
				} else {
					// the user isn't logged in to Facebook.
				}
			});
			
			//로그인 되는 순간 호출
			FB.Event.subscribe('auth.login', function(response) {
				alert("로그인 되는 순간 호출");
				document.location.reload();
			});
			//로그아웃 되는 순간 호출
			FB.Event.subscribe('auth.logout', function(response) {
				alert("로그아웃 되는 순간 호출");
				document.location.reload();
			});
 			
			/*
			FB.login(function(response) {
				if (response.authResponse) {
					console.log('Welcome!  Fetching your information.... ');
					FB.api('/me', function(response) {
						console.log('Good to see you, ' + response.name + '.');
					});
				} else {
					console.log('User cancelled login or did not fully authorize.');
				}
			});
			*/	  
        };
		
		//Feed백에 글남기는 method
		function postToFeed (){
			// calling the API ...
			var obj = {
				method: 'feed',
				link: 'http://hijigoo.cafe24.com/BLOG/FB_finish.html',
				picture: 'http://fbrell.com/f8.jpg',
				name: 'name',
				caption: 'caption',
				description: 'description'
			};
			
			function callback(response) {
				alert("callback Fn");;
			}
			
			FB.ui(obj, callback);
		};
		
        // Load the SDK Asynchronously
        (function(d){
           var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
           if (d.getElementById(id)) {return;}
           js = d.createElement('script'); js.id = id; js.async = true;
           js.src = "//connect.facebook.net/ko_KR/all.js";
           ref.parentNode.insertBefore(js, ref);
         }(document));
		 //end Load the SDK Asynchronously
		 
      </script>

</head>
<body onload="myLocation()">
	<input type="hidden" name="latitute" value="${place.gpsY}">
	<input type="hidden" name="longitute" value="${place.gpsX}">
	<input type="hidden" name="id" value="${place.culName}">
	
<table align="center" width="900px" cellpadding="0" cellspacing="1">

	<tr>
		<th colspan="3" align="center"><h2><font face="MD아롱체" >&#9829;&nbsp;&nbsp; ${perForInfo.title} &nbsp;&nbsp;&#9829;</font></h2>
		<hr size="3" color = "black"><br><br></th>
	</tr>
	
	<tr> 
		<td width="300" rowspan=10"><img src="${perForInfo.imgUrl}" style="width:300px; height:450px"></td>
	</tr>
	
	<tr>
		<td width="150"><img src="resources/images/date.png" ></td> 
		<td width="300"><h3><font face="MD아롱체" >${perForInfo.startDate} ~ ${perForInfo.endDate}</font></h3></td>
	</tr>
	<tr>
		<td><img src="resources/images/loca.png" ></td>  
		<td><h3> <font face="MD아롱체" > ${perForInfo.place}</font></h3></td>
	</tr>
	<tr>
		<td><img src="resources/images/genre.png" ></td> 
		 <td><h3><font face="MD아롱체" >  ${perForInfo.realmName}</font></h3></td>
	</tr>
	<tr>
		<td><img src="resources/images/price.png" ></td> 
		 <td><h3><font face="MD아롱체" >  ${perForInfo.price}</font> </h3> </td>
	</tr>
	<tr>
		<td><img src="resources/images/call.png" ></td>  
		<td><h3> <font face="MD아롱체" >${perForInfo.phone}</font></h3></td>
	</tr>
	
	
	<tr>
			<td><img src="resources/images/dis.png"> </td>  
			
			<c:if test="${perForInfo.discountRate != ''}">
				<td><h3> <font face="MD아롱체" >Discount</font></h3></td>
			</c:if>
			
			<c:if test="${perForInfo.discountRate == ''}">
				<td><h3> <font face="MD아롱체" >Not</font></h3></td>
			</c:if>
	</tr>

	<c:if test="${perForInfo.discountRate != ''}">
		<tr>
			<td><img src="resources/images/disrate.png"> </td>  
			<td><h3> <font face="MD아롱체" >${perForInfo.discountRate}%</font></h3></td>
		</tr>
		
		<tr>
			<td><img src="resources/images/print.png"> </td>  
			<td><h4> <font face="MD아롱체" ><a href="${perForInfo.ticketImg}">할인쿠폰다운</a></font></h4></td>
		</tr>
			
		<tr>
			<td colspan="3" align ="center"><br><br><hr size="3" color = "black"></td>
		</tr>
		
	</c:if>
	</table>
	
	<table width="900px" align="center" cellspacing="15" cellpadding="0">
		<tr> 
			<td width="350" > </td>
			
			<td width="30"><a
				href="http://www.facebook.com/sharer.php?u='${url}' }"
				target="_blank"> <img src="resources/images/facebook.png"
					style="width: 30px; height: 30px"></a></td>
			<td width="30"><a
				href="https://twitter.com/intent/tweet?source=webclient&text='${perForInfo.title} ${url }'"
				target="_blank"> <img src="resources/images/twitter.png"
					style="width: 30px; height: 30px"></a></td>

			<td width="30"><a
				href="https://www.google.com/bookmarks/mark?op=add&amp;bkmk='${url }'&amp;title='${perForInfo.title }'"
				target="_blank"> <img src="resources/images/google.png"
					style="width: 30px; height: 30px"></a></td>

			<td width="30"><a
				href="http://me2day.net/posts/new?new_post%5bbody%5d='${perForInfo.title} ${url }'"
				target="_blank"> <img src="resources/images/me2day.png"
					style="width: 30px; height: 30px"></a></td>
			<td width="120"> </td>
			<td height="20"> <a href="list.do"><img src="resources/images/main.png"></a></td>
		</tr>
	</table>

	<table  align="center" style="width:900px" cellpadding="0" cellspacing="1" >
		<th  colspan="3" > <hr size="3" color = "black">
		</th>  
		
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
	<table  align="center" style="width:900px" cellpadding="0" cellspacing="1" >
	<tr>
		<td>
		<p>리뷰</p>
    <fb:comments href="http://www.xpressengine.com/freeboard/${seq}" num_posts="4" width="900px"></fb:comments><br>
		</td>
		</tr>
		</table>
	</body>
</html>
	
