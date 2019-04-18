<%@page import="org.tom.persistence.UserDAOImpl"%>
<%@page import="org.tom.domain.UserVO"%>
<%@page import="org.apache.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
	String user_index;
	static Logger logger = Logger.getLogger("signUpdate.jsp");
%>
<%
	logger.debug("[Page Load...] : signUpdate.jsp");
	if(session.getAttribute("logined")!=null && session.getAttribute("logined").equals("true")){
		String user_index = session.getAttribute("user_index").toString();
		UserVO vo = new UserVO();
		UserDAOImpl dao = new UserDAOImpl();
		vo = dao.userInfo(Integer.parseInt(user_index));
		pageContext.setAttribute("user_index", user_index);
		pageContext.setAttribute("info", vo);
		logger.debug("user_index : "+user_index+" is logined : "+session.getAttribute("logined").toString());
		if(session.getAttribute("Admin").toString().equals("true")){
			pageContext.setAttribute("isAdmin", true);
			logger.debug("[Hi Admin]");
		}
	}
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>signUpdate</title>
<style>
	#page{ padding: 5px; width: auto; margin: 20px auto;}
	#header{ height: 50px; margin: 0px;}
	#main{ padding-bottom: 525px; width: 100%; height: auto; float: left; margin-top: 30px; }
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

<!----------------------------------회원정보 수정 테이블---------------------------------->	
		<div id="main">
			<div class="container" style="padding-top: 100px;">
				<form action="../Modify.user" method="post">
				<table class="table" >
					<caption align="left"><strong>회원정보 수정</strong></caption>
					<tbody >
					<tr>
						<th align="center" style="background-color:#D9D8D8" >아이디</th>
						<td><input type="text" name="user_id" style="width:300px;" value="${pageScope.info.getUser_id() }"></td>
					</tr>	
					<tr>
						<th align="center" style="background-color: #D9D8D8">비밀번호</th>
						<td><input type="password" name="user_pw" style="width:300px;"></td>
					</tr>
					<tr>
						<th align="center" style="background-color:#D9D8D8" >이름</th>
						<td><input type="text" name="user_name" style="width:300px;" value="${pageScope.info.getUser_name() }"></td>
					</tr>
					<tr>
			            <th style="background-color: #D9D8D8">생년월일</th>
			            <td><input type="text" name="year"> 년 <input type="text" name="month"> 월 <input type="text" name="day"> 일</td>
			        </tr>
			        <tr>
			            <th style="background-color: #D9D8D8">이메일</th>
			            <td><input type="text" name="user_email" value="${pageScope.info.getUser_email() }"></td>
			        </tr>
			        <tr>
			            <th style="background-color: #D9D8D8">전화번호</th>
			            <td><input type="text" name="phone1"> - <input type="text" name="phone2"> - <input type="text" name="phone3"></td>
			        </tr>
			        <tr>
			            <th style="background-color: #D9D8D8">주소</th>
			            <td><input type="text" name="user_address" value="${pageScope.info.getUser_address() }">
			            	<input type="hidden" name="user_index" value="${pageScope.user_index }"></td>
			        </tr>
					</tbody>
				</table>	
				<hr/>
				<button class="btn btn-default pull-right" type="submit" >수정</button>
				</form>
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