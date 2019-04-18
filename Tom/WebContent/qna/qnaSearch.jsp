<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
static Logger logger = Logger.getLogger("qnaSearch.jsp");
%>
<%
	logger.debug("[Page Load...] : qnaSearch.jsp");
	if(session.getAttribute("logined")!=null && session.getAttribute("logined").equals("true")){
		String user_index = session.getAttribute("user_index").toString();
		pageContext.setAttribute("userLogined", "true");
		logger.debug("user_index : "+user_index+" is logined : "+session.getAttribute("logined").toString());
		if(session.getAttribute("Admin").toString().equals("true")){
			pageContext.setAttribute("isAdmin", true);
			logger.debug("[Hi Admin]");
		}
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
<c:set var="search_" value="${param.search}"></c:set>
<c:set var="uri" value="QnASearch.qna?search_criteria=${param.search_criteria}&search=${search_}&page="></c:set>
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
	
	<!--------------------------------게시판 테이블-------------------------------------->
	<div class="container" style="padding-top: 100px;">
		<table class="table table-hover" >
		<thead>
		<tr>
			<td>
				QnA
			</td>
			<td colspan="4" align="right">
				<form action="QnASearch.qna" method="get">	
					<select name="search_criteria">
						<option value="qna_title" selected="selected">제목</option>
						<option value="qna_author">작성자</option>
					</select>
					
					<input type="text" name="search"  value="${search_}">
					<input type="hidden" name="page" value="1">
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
					<td><a href="QnARead.qna?page=${param.page }&qna_index=${qnaList.get(status.index).getQna_index() }">${qnaList.get(status.index).getQna_title() }</a></td>
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
			
			
			
			<c:if test="${currentPage > 1}"><li><a href="${uri}${currentPage-1 }">&lt;</a></c:if>
			<c:if test="${currentPage-2 > 0}"><li><a href="${uri}${currentPage-2 }">${currentPage-2 }</a></c:if>
			<c:if test="${currentPage-1 > 0}"><li><a href="${uri}${currentPage-1 }">${currentPage-1 }</a></c:if>
			<li><a><b>${currentPage}</b></a>
			<c:if test="${currentPage+1 <= maxPage}"><li><a href="${uri}${currentPage+1 }">${currentPage+1 }</a></c:if>
			<c:if test="${currentPage+2 <= maxPage}"><li><a href="${uri}${currentPage+2 }">${currentPage+2 }</a></c:if>
			<c:if test="${currentPage < maxPage}"><li><a href="${uri}${currentPage+1 }">&gt;</a></c:if>
			
		</ul>	
	</div>	
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type = "text/javascript" src="/js/bootstrap.js"></script>
</body>
</html>