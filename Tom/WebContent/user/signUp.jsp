<%@page import="org.apache.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
static Logger logger = Logger.getLogger("signUp.jsp");
String user_index;
%>
<%
	logger.debug("[Page Load...] : signUp.jsp");
	if(session.getAttribute("logined")!=null && session.getAttribute("logined").equals("true")){
		user_index = session.getAttribute("user_index").toString();
		pageContext.setAttribute("userLogined", "true");
		logger.debug("user_index : "+user_index+" is logined : "+session.getAttribute("logined").toString());
		if(session.getAttribute("Admin").toString().equals("true")){
			pageContext.setAttribute("isAdmin", true);
			logger.debug("[Hi Admin]");
		}
	}
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>signUp</title>
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
	#main{background-color:  #B1EFFF;}	
	#footer{background-color: yellow;}	

</style>
<link rel="stylesheet" href="/css/bootstrap.css">
<script>
function IDCheck(){
	var url = "checkID.jsp?id="+document.userInfo.user_id.value;
	open(url,
		"CheckID",
		"toolbar=no,location=no,status=no,scrollbars=no,menubar=no,resizable=no,width=300,height=200");
}
function inputIdChk(){
    document.userInfo.idChecked.value ="unChecked";
}
function checkValue()
{
	var form = document.userInfo;
	if(form.idChecked.value != "Checked"){
        alert("아이디 중복체크를 해주세요!");
        return false;
    }
	if(form.user_pw.value.indexOf(form.user_id.value)>-1){
		alert("비밀번호에 ID가 포함되어 있습니다!");
        return false;
	}
}
</script>
</head>
<body>
<div id="page">
<!----------------------------------상단바(nav)---------------------------------->		
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

<!----------------------------------회원가입 테이블---------------------------------->

		<div id="main">
			<div class="container" style="padding-top: 100px;">
				<form action="../SignUp.user" method="POST" name="userInfo" onsubmit="return checkValue()">
				<table class="table" >
					<caption align="left"><strong>회원가입</strong></caption>
					<tbody >
					
					<tr>
						<th align="center" style="background-color:#D9D8D8" >아이디</th>
						<td><input type="text" name="user_id" onkeydown="inputIdChk()" required autofocus pattern="^[a-zA-Z0-9]{6,15}$"> 
							<input type="button" name="checkButton" value="중복검사" onclick="IDCheck()"> 아이디는 영어와 숫자만 가능 
							<input type="hidden" name="idChecked" value="unChecked"></td>
					</tr>	
					<tr>
						<th align="center" style="background-color: #D9D8D8">비밀번호</th>
						<td><input type="password" name="user_pw" style="width:300px;" required pattern="^[a-zA-Z0-9!@#$%^*+=-_]{8,20}$"></td>
					</tr>
					<tr>
						<th align="center" style="background-color: #D9D8D8">이름</th>
						<td><input type="text" name="user_name" style="width:300px;" required pattern="^[a-zA-Z가-힣]+$"></td>
					</tr>
					<tr>
						<th style="background-color: #D9D8D8">성별</th>
						<td><input type="radio" name="user_gender" value="man">남자
						 	<input type="radio" name="user_gender" value="woman">여자</td>
					</tr>
					<tr>
			            <th style="background-color: #D9D8D8">생년월일</th>
			            <td><input type="text" name="year" required pattern="^[0-9]{4}$"> 년
			             	<select name="month">
				             	<c:forEach var="i" begin="1" end="12">
				             		<option value="${i}" >${i}</option>
				             	</c:forEach>
			             	</select> 월 
			             	<select name="day">
				             	<c:forEach var="i" begin="1" end="31">
				             		<option value="${i}" >${i}</option>
				             	</c:forEach>
			             	</select> 일</td>
			        </tr>
			        <tr>
			            <th style="background-color: #D9D8D8">이메일</th>
			            <td><input type="text" name="user_email" pattern="^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$"></td>
			        </tr>
			        <tr>
			            <th style="background-color: #D9D8D8">전화번호</th>
			            <td><input type="text" name="phone1" required pattern="^010|011|016|017|018|019$"> - 
			            	<input type="text" name="phone2" required pattern="^[0-9]{3,4}$"> - 
			            	<input type="text" name="phone3" required pattern="^[0-9]{4}$"></td>
			        </tr>
			        <tr>
			            <th style="background-color: #D9D8D8">주소</th>
			            <td><input type="text" name="user_address" required>
			            	<input type="hidden" name="fromWeb" value="true"></td>
			        </tr>
					</tbody>
				</table>	
				<hr/>
				<button class="btn btn-default pull-right" type="submit" >가입</button>
				</form>
			</div>
		</div>
<!----------------------------------풋터---------------------------------->
		
		<div id="footer">
				<h2>Thank you for visiting</h2>
		</div>
		
		
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type = "text/javascript" src="/js/bootstrap.js"></script>
</body>
</html>