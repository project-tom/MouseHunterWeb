<%
/*
		  	FILE : PointUpdateResultForApp.jsp
		  AUTHOR : Yeh Seob Lee
   LAST MODIFIED : 2019 - 04- 03
		 COMMENT : 좌표 제거/수정에 따른 결과 출력 페이지
		 		     좌표 제거/수정 성공시 제거된 행의 수를 앱에 전송
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%=request.getAttribute("result").toString()%>
