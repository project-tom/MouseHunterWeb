<%
/*
		  	FILE : SignUpResultForApp.jsp
		  AUTHOR : Yeh Seob Lee
   LAST MODIFIED : 2019 - 04- 03
		 COMMENT : 회원가입에 따른 결과 출력 페이지
		 		     회원가입 성공시 true를 앱에 전송
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%=request.getAttribute("result").toString()%>
