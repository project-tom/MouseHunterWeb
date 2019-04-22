<%@page import="org.apache.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
static Logger logger = Logger.getLogger("signIn.jsp");
%>
<%
	logger.debug("[Page Load...] : signIn.jsp");
	if(session.getAttribute("logined")!=null && session.getAttribute("logined").equals("true")){
		String user_index = session.getAttribute("user_index").toString();
		String user_name = session.getAttribute("user_name").toString();
		pageContext.setAttribute("userLogined", "true");
		pageContext.setAttribute("user_index", user_index);
		pageContext.setAttribute("user_name", user_name);
		
		logger.debug("user_index : "+user_index+" is logined : "+session.getAttribute("logined").toString());
		if(session.getAttribute("Admin").toString().equals("true")){
			pageContext.setAttribute("isAdmin", true);
			logger.debug("[Hi Admin]");
		}
	}else{
		pageContext.setAttribute("userLogined", "false");
		String name = "";
		String value = "";
		if(request.getHeader("Cookie")!=null){ // 쿠키 생성여부 확인
			Cookie cookies[] = request.getCookies(); // 쿠키 저장
			for(int i=0; i<cookies.length; i++){ // 쿠키 전체 조회
				if(cookies[i].getName().equals("user_id")){ //쿠키들중 이름인 name 인 쿠키일 경우 
					name = cookies[i].getName();
					value = cookies[i].getValue();
				}
			}
			
		}
		pageContext.setAttribute("user_id", value);
	}
	
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sign-In</title>
<link rel="stylesheet" href="/css/bootstrap.css">
<style>
	#page{ padding: 5px; width: auto; margin: 20px auto;}
	#header{ height: 50px; margin: 0px;}
	#main{ padding-bottom: 200px; width: 100%; height: auto; float: left; margin-top: 30px; }
	#footer{ padding: 0px; clear: both; margin: 0px;}			
	
	@media screen and(max-width: 980px){
		#page { width: 94%;} 
		#main { width: 65%;}
		#sidebar1 { width: 30%;}} 
		#sidebar2 { width: 30%;}}
		
	@media screen and(max-width: 700px){
		#main { width: auto; float: none;}
		#sidebar1 { width: auto; float: none;}}	 
		#sidebar2 { width: auto; float: none;}}	
		
	@media screen and(max-width: 480px){
		#header{ height: auto;} 
		h2 { font-size: 24px;}
		#sidebar1 { display: none;}} 
		#sidebar2 { display: none;}}
	
	#header, #main, #sidebar1, #footer{ border: solid 2px gray;}
	
	#header{background-color: white;}	
	#sidebar1{background-color: green;}	
	#sidebar2{background-color: green;}	
	#main{background-color: #B1EFFF;}	
	#footer{background-color: blue;}	
	
	#reldiv1 {
		vertical-align: middle;
		z-index: 3;
		position: relative;
		display: inline-block;
		width:30rem; 
		height:30rem; 
		border-radius:20px; 
		border: 3px solid black; 
		margin-left:100px;  
		padding: 20px; 
		background-color:white;
	}
	#reldiv2 {
		vertical-align: middle;
		z-index: 2;
		height: 700px;
		position: relative;
		top: 15px;
		left: 20px;
		border: 1px dashed #669966;
		background-color: #ccffcc;
		margin: 0px 50px 0px 50px;
		text-align: center;
		display: inline-block;
	}
	
/***************** 이미지 슬라이드 가운데로 위치 시키기***************** */
	.carousel-inner > .item > img,
	.carousel-inner > .item > a > img{
		width: 70%;
		margin: auto;
	}
</style>

</head>
<body>
<div id="page">
<!----------------------------------상단바(nav)---------------------------------->	
		<c:choose>
			<c:when test="${pageScope.isAdmin }">
				<%@ include file="/bar/adminHeader.jsp"%>
				<%logger.debug("[adminHeader]"); %>
			</c:when>
			<c:otherwise>
				<%@ include file="/bar/memberHeader.jsp"%>
				<%logger.debug("[memberHeader]"); %>
			</c:otherwise>
		</c:choose>	
		

<!----------------------------------main안에 로그인---------------------------------->
		<div id="main">
			<div class="card align-middle" style="" id="reldiv1">
				<c:choose>
					<c:when test="${pageScope.userLogined == 'true'}">
						<%@ include file="/box/userBox.jsp" %>
					</c:when>
					<c:otherwise>
						<%@ include file="/box/loginBox.jsp" %>
					</c:otherwise>
				</c:choose>
			</div>
			
<!----------------------------------main안에-슬라이드---------------------------------->
			<div class="container" id="reldiv2">
			  <div id="myCarousel" class="carousel slide" data-ride="carousel" style="z-index:2;">
			    <!-- Indicators -->
			    <ol class="carousel-indicators">
			      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			      <li data-target="#myCarousel" data-slide-to="1"></li>
			      <li data-target="#myCarousel" data-slide-to="2"></li>
			    </ol>
			
			    <!-- Wrapper for slides -->
			    <div class="carousel-inner">
			
			      <div class="item active">
			        <img src="/resource/tom1.jpg" style="width:700px; height:700px;">
			      </div>
			
			      <div class="item">
			        <img src="/resource/tom2.jpg" style="width:700px; height:700px;">
			      </div>
			    
			      <div class="item">
			        <img src="/resource/tom3.jpg" style="width:700px; height:700px;">
			      </div>
			  
			    </div>
		
			    <!-- Left and right controls -->
			    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
			      <span class="glyphicon glyphicon-chevron-left"></span>
			      <span class="sr-only">Previous</span>
			    </a>
			    <a class="right carousel-control" href="#myCarousel" data-slide="next">
			      <span class="glyphicon glyphicon-chevron-right"></span>
			      <span class="sr-only">Next</span>
			    </a>
			  </div>
			</div>
<!----------------------------------풋터---------------------------------->
		</div>
		<div id="footer">
				<h2>Thank you for visiting</h2>
		</div>
		
		
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type = "text/javascript" src="/js/bootstrap.js"></script>
</body>
</html>