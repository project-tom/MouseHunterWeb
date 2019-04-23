<%@page import="org.tom.encryption.PasswordEncryption"%>
<%@page import="org.tom.domain.QnAVO"%>
<%@page import="org.tom.persistence.QnADAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	QnADAOImpl dao = new QnADAOImpl();
	QnAVO vo = new QnAVO();
	vo.setQna_pass(new PasswordEncryption(request.getParameter("pw")).getPass());
	int index = Integer.parseInt(request.getParameter("index"));
	vo.setQna_index(index);
	pageContext.setAttribute("index", index);
	boolean result = dao.qnaCheckPW(vo);
	String msg;
	if(result){
		msg = "삭제하시겠습니까?";
	}else{
		msg = "Password가 틀렸습니다.";
	}
	pageContext.setAttribute("result", result);
	pageContext.setAttribute("msg",msg);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>checkQnAPass</title>
<script type="text/javascript">
	function Delete(){
		window.opener.location.href="../QnADelete.qna?page="+${param.page }+"&index="+${pageScope.index};
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
		<button onclick="Delete()">확인</button>
		<button onclick="windowClose()">취소</button>
	</c:when>
	<c:otherwise>
		<button onclick="windowClose()">확인</button>
	</c:otherwise>
</c:choose>
</body>
</html>