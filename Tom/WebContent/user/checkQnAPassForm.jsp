<%@page import="org.tom.domain.QnAVO"%>
<%@page import="org.tom.persistence.QnADAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
비밀번호를 입력하세요.<br>
<form action="/user/checkQnAPass.jsp?page=${param.page }&index=${param.index}" method="post">
	<input type="password" name="pw"><br>
	<input type="submit" value="전송">
</form>
</body>
</html>