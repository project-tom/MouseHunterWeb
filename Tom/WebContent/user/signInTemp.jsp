<%@page import="org.apache.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	static Logger logger = Logger.getLogger("signInTemp.jsp");
%>
<%
session.setMaxInactiveInterval(60*10);


String user_index = request.getAttribute("user_index_temp").toString();

if(user_index.equals("")){
	session.setAttribute("logined","false");
	logger.debug("Login Failed...");
}else{
	if(session.getAttribute("logined")!=null){
		session.removeAttribute("logined");
	}
	if(request.getAttribute("remember_ID")!=null &&request.getAttribute("remember_ID").toString().equals("remember_ID")){
		Cookie cookie = new Cookie("user_id",request.getAttribute("user_id").toString());
		cookie.setMaxAge(600);
		response.addCookie(cookie);
	}
	session.setAttribute("logined","true");
	session.setAttribute("user_index", user_index);
	session.setAttribute("user_name", request.getAttribute("user_name").toString());
	
	logger.debug("[Session Create]");
	logger.debug("Login Success!");
	logger.debug("::: user_index : "+user_index+" is logined : "+session.getAttribute("logined").toString()+" :::");

	if(request.getAttribute("admin")!=null&&request.getAttribute("admin").toString().equals("true")){
		session.setAttribute("Admin", "true");
	}else{
		session.setAttribute("Admin", "false");
	}
}

%>
<script>
	location='user/signIn.jsp'
</script>