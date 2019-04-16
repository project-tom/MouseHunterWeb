<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	if(session.getAttribute("logined")!=null && session.getAttribute("logined").equals("true")){
	String user_index = session.getAttribute("user_index").toString();
	session.setAttribute("logined","true");
	session.setAttribute("user_index", user_index);
	System.out.println("user_index : "+user_index+" is logined : "+session.getAttribute("logined").toString());
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA Write</title>
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
<link rel="stylesheet" href="/css/bootstrap.css">
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
					<a class="navbar-brand" href="../user/signIn.jsp">MouseHunter</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"> 
					<ul class="nav navbar-nav">
						<li><a href="../QnAList.qna?page=1">QnA</a></li>
						<li><a href="../user/map.jsp">Map</a></li>
						<li><a href="../user/myPage.jsp">MyPage</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">접속하기<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li class="active"><a href="../user/signIn.jsp">로그인</a></li>
								<li><a href="../user/signUp.jsp">회원가입</a></li>
							</ul>	
						</li>
					</ul>
				</div>
			</nav>
		</div>
	<!--------------------------------게시판 쓰기 테이블-------------------------------------->
	<div id="main">
		<div class="container" style="padding-top: 100px;">
			<table class="table" >
				<caption align="left"><strong>QnA</strong></caption>
				<!-- <tr>
					<th align="center">
						QnA
					</th>
					<td colspan="4"> -->
				<tbody style="background-color: #E4DBD9">
				<tr>
					<th align="center">제목</th>
					<td><input type="text" name="qna_title" style="width:1000px;"/></td>
				</tr>	
				<tr>
					<th align="center">내용</th>
					<td><input type="text" name="qna_content" style="width:1000px; height:500px;"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="qna_pass" /></td>
				</tr>
				</tbody>
			</table>	
			<hr/>
			<a class="btn btn-default pull-right" >등록</a>
			<a class="btn btn-default pull-right" href="../QnAList.qna?page=${param.page }">목록</a>
		</div>
	</div>
	<!----------------------------------풋터---------------------------------->
	<div id="footer">
		<h2>Thank you for visiting</h2>
	</div>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type = "text/javascript" src="/js/bootstrap.js"></script>
</div>	
</body>
</html>