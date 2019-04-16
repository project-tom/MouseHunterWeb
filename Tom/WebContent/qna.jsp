<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA</title>
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
	<div class="container" style="padding-top: 100px;">
		<table class="table table-hover" >
		<thead>
		<tr>
			<td>
				QnA
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
		</thead>
		<thead>
		<tr>
			<th align="center">No</th>
			<th align="center">제목</th>
			<th align="center">작성자</th>
			<th align="center">날짜</th>
			<th align="center">조회수</th>
		</tr>
		</thead>
		<tbody style="background-color: #B1EFFF">
			<tr>
			<td>0</td>
			<td>쥐덫 위치 등록화면 관련해서</td>
			<td>hwang</td>
			<td>2019-04-11</td>
			<td>5</td>
		</tr>
		<tr>
			<td>0</td>
			<td>쥐덫 위치 등록화면 관련해서</td>
			<td>hwang</td>
			<td>2019-04-11</td>
			<td>5</td>
		</tr>
		</tbody>
	</table>	
	<hr/>
	<a class="btn btn-default pull-right">글쓰기</a>
	<div class="text-center">
		<ul class="pagination">
			<li><a href="#">&lt;</a>
			<li><a href="#">1</a>
			<li><a href="#">2</a>
			<li><a href="#">3</a>
			<li><a href="#">4</a>
			<li><a href="#">5</a>
			<li><a href="#">&gt;</a>
		</ul>	
	</div>	
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type = "text/javascript" src="js/bootstrap.js"></script>
</body>
</html>