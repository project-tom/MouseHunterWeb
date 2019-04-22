<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="header">
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" 
				aria-expanded="false"> <!-- toggle: 단추, 온오프 스위치 --> <!-- collapse: 붕괴하다, 무너지다  -->
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="../user/signIn.jsp">MouseHunter</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"> 
			<ul class="nav navbar-nav">
				<li><a href="../QnAList.qna?page=1">QnA</a></li>
				<li><a href="../PointListWeb.po?user_index=${pageScope.user_index }">Map</a></li>
				<c:choose>
					<c:when test="${pageScope.userLogined == 'true'}">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">MyPage<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li class="active"><a href="/user/logout.jsp">로그아웃</a></li>
								<li><a href="/user/signUserCheck.jsp?flag=Modify">회원정보수정</a></li>
								<li><a href="/user/signUserCheck.jsp?flag=Withdrawal">회원탈퇴</a></li>
							</ul>	
						</li>
					</c:when>
					<c:otherwise>
						<li><a href="/user/signUp.jsp">Sign Up</a></li>
					</c:otherwise>
				</c:choose>
				
			</ul>
		</div>
	</nav>
</div>