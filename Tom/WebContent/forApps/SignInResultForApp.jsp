<%
/*
		  	FILE : SignInResultForApp.jsp
		  AUTHOR : Yeh Seob Lee
   LAST MODIFIED : 2019 - 04- 03
		 COMMENT : 로그인에 따른 결과 출력 페이지
		 		     로그인 성공시 true와 해당 사용자의 회원번호를 앱에 전송
*/
%>
<%@page import="jdk.nashorn.internal.parser.JSONParser"%>
<%@page import="java.io.Reader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%=request.getAttribute("result").toString()%>
[<%=request.getAttribute("user_index_temp") %>]
