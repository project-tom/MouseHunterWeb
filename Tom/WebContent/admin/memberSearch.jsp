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
<title>MemberSearch</title>
<style>
	#page{ padding: 5px; width: auto; margin: 20px auto;}
	#header{ height: 50px; margin: 0px;}
	#main{ padding-bottom: 20px; width: 100%; height: auto; float: left; margin-top: 30px; }
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
	<div class="container" style="padding-top: 100px;">
		<table class="table table-hover" >
		<thead>
		<tr>
			<td>
				회원검색
			</td>
			<td colspan="7" align="right">
				<form action="QnASearch.qna" method="get">	<!-- 여기 수정해야함 -->
					<select name="search_criteria">
						<option value="qna_title" selected="selected">이름</option>
						<option value="qna_author">아이디</option>
					</select>
					
					<input type="text" name="search" value="${param.search}" >
					<input type="hidden" name="page" value="1">
				 <input type="submit" value="검색" class="btn btn-xs">
				</form>
				</td>
			</tr>
		</thead>
		<thead>
		<tr>
			<th align="center">아이디</th>
			<th align="center">이름</th>
			<th align="center">성별</th>
			<th align="center">이메일</th>
			<th align="center">휴대폰</th>
			<th align="center">생일</th>
			<th align="center">주소</th>
			<th align="center">회원삭제</th>
		</tr>
		</thead>
		<tbody style="background-color: #B1EFFF">
			<c:forEach var="vo" items="${userList}" varStatus="status">
				<tr>
					<td>${userList.get(status.index).getUser_id()}</td>
					<td>${userList.get(status.index).getUser_name()}</td>
					<td>${userList.get(status.index).getUser_gender()}</td>
					<td>${userList.get(status.index).getUser_email()}</td>
					<td>${userList.get(status.index).getUser_phone()}</td>
					<td>${userList.get(status.index).getUser_birth()}</td>
					<td>${userList.get(status.index).getUser_address()}</td>
					<td><a class="btn btn-default" href="../Delete.user?user_id=${userList.get(status.index).getUser_id()}&page=${param.page}">삭제</a></td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>	
	<hr/>
	
	<div class="text-center">
		<ul class="pagination">
		
			<c:set var="currentPage" value="${param.page}"></c:set>
			<c:set var="total" value="${totalUser}"></c:set>
			<c:choose>
				<c:when test="${total%10 == 0}">
					<c:set var="maxPage" value="${total/10}"></c:set>
				</c:when>
				<c:otherwise>
					<c:set var="maxPage" value="${(total-total%10)/10+1}"></c:set>
				</c:otherwise>
			</c:choose>
			
		
			<c:set var="uri" value="UserList.user?page="></c:set>
		
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
<!----------------------------------풋터---------------------------------->
	<%@ include file="/bar/footer.jsp"%>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type = "text/javascript" src="/js/bootstrap.js"></script>
</div>	
</body>
</html>