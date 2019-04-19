<%@page import="org.tom.domain.UserVO"%>
<%@page import="org.tom.persistence.UserDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	UserDAOImpl dao = new UserDAOImpl();
	UserVO vo = new UserVO();
	vo.setUser_id(request.getParameter("id"));
	boolean result = dao.userCheckID(vo);
	String msg;
	if(result){
		msg = "사용 가능한 ID 입니다.";
	}else{
		msg = "사용할수 없는 ID 입니다.";
	}
	pageContext.setAttribute("result", result);
	pageContext.setAttribute("msg",msg);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function sendCheckValue(){
		opener.document.userInfo.idChecked.value = "Checked";
		self.close();
	}
	function windowClose(){
		self.close();
	}
</script>
</head>
<body>

${msg}
<c:choose>
	<c:when test="${result}">
		<button onclick="sendCheckValue()">확인</button>
	</c:when>
	<c:otherwise>
		<button onclick="windowClose()">확인</button>
	</c:otherwise>
</c:choose>


</body>
</html>