<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="card-title">
	<p style="font-size:24px;" class="card-title text-left" style="color:black;"><strong>쥐를 잡자 쥐를 잡자</strong></p>
	<p style="font-size:24px;" class="card-title text-left" style="color:black;"><strong>쥐쥐쥐~^0^</strong></p><br>
</div>
<div class="card-body">
	<form action="../SignIn.user" class="form-signin" method="POST" onSubmit="logincall();return false">
		<input type="text" id="uid" class="form-control" placeholder="아이디를 입력하세요 " name="user_id" required autofocus >
		<input type="password" id="upw" class="form-control" placeholder="비밀번호를 입력하세요" name="user_pw" required>
		<input type="hidden" name="fromWeb" value="true">
		<div class="checkbox">
			<label class="pull-left">
				<input type="checkbox" value="remember-me" > 기억하기
			</label>
		<button class="btn pull-right " type="submit" >로그인</button>
		</div>
	</form>
</div>