<%
/*
		  	FILE : IDCheckResultForApp.jsp
		  AUTHOR : Yeh Seob Lee
   LAST MODIFIED : 2019 - 04- 03
		 COMMENT : ID 중복체크에 따른 결과 출력 페이지
		 		     중복되는 아이디가 없을시 true를 앱에 전송
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%=request.getAttribute("result").toString()%>
