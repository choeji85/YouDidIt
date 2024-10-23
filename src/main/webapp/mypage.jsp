<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지</title>
		<link rel="stylesheet" href="css/mypage.css">
	</head>
	<body>
		<div id="wrap">
			<div class="title">
			<h1>회원정보확인</h1>
			<hr>
			</div>
			<div class="form">
			<form method="get" action="register.jsp">
				<span>아이디 : </span><input type="text" name="id" readonly>
				<span>비밀번호 : </span><input type="password" name="pw">
								<a href="#">수정</a><br>
				<span>이름 : </span><input type="text" name="nm" readonly><br>
				<span>이메일 : </span><input type="text" name="em" readonly><br>
				<span>연락처 : </span><input type="text" name="ph" readonly><br>
				<span>주소 : </span><input type="text" name="ad" readonly><br>
				<input type="hidden" name="ulev" value="0">
			<div class="button">
				<input type="submit" value="수정하기">
				<input type="button" value="메인페이지로">
			</div>
			</form>
			</div>
		</div>
	</body>
</html>