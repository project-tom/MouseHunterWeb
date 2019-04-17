<%@page import="org.apache.log4j.Logger"%>
<%@page import="org.tom.persistence.UserDAOImpl"%>
<%@page import="org.tom.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String user_index;
boolean isAdmin = false;
static Logger logger = Logger.getLogger("signUpdate.jsp");
%>
<%
	if(session.getAttribute("logined")!=null && session.getAttribute("logined").equals("true")){
	user_index = session.getAttribute("user_index").toString();
	System.out.println("user_index : "+user_index+" is logined : "+session.getAttribute("logined").toString());
	if(session.getAttribute("Admin").toString().equals("true")){
		pageContext.setAttribute("isAdmin", true);
		logger.debug("[Hi Admin]");
	}
}
%>
<%
	UserVO vo = new UserVO();
	UserDAOImpl dao = new UserDAOImpl();
	if(user_index != null){
		vo = dao.userInfo(Integer.parseInt(user_index));
	}
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:if test="${empty user_index }">
	<c:redirect url="../QnAList.qna?page=1"></c:redirect>
</c:if>
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
		<c:choose>
			<c:when test="${pageScope.isAdmin }">
				<%@ include file="/bar/adminHeader.jsp"%>
				<%logger.debug("[adminHeader]"); %>
			</c:when>
			<c:otherwise>
				<%@ include file="/bar/memberHeader.jsp"%>
				<%logger.debug("[memberHeader]"); %>
			</c:otherwise>
		</c:choose>	
		
	<!--------------------------------게시판 쓰기 테이블-------------------------------------->
	<div id="main">
		<div class="container" style="padding-top: 100px;">
			<form action="../QnAAdd.qna?page=${param.page }" method="post">
			<table class="table" >
				<caption align="left"><strong>QnA</strong></caption>
				<tbody style="background-color: #E4DBD9">
				<tr>
					<th align="center">제목</th>
					<td><input type="text" name="qna_title" style="width:1000px;"/></td>
				</tr>
				<tr>
					<th align="center">작성자</th>
					<td><%=vo.getUser_name() %>
						<input type="hidden" name="qna_author" value="<%=vo.getUser_name() %>"></td>
				</tr>
				<tr>
					<th align="center">내용</th>
					<td><input type="text" name="qna_content" style="width:1000px; height:500px;"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="qna_pass" />
						<input type="hidden" name="isAdmin" value="<%=isAdmin%>"></td>
				</tr>
				</tbody>
			</table>
			<hr/>
			<button class="btn btn-default pull-right " type="submit" >등록</button>
			</form>
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