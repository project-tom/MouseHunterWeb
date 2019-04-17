<%@page import="org.apache.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
static Logger logger = Logger.getLogger("signUp.jsp");
%>
<%
	logger.debug("[Page Load...] : signUp.jsp");
	if(session.getAttribute("logined")!=null && session.getAttribute("logined").equals("true")){
		String user_index = session.getAttribute("user_index").toString();
		session.setAttribute("logined","true");
		session.setAttribute("user_index", user_index);
		logger.debug("user_index : "+user_index+" is logined : "+session.getAttribute("logined").toString());
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>signUp</title>
<style>
	#page{ padding: 5px; width: auto; margin: 20px auto;}
	#header{ height: 50px; margin: 0px;}
	#main{ padding-bottom: 200px; width: 100%; height: auto; float: left; margin-top: 30px; }
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
	#main{background-color:  #B1EFFF;}	
	#footer{background-color: yellow;}	

</style>
<link rel="stylesheet" href="/css/bootstrap.css">
</head>
<body>
<div id="page">
<!----------------------------------상단바(nav)---------------------------------->		
		<div id="header">
			<nav class="navbar navbar-default">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" 
						aria-expanded="false"> <!-- toggle: 단추, 온오프 스위치 --> <!-- collapse: 붕괴하다, 무너지다  -->
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="signIn.jsp">MouseHunter</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"> 
					<ul class="nav navbar-nav">
						<li><a href="../QnAList.qna?page=1">QnA</a></li>
						<li><a href="map.jsp">Map</a></li>
						<li><a href="myPage.jsp">MyPage</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">접속하기<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li class="active"><a href="signIn.jsp">로그인</a></li>
								<li><a href="signUp.jsp">회원가입</a></li>
							</ul>	
						</li>
					</ul>
				</div>
			</nav>
		</div>

<!----------------------------------회원가입 테이블---------------------------------->

		<div id="main">
			<div class="container" style="padding-top: 100px;">
				<form action="../SignUp.user" method="POST" >
				<table class="table" >
					<caption align="left"><strong>회원가입</strong></caption>
					<tbody >
					
					<tr>
						<th align="center" style="background-color:#D9D8D8" >아이디</th>
						<td><input type="text" name="user_id" /> <input type="button" name="singin" value="중복검사"> 아이디는 영어와 숫자만 가능 
							<input type="hidden" name="isDuplication" value="unChecked"></td>
					</tr>	
					<tr>
						<th align="center" style="background-color: #D9D8D8">비밀번호</th>
						<td><input type="password" name="user_pw" style="width:300px;"></td>
					</tr>
					<tr>
						<th align="center" style="background-color: #D9D8D8">이름</th>
						<td><input type="text" name="user_name" style="width:300px;"></td>
					</tr>
					<tr>
						<th style="background-color: #D9D8D8">성별</th>
						<td><input type="radio" name="user_gender" value="man">남자
						 	<input type="radio" name="user_gender" value="woman">여자</td>
					</tr>
					<tr>
			            <th style="background-color: #D9D8D8">생년월일</th>
			            <td><input type="text" name="year"> 년 <input type="text" name="month"> 월 <input type="text" name="day"> 일</td>
			        </tr>
			        <tr>
			            <th style="background-color: #D9D8D8">이메일</th>
			            <td><input type="text" name="user_email" /></td>
			        </tr>
			        <tr>
			            <th style="background-color: #D9D8D8">전화번호</th>
			            <td><input type="text" name="phone1"> - <input type="text" name="phone2"> - <input type="text" name="phone3"></td>
			        </tr>
			        <tr>
			            <th style="background-color: #D9D8D8">주소</th>
			            <td><input type="text" name="user_address">
			            	<input type="hidden" name="fromWeb" value="true"></td>
			        </tr>
					</tbody>
				</table>	
				<hr/>
				<button class="btn btn-default pull-right" type="submit" >가입</button>
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