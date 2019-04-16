<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<link rel="stylesheet" href="css/bootstrap.css">
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
					<a class="navbar-brand" href="main.jsp">MouseHunter</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"> 
					<ul class="nav navbar-nav">
						<li><a href="main.jsp">QnA</a></li>
						<li><a href="bbs.jsp">Map</a></li>
						<li><a href="bbs.jsp">MyPage</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">접속하기<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li class="active"><a href="login.jsp">로그인</a></li>
								<li><a href="join.jsp">회원가입</a></li>
							</ul>	
						</li>
					</ul>
				</div>
			</nav>
		</div>

<!----------------------------------회원정보 수정 테이블---------------------------------->	
		<div id="main">
			<div class="container" style="padding-top: 100px;">
				<table class="table" >
					<caption align="left"><strong>회원정보 수정</strong></caption>
					<tbody >
					<tr>
						<th align="center" style="background-color:#D9D8D8" >아이디</th>
						<td>hwang</td>
					</tr>	
					<tr>
						<th align="center" style="background-color: #D9D8D8">비밀번호</th>
						<td><input type="text" name="content" style="width:300px;"></td>
					</tr>
					<tr>
						<th style="background-color: #D9D8D8">성별</th>
						<td><input type="radio" name="user_gender" value="man">남자
						 	<input type="radio" name="user_gender" value="woman">여자</td>
					</tr>
					<tr>
			            <th style="background-color: #D9D8D8">생년월일</th>
			            <td><input type="text" name="user_birth1"> 년 <input type="text" name="user_birth2"> 월 <input type="text" name="user_birth3"> 일</td>
			        </tr>
			        <tr>
			            <th style="background-color: #D9D8D8">이메일</th>
			            <td><input type="text" name="user_email" /></td>
			        </tr>
			        <tr>
			            <th style="background-color: #D9D8D8">전화번호</th>
			            <td><input type="text" name="user-phone1"> - <input type="text" name="user-phone2"> - <input type="text" name="user-phone3"></td>
			        </tr>
			        <tr>
			            <th style="background-color: #D9D8D8">주소</th>
			            <td><input type="text" name="user_address"></td>
			        </tr>
					</tbody>
				</table>	
				<hr/>
				<a class="btn btn-default pull-right">수정</a>
			</div>
		</div>
<!----------------------------------풋터---------------------------------->
		
		<div id="footer">
				<h2>Thank you for visiting</h2>
		</div>
		
		
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type = "text/javascript" src="js/bootstrap.js"></script>
</body>
</html>