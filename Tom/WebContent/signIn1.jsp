<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	if(session.getAttribute("logined")!=null && session.getAttribute("logined").equals("true")){
		String user_index = session.getAttribute("user_index").toString();
		System.out.print("user_index : "+user_index+" is logined : "+session.getAttribute("logined").toString());
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sign-In</title>
<style>
	#page{ padding: 5px; width: auto; margin: 20px auto;}
	#header{ height: 50px; margin: 0px;}
	/* #sidebar1{ padding: 0px; width: 10%; height: auto; float: left; margin: 0px;} */
	#main{ padding-bottom: 200px; width: 100%; height: auto; float: left; margin-top: 30px; }
	/* #sidebar2{ padding: 0px; width: 10%; height: auto; float: right; margin: 0px;} */
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

<!----------------------------------main안에 로그인---------------------------------->
		<div id="main">
			<div class="card align-middle" style="" id="reldiv1">
				<div class="card-title">
					<p style="font-size:24px;" class="card-title text-left" style="color:black;"><strong>쥐를 잡자 쥐를 잡자</strong></p>
					<p style="font-size:24px;" class="card-title text-left" style="color:black;"><strong>쥐쥐쥐~^0^</strong></p><br>
				</div>
				<div class="card-body">
			    	<form action="SignIn.user" class="form-signin" method="POST" onSubmit="logincall();return false">
			       		<label for="inputEmail" class="sr-only"></label>
			        	<input type="text" id="uid" class="form-control" placeholder="아이디를 입력하세요" name="user_id" required autofocus><BR>
			        	<label for="inputPassword" class="sr-only"></label>
			        	<input type="password" id="upw" class="form-control" placeholder="비밀번호를 입력하세요" name="user_pw" required><br>
			        	<input type="hidden" name="fromWep" value="true">
			        	<div class="checkbox">
			          	<label class="pull-left">
			           		<input type="checkbox" value="remember-me" > 기억하기<br>
			          	</label>
			          	<button id="btn-Yes" class="btn pull-right " type="submit" >로그인</button>
		        		</div>
		     		</form>
				</div>
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
			        <img src="tom1.jpg" alt="Los Angeles" style="width:700px; height:700px;">
			      </div>
			
			      <div class="item">
			        <img src="tom2.jpg" alt="Chicago" style="width:700px; height:700px;">
			      </div>
			    
			      <div class="item">
			        <img src="tom3.jpg" alt="New York" style="width:700px; height:700px;">
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
<script type = "text/javascript" src="js/bootstrap.js"></script>
</body>
</html>