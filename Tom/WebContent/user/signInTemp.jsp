<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.setMaxInactiveInterval(10);
session.setAttribute("logined","true");

String user_index = request.getAttribute("user_index_temp").toString();
session.setAttribute("user_index", user_index);
%>
<script>
	location='user/signIn.jsp'
</script>