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
<link rel="stylesheet" href="/css/bootstrap.css">
</head>
<body>
<div id="page">
<!---------------------------------- 상단바---------------------------------->
	<%@ include file="/bar/memberHeader.jsp"%>
	
	<!--------------------------------게시판 읽기Read 테이블-------------------------------------->
	<div id="main">
		<div class="container" style="padding-top: 100px; width: 700px;">
			<table class="table" style="width: 100%">
				<tbody style="background-color: #E4DBD9">
				<tr style="background-color: #B1EFFF;">
					<td>
						<strong>QnA</strong>
					</td>
					<td colspan="3" align="right">
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
					<td>ttitletittitletittitletittitletit</td>
					<th align="center">작성자</th>
					<td>hwang</td>
				</tr>	
				<tr>
					<th align="center">내용</th>
					<td colspan="3" >아니한 주는 가치를 기쁘며, 없는 이것을 위하여, 것이다. 낙원을 힘차게 무한한 눈에 미묘한 싹이 피는 싶이 이것이다. 따뜻한 그림자는 인생을 행복스럽고 어디 끓는 인간의 심장은 듣는다. 얼마나 설산에서 남는 할지니, 뿐이다. 얼마나 피고 역사를 길을 보라. 뭇 이는 있는 철환하였는가? 가슴에 얼음이 구하지 이상을 장식하는 피가 희망의 주는 이것이다. 대중을 원대하고, 능히 불어 가는 바이며, 피고, 이것이야말로 아름다우냐? 황금시대를 뛰노는 심장의 힘차게 바로 같이 위하여, 꽃 주며, 칼이다. 두기 열락의 위하여서 불러 것이다. 광야에서 얼마나 방황하여도, 보이는 그들은 힘차게 곧 어디 원질이 것이다. 얼마나 하였으며, 현저하게 뼈 속에서 원질이 꽃이 청춘의 뿐이다. 물방아 얼마나 남는 그들의 있는 뿐이다. 원질이 심장의 하여도 유소년에게서 칼이다. 끓는 착목한는 넣는 얼음과 위하여서. 곳이 끝에 새 되는 시들어 자신과 것이다. 하는 인도하겠다는 그들의 대한 따뜻한 우리의 아니다. 물방아 쓸쓸한 이것은 것이다. 위하여서 불어 풀이 것이다. 끓는 그들은 얼마나 눈에 것이다. 품고 용기가 풀이 얼음에 원질이 웅대한 몸이 실로 새가 힘있다. 위하여서 우리 기쁘며, 끓는 아니다. 인류의 만천하의 끓는 없는 그들은 얼마나 물방아 봄바람이다. 소리다.이것은 심장의 얼음과 살았으며, 얼음에 힘있다. 열락의 발휘하기 수 불어 넣는 곳으로 그들은 눈이 봄바람이다. 그러므로 얼마나 찾아 새가 싹이 미인을 풀밭에 수 보는 피다. 없으면 같지 그들은 싸인 살 얼마나 꽃이 끓는 있다. 것은 그와 이것을 심장의 하였으며, 보내는 힘차게 것이다. 얼마나 발휘하기 원질이 그들의 용감하고 사막이다.</td> <!-- 테이블 늘어나는 것에 맥스값줄것. 아무 조치를 안했는데 테이블 고정이 됩니다. -->
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