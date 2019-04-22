<%@page import="org.tom.domain.PointVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
static Logger logger = Logger.getLogger("map.jsp");
%>
<%
	logger.debug("[Page Load...] : map.jsp");
	if(session.getAttribute("logined")!=null && session.getAttribute("logined").equals("true")){
		String user_index = session.getAttribute("user_index").toString();
		pageContext.setAttribute("userLogined", "true");
		pageContext.setAttribute("user_index", user_index);
		logger.debug("user_index : "+user_index+" is logined : "+session.getAttribute("logined").toString());
	}
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Map</title>
<style>
	#page{ padding: 5px; width: auto; margin: 20px auto;}
	#header{ height: 50px; margin: 0px;}
	#main{ padding-bottom: 50px; padding-top: 100px; width: 100%; height: auto; float: left; margin-top: 30px; }
	#footer{ padding: 0px; clear: both; margin: 0px;}			
	
	@media screen and(max-width: 980px){
		#page { width: 94%;} 
		#main { width: 65%;}
		#sidebar1 { width: 30%;}} #sidebar2 { width: 30%;}}
		
	@media screen and(max-width: 700px){
		#main { width: auto; float: none;}
		#sidebar1 { width: auto; float: none;}}	 #sidebar2 { width: auto; float: none;}}	
		
	@media screen and(max-width: 480px){
		#header{ height: auto;} 
		h2 { font-size: 24px;}
		#sidebar1 { display: none;}} #sidebar2 { display: none;}}
	
	#header, #main, #sidebar1, #footer{ border: solid 2px gray;}
	
	#header{background-color: white;}	
	#sidebar1{background-color: green;}	#sidebar2{background-color: green;}	
	#main{background-color: #B1EFFF;}	
	#footer{background-color: #24BDFF;}	
	
	#reldiv {
		vertical-align: middle;
		position: relative;
		display: inline-block;
		border: 3px solid black; 
		margin-left: 100px;
	}
	
</style>
<link rel="stylesheet" href="/css/bootstrap.css">
<script src="https://maps.googleapis.com/maps/api/js"></script>
<!-- 
https://console.developers.google.com/google/maps-apis/apis/maps-backend.googleapis.com/credentials?project=vigilant-router-235605&duration=PT1H
키 제한 수정하기
 -->
 
<script>
var map;
var LatLng;
var marker = new Array();
function initialize() {
	
	LatLng = new google.maps.LatLng('${pointList.get(1).getPoint_latitude()}','${pointList.get(1).getPoint_longitude()}');
	var mapProp = {
			center: LatLng,
			zoom:15,
			mapTypeId:google.maps.MapTypeId.ROADMAP
	};
	map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
	for(var i = 0; i < '${pointList.size()}' ; i++){
		marker.push = new google.maps.Marker({
			position: new google.maps.LatLng(document.getElementsByName('data')[i].point_latitude.value ,document.getElementsByName('data')[i].point_longitude.value ),
			title: i+"",
			map: map
		});
	}
	
	google.maps.event.addListener(marker, "click", function() {
		setData(marker.getTitle());
    });
}
google.maps.event.addDomListener(window,'load',initialize);

function setData(i){
	document.reldiv.point_index.value = 1111;
	document.reldiv.point_name.value = document.getElementsByName('data')[i].point_name.value;
	document.reldiv.point_address.value = document.getElementsByName('data')[i].point_address.value;
	document.reldiv.point_latitude.value = document.getElementsByName('data')[i].point_latitude.value;
	document.reldiv.point_longitude.value = document.getElementsByName('data')[i].point_longitude.value;
}
</script>
</head>
<body>
<div id="page">
<!---------------------------------- 상단바---------------------------------->
	<%@ include file="/bar/memberHeader.jsp"%>

<!--------------------------------관리자 답글 테이블-------------------------------------->
	<div id="main">
		<div id="reldiv" style="width: 100rem; height: 70rem">
			<div id="googleMap" style="width: 99rem; height: 69rem"></div>
		</div>
		<div id="reldiv" style="width: 50rem; height: 50rem">	
			<table class="table">
				<tr>
					<th>No</th>
					<td id="point_index"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td id="point_name"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td id="point_address"></td>
				</tr>
				<tr>
					<th>리셋날짜</th>
					<td> 20190409 </td>
				</tr>
				<tr>
					<th>위도</th>
					<td id="point_latitude"></td>
				</tr>
				<tr>
					<th>경도</th>
					<td id="point_longitude"></td>
				</tr>
			</table>
		</div>
	</div>
<!----------------------------------좌표---------------------------------->
<div id="info">
	<c:forEach items="${pointList}" varStatus="status">
		<form name="data">
			<input type="hidden" name="point_index" value="${pointList.get(status.index).getPoint_index()}">
			<input type="hidden" name="point_name" value="${pointList.get(status.index).getPoint_name()}">
			<input type="hidden" name="point_address" value="${pointList.get(status.index).getPoint_address()}">
			<input type="hidden" name="point_latitude" value="${pointList.get(status.index).getPoint_latitude()}">
			<input type="hidden" name="point_longitude" value="${pointList.get(status.index).getPoint_longitude()}">
		</form>
	</c:forEach>
</div>
<!----------------------------------풋터---------------------------------->
	<%@ include file="/bar/footer.jsp"%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type = "text/javascript" src="/js/bootstrap.js"></script>
</div>	
</body>
</html>