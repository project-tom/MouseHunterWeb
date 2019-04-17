<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnARead</title>
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
	#footer{background-color: #24BDFF;}	
</style>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<div id="page">
<!---------------------------------- 상단바---------------------------------->
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
					<li class="dropdown">
						<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">MyPage<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="logout.jsp">로그아웃</a></li>
							<li><a href="SignUpdate.jsp">회원정보수정</a></li>
							<li><a href="signWithdrawal.jsp">회원탈퇴</a></li>
						</ul>	
					</li>
				</ul>
			</div>
		</nav>
	</div>
	<!--------------------------------게시판 읽기Read 테이블-------------------------------------->
	<div id="main">
		<div class="container" style="padding-top: 100px;">
			<table class="table">
				<tbody style="background-color: #E4DBD9">
				<tr style="background-color: #B1EFFF;">
					<td>
						<strong>QnA</strong>
					</td>
					<td colspan="4" align="right">
						<form action="??" method="get">	
							<select>
								<option value="title" selected="selected">제목</option>
								<option value="author">작성자</option>
							</select>
							<input type="text" name="search" >
						 <input type="submit" value="검색" class="btn btn-xs">	
						</form>
					</td>
				</tr>
				<tr>
					<th align="center">제목</th>
					<td style="width: 600px;">title</td>
					<th align="center">작성자</th>
					<td>hwang</td>
				</tr>	
				<tr>
					<th align="center">내용</th>
					<td colspan="3">content</td>
				</tr>
				</tbody>
			</table>	
			<hr/>
			<a class="btn btn-default pull-right">수정</a>
			<a class="btn btn-default pull-right">삭제</a>
			<a class="btn btn-default pull-right">목록</a>
		</div>
	</div>
	<!----------------------------------풋터---------------------------------->
	<div id="footer">
		<h2>Thank you for visiting</h2>
	</div>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type = "text/javascript" src="js/bootstrap.js"></script>
</div>	
</body>
</html>