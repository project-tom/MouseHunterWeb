<%@page import="org.tom.persistence.QnADAOImpl"%>
<%@page import="org.apache.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
static Logger logger = Logger.getLogger("qnaRead.jsp");
%>
<%
	logger.debug("[Page Load...] : qnaRead.jsp");
	if(session.getAttribute("logined")!=null && session.getAttribute("logined").equals("true")){
		String user_index = session.getAttribute("user_index").toString();
		String btn = "수정";
		String flag = "";
		pageContext.setAttribute("userLogined", "true");
		logger.debug("user_index : "+user_index+" is logined : "+session.getAttribute("logined").toString());
		if(session.getAttribute("Admin").toString().equals("true")){
			btn="답글";
			pageContext.setAttribute("isAdmin", true);
			logger.debug("[Hi Admin]");
		}
		if(btn.equals("수정")) flag="modify";
		if(btn.equals("답글")) flag="reply";
		pageContext.setAttribute("btn", btn);
		pageContext.setAttribute("flag", flag);
		logger.debug("btn : "+btn);
	}
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="info" value="${info }"></c:set>

<%
	QnADAOImpl dao = new QnADAOImpl();
	pageContext.setAttribute("dao", dao);
%>
<c:set var="exist" value=""></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnARead</title>
<style>
	#page{ padding: 5px; width: auto; margin: 20px auto;}
	#header{ height: 50px; margin: 0px;}
	#main{ padding-bottom: 200px; width: 100%; height: auto; float: left; margin-top: 30px; }
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
						<form action="QnASearch.qna" method="get">	
							<select name="search_criteria">
								<option value="qna_title" selected="selected">제목</option>
								<option value="qna_author">작성자</option>
							</select>
							
							<input type="text" name="search" value="${param.search}" >
							<input type="hidden" name="page" value="1">
						 <input type="submit" value="검색" class="btn btn-xs">
						</form>
					</td>
				</tr>
				<tr>
					<th align="center">제목</th>
					<td>${info.getQna_title() }</td>
					<th align="center">작성자</th>
					<td>${info.getQna_author() }</td>
				</tr>	
				<tr>
					<th align="center">내용</th>
					<td colspan="3" >${info.getQna_content()}</td>
				</tr>
				</tbody>
			</table>	
			<hr/>
			<a class="btn btn-default pull-right" href="../QnAList.qna?page=${param.page }">목록</a>
			<c:if test="${userLogined == 'true' }">
				<a class="btn btn-default pull-right" href="../QnADelete.qna?page=${param.page }&index=${info.getQna_index()}">삭제</a>
				<c:if test="${!dao.answer(info.getQna_index())}">
					<a class="btn btn-default pull-right" href="qna/qnaWrite.jsp?page=${param.page }&flag=${pageScope.flag}&index=${info.getQna_index()}">${pageScope.btn}</a>
				</c:if>
			</c:if>
			
			
			
			
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