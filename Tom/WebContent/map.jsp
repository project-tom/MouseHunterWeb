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
		session.setAttribute("logined","true");
		session.setAttribute("user_index", user_index);
		logger.debug("user_index : "+user_index+" is logined : "+session.getAttribute("logined").toString());
	}
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
		border-radius:20px; 
		border: 3px solid black; 
		padding-top: 100px; 
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
			지도그림 들어갑니다.
		</div>
		<div id="reldiv" style="width: 50rem; height: 50rem">	
			<table class="table">
				<tr>
					<th>No</th>
					<td> 1 </td>
				</tr>
				<tr>
					<th>이름</th>
					<td> 설치된 건물 이름 </td>
				</tr>
				<tr>
					<th>주소</th>
					<td> 건물 주소 </td>
				</tr>
				<tr>
					<th>리셋날짜</th>
					<td> 20190409 </td>
				</tr>
				<tr>
					<th>위도</th>
					<td> 216511 </td>
				</tr>
				<tr>
					<th>경도</th>
					<td> 165165 </td>
				</tr>
			</table>
		</div>
	</div>
	
<!----------------------------------풋터---------------------------------->
	<%@ include file="/bar/footer.jsp"%>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type = "text/javascript" src="/js/bootstrap.js"></script>
</div>	
</body>
</html>