<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<style>
		#main{ width: 90%; height: 100%; float: left; background-color:  #B1EFFF; }
		@media screen and(max-width:1920px){
			#main{width:auto;}
		}
		@media screen and(max-width: 980px){
			#main{width:auto;}
		}
		@media screen and(max-width: 700px){
			#main{width: auto; float: none;}
		}
	</style>
	<title>MouseHunter</title>
	<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	<div style="width:100%; height:100%; background:red;">
	
<!---------------------------------- 상단바---------------------------------->
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
	
<!----------------------------------로그인---------------------------------->
    	<div id="main">
			<div class="card align-middle" 
				style="width:30rem; height:30rem; border-radius:20px; 
						border: 3px solid black; margin-left:200px; margin-top:250px; padding: 20px; background-color:white;">
				<div class="card-title">
					<p style="font-size:24px;" class="card-title text-left" style="color:black;"><strong>쥐를 잡자 쥐를 잡자</strong></p>
					<p style="font-size:24px;"><strong>쥐쥐쥐~^0^</strong></p><br>
				</div>
				<div class="card-body">
			    	<form class="form-signin" method="POST" onSubmit="logincall();return false">
			       		<label for="inputEmail" class="sr-only"></label>
			        	<input type="text" id="uid" class="form-control" placeholder="아이디를 입력하세요" required autofocus><BR>
			        	<label for="inputPassword" class="sr-only"></label>
			        	<input type="password" id="upw" class="form-control" placeholder="비밀번호를 입력하세요" required><br>
			        	<div class="checkbox">
			          	<label class="pull-left">
			           		<input type="checkbox" value="remember-me" > 기억하기<br>
			          	</label>
			          	<button id="btn-Yes" class="btn btn btn pull-right" type="submit" >로그인</button>
		        		</div>
		     		</form>
				</div>
			</div>
		</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type = "text/javascript" src="js/bootstrap.js"></script>
	</div>
</body>
</html>