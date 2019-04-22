<%@page import="org.apache.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
static Logger logger = Logger.getLogger("signWithdrawal.jsp");
%>
<%
	logger.debug("[Page Load...] : signWithdrawal.jsp");
	session.removeAttribute("logined");
	session.removeAttribute("user_index");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>signWithdrawal</title>
<style>
	#page{ padding: 5px; width: auto; margin: 20px auto;}
	#header{ height: 50px; margin: 0px;}
	#main{ padding-bottom: 530px; width: 100%; height: auto; float: left; margin-top: 30px; }
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
	#footer{background-color: yellow;}	

</style>
<link rel="stylesheet" href="/css/bootstrap.css">
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

<!----------------------------------회원탈퇴 테이블---------------------------------->
	<div id="main">
		<p align="center" style="font-size:30pt; padding-top: 100px" > 회원 탈퇴가 완료되었습니다.<p>
		<div class="container">
			<a class="btn btn-default pull-right" href="/user/signIn.jsp">확인</a>
		</div>
	</div>
<!----------------------------------풋터---------------------------------->
		
		<div id="footer">
				<h2>Thank you for visiting</h2>
		</div>
		
		
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type = "text/javascript" src="/js/bootstrap.js"></script>
</body>
</html>