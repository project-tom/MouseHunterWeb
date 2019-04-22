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
<c:if test="${empty pointList }">
	<c:redirect url="/user/signIn.jsp"></c:redirect>
</c:if>
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
</head>
<body>

<div id="page">
<!---------------------------------- 상단바---------------------------------->
	<%@ include file="/bar/memberHeader.jsp"%>

<!--------------------------------관리자 답글 테이블-------------------------------------->
	<div id="main">
		<div id="reldiv" style="width: 100rem; height: 70rem">
			<div id="map" style="width: 99rem; height: 69rem"></div>
			
		</div>
		<div id="reldiv" style="width: 50rem; height: 50rem">	
			<table class="table">
				<tr>
					<th>No</th>
					<td id="point_index_"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td id="point_name_"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td id="point_address_"></td>
				</tr>
				<tr>
					<th>리셋날짜</th>
					<td id="point_reset_date_"> </td>
				</tr>
				<tr>
					<th>총 포획량</th>
					<td id="point_hunting_count_"> </td>
				</tr>
				<tr>
					<th>위도</th>
					<td id="point_latitude_"></td>
				</tr>
				<tr>
					<th>경도</th>
					<td id="point_longitude_"></td>
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
			<input type="hidden" name="point_hunting_count" value="${pointList.get(status.index).getHunting_count()}">
			<input type="hidden" name="point_reset_date" value="${pointList.get(status.index).getReset_date()}">
		</form>
	</c:forEach>
</div>
<!----------------------------------풋터---------------------------------->
	<%@ include file="/bar/footer.jsp"%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type = "text/javascript" src="/js/bootstrap.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3af3680f9c9b66662bad83f52ed80d5b"></script>
			<script type="text/javascript">
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new daum.maps.LatLng(document.getElementsByName('data')[1].point_latitude.value ,document.getElementsByName('data')[1].point_longitude.value), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};

			var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
			var markers = [];
			function addMarker(makerIndex, position) {
			    
			    // 마커를 생성합니다
			    var marker = new daum.maps.Marker({
			    	title: makerIndex,
			        position: position,
			        clickable: true 
				});
			    marker.setMap(map);
			    markers.push(marker);
			    
			    daum.maps.event.addListener(marker, 'click', function(){
			    	document.getElementById('point_index_').innerHTML = document.getElementsByName('data')[makerIndex-1].point_index.value;
			    	document.getElementById('point_name_').innerHTML = document.getElementsByName('data')[makerIndex-1].point_name.value;
			    	document.getElementById('point_address_').innerHTML = document.getElementsByName('data')[makerIndex-1].point_address.value;
			    	document.getElementById('point_latitude_').innerHTML = document.getElementsByName('data')[makerIndex-1].point_latitude.value;
			    	document.getElementById('point_longitude_').innerHTML = document.getElementsByName('data')[makerIndex-1].point_longitude.value;
			    	document.getElementById('point_hunting_count_').innerHTML = document.getElementsByName('data')[makerIndex-1].point_hunting_count.value;
			    	document.getElementById('point_reset_date_').innerHTML = document.getElementsByName('data')[makerIndex-1].point_reset_date.value;
			    });
			}
			for(var i = 0; i < '${pointList.size()}' ; i++){
				addMarker(i+1,new daum.maps.LatLng(document.getElementsByName('data')[i].point_latitude.value ,document.getElementsByName('data')[i].point_longitude.value))
			}
			
	</script>
</div>	
</body>
</html>