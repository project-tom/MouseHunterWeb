<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>tableTest</title>
<style>
	#main{ padding-bottom: 200px; width: 100%; height: auto; float: left; margin-top: 30px; }
	#footer{ padding: 0px; clear: both; margin: 0px;}
</style>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>

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
	
	<!--------------------------------게시판 테이블-------------------------------------->
	
	<div class="container">
		<table class="table">
			<tr>
				<th align="center">
					QnA
				</th>
				<td colspan="4">
			<tbody style="background-color: #B1EFFF">
			<tr>
				<th align="center">제목</th>
				<td><input type="text" name="title" style="width:1000px;"/></td>
			</tr>	
			<tr>
				<th align="center">내용</th>
				<td><input type="text" name="content" style="width:1000px; height:500px;"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="content" /></td>
			</tr>
			</tbody>
		</table>	
		<hr/>
		<a class="btn btn-default pull-right">등록</a>
		<a class="btn btn-default pull-right">목록</a>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type = "text/javascript" src="js/bootstrap.js"></script>
</body>
</html>