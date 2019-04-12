<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>
<form action="SignUp.user" method="post">
	<ul>
		<li>ID :<input type="text" name = "id">
		<li>PW : <input type="password" name = "pw">
		<li>이름 :<input type="text" name = "name">
		<li>이메일 : <input type="text" name = "email">
		<li>생일 : <input type="text" name ="year"> - <input type="text" name="month"> - <input type ="text" name = "day">
		<li>성별 : 남<input type="radio" name = "gender" value = "남" >여<input type = "radio" name = "gender" value ="여">
		<li>연락처 : <input type="text" name = "phone1">-<input type="text" name = "phone2">-<input type="text" name = "phone3">
		<li>주소 : <input type="text" name= "address">
		<li> <input type ="submit" value="전송">
	</ul>
</form>
</body>
</html>