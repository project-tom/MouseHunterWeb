<%@page import="java.util.ArrayList"%>
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
<title>QnA</title>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>

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
			<c:forEach var="vo" items="${qnaList}" varStatus="status">
				<tr>
					<td>${qnaList.get(status.index).getQna_index() }</td>
					<td>${qnaList.get(status.index).getQna_title() }</td>
					<td>${qnaList.get(status.index).getQna_author() }</td>
					<td>${qnaList.get(status.index).getQna_date() }</td>
					<td>${qnaList.get(status.index).getQna_readcount() }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>	
	<hr/>
	<a class="btn btn-default pull-right" href="qna/qnaWrite.jsp?page=${param.page }">글쓰기</a>
	<div class="text-center">
		<ul class="pagination">
		
			<c:set var="currentPage" value="${param.page}"></c:set>
			<c:set var="total" value="${totalQnA}"></c:set>
			<c:choose>
				<c:when test="${total%10 == 0}">
					<c:set var="maxPage" value="${total/10}"></c:set>
				</c:when>
				<c:otherwise>
					<c:set var="maxPage" value="${(total-total%10)/10+1}"></c:set>
				</c:otherwise>
			</c:choose>
			
			<c:if test="${currentPage > 1}"><li><a href="QnAList.qna?page=${currentPage-1 }">&lt;</a></c:if>
			<c:if test="${currentPage-2 > 0}"><li><a href="QnAList.qna?page=${currentPage-2 }">${currentPage-2 }</a></c:if>
			<c:if test="${currentPage-1 > 0}"><li><a href="QnAList.qna?page=${currentPage-1 }">${currentPage-1 }</a></c:if>
			<li><a><b>${currentPage}</b></a>
			<c:if test="${currentPage+1 <= maxPage}"><li><a href="QnAList.qna?page=${currentPage+1 }">${currentPage+1 }</a></c:if>
			<c:if test="${currentPage+2 <= maxPage}"><li><a href="QnAList.qna?page=${currentPage+2 }">${currentPage+2 }</a></c:if>
			<c:if test="${currentPage < maxPage}"><li><a href="QnAList.qna?page=${currentPage+1 }">&gt;</a></c:if>
			
		</ul>	
	</div>	
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type = "text/javascript" src="/js/bootstrap.js"></script>
</body>
</html>