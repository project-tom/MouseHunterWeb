<%@page import="org.tom.persistence.QnADAOImpl"%>
<%@page import="org.tom.domain.QnAVO"%>
<%@page import="org.apache.log4j.Logger"%>
<%@page import="org.tom.persistence.UserDAOImpl"%>
<%@page import="org.tom.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String user_index;
boolean isAdmin = false;
static Logger logger = Logger.getLogger("qnaWrite.jsp");
%>
<%
	
	logger.debug("[Page Load...] : qnaWrite.jsp?flag="+request.getParameter("flag"));
	logger.debug(""+request.getAttribute("info"));
	if(session.getAttribute("logined")!=null && session.getAttribute("logined").equals("true")){
		user_index = session.getAttribute("user_index").toString();
		pageContext.setAttribute("userLogined", "true");
		pageContext.setAttribute("user_index", user_index);
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
	if(!request.getParameter("flag").equals("write")){
		QnAVO info = new QnAVO();
		QnADAOImpl dao_ = new QnADAOImpl();
		info = dao_.qnaInfo(Integer.parseInt(request.getParameter("index")));
		pageContext.setAttribute("info", info);
	}
	
	
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${empty user_index }">
	<c:redirect url="../QnAList.qna?page=1"></c:redirect>
</c:if>

<c:choose>
	<c:when test="${param.flag == 'write' }">
		<c:set var="uri" value="QnAAdd"></c:set>
		<c:set var="btn" value="등록"></c:set>
	</c:when>
	<c:when test="${param.flag == 'modify' }">
		<c:set var="uri" value="QnAModify"></c:set>
		<c:set var="btn" value="수정"></c:set>
	</c:when>
	<c:when test="${param.flag == 'reply' }">
		<c:set var="uri" value="QnAAdd"></c:set>
		<c:set var="btn" value="답변등록"></c:set>
	</c:when>
</c:choose>
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
			<form action="../${uri}.qna?page=${param.page }" method="post">
			<table class="table" >
				<caption align="left"><strong>QnA</strong></caption>
				<c:if test="${param.flag == 'modify' }">
					<c:set var="content" value="${info.getQna_content() }"></c:set>
					<c:set var="title" value="${info.getQna_title() }"></c:set>
				</c:if>
				<tbody style="background-color: #E4DBD9">
				<tr>
					<th align="center">제목</th>
					<td>
					<c:choose>
						<c:when test="${param.flag == 'reply' }">
							${info.getQna_title() } 글에 대한 답글 입니다.
							<input type="hidden" name="qna_title" value="${info.getQna_title() } 글에 대한 답글 입니다.">
						</c:when>
						<c:otherwise>
							<input type="text" name="qna_title" style="width:1000px;" value="${title }">
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
				<tr>
					<th align="center">작성자</th>
					<td><%=vo.getUser_name() %>
						<input type="hidden" name="qna_author" value="<%=vo.getUser_name() %>">
						<input type="hidden" name="isAdmin" value="${isAdmin }">
						</td>
				</tr>
				<c:if test="${param.flag == 'reply' }">
					<tr>
						<th align="center">문의</th>
						<td> ${info.getQna_content() }
							<input type="hidden" name="question" value="${info.getQna_content() }"></td>
					</tr>
				</c:if>
				<tr>
					<th align="center">내용</th>
					<td>
						<input type="text" name="qna_content" style="width:1000px; height:500px;" value ="${content }">
						<input type="hidden" name="qna_index" value="${info.getQna_index()}">
					</td>
				</tr>
				<c:if test="${param.flag != 'modify' }">
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="qna_pass" /></td>
					</tr>
				</c:if>
				</tbody>
			</table>
			<hr/>
			<button class="btn btn-default pull-right " type="submit" >${btn}</button>
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