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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>adminQnaRead</title>
<style>
	#page{ padding: 5px; width: auto; margin: 20px auto;}
	#header{ height: 50px; margin: 0px;}
	#main{ padding-bottom: 600px; width: 100%; height: auto; float: left; margin-top: 30px; }
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
	
	#header, #main, #footer{ border: solid 2px gray;}
	
	#header{background-color: white;}	
	#main{background-color: #B1EFFF;}	
	#footer{background-color: #24BDFF;}	
</style>
<link rel="stylesheet" href="/css/bootstrap.css">
</head>
<body>
<div id="page">
<!---------------------------------- 상단바---------------------------------->
	<%@ include file="/bar/adminHeader.jsp"%>

<!--------------------------------회원검색 테이블-------------------------------------->
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
			<a class="btn btn-default pull-right">답글</a>
			<a class="btn btn-default pull-right">수정</a>
			<a class="btn btn-default pull-right">삭제</a>
			<a class="btn btn-default pull-right">목록</a>
		</div>
	</div>
	
<!----------------------------------풋터---------------------------------->
	<%@ include file="/bar/footer.jsp"%>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type = "text/javascript" src="/js/bootstrap.js"></script>
</div>	
</body>
</html>