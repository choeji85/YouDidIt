<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
		<link rel="stylesheet" href="css/insert.css">
		<script src="script/insert.js"></script>
	</head>
	<body>
		<div id="wrap">
			<div class="title">
			<h1>회원가입</h1>
			<hr>
			</div>
			<div class="form">
			<form method="get" action="register.jsp">
				<span>아이디 : </span><input type="text" name="id" required autofocus>
				<a href="id_check.jsp">중복확인</a><br>
				<span>비밀번호 : </span><input type="password" name="pw" required><br>
				<span>이름 : </span><input type="text" name="nm" required><br>
				<span>이메일 : </span><input type="text" name="em" required><br>
				<span>연락처 : </span><input type="text" name="ph" ><br>
				<span>주소 : </span><input type="text" name="ad"><br>
				<input type="hidden" name="ulev" value="0">
			<div class="button">
				<input type="submit" value="회원가입">
				<input type="reset" value="다시쓰기">
			</div>
			</form>
			</div>
		</div>
	</body>
</html>