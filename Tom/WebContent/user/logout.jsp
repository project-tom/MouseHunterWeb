<%@page import="org.apache.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	static Logger logger = Logger.getLogger("signInTemp.jsp");
%>
<%
	session.removeAttribute("logined");
	logger.debug("[Session Remove Success] : logined");
	session.removeAttribute("Admin");
	logger.debug("[Session Remove Success] : Admin");
%>
<script>
	location='/user/signIn.jsp'
</script>