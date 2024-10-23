<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 정보 수정</title>
		<style>
			#wrap{
				margin:0 auto;
				width: 700px;
				border:10px solid lightgrey;
				padding:50px;
			}
			th,td{
				border: 1px solid black;
				padding: 10px;
			}
			table{
				border-collapse:collapse;
			}
			span{
				display:inline-block;
				width:200px;
			}
			input{
				margin-top:10px;
			}
			input[type="submit"]{
				background-color:white;
				font-weight:600;
			}
		</style>
	</head>
	<body>
		<form method="post" action="update.do" name="frm">
			<table>
				<tr>
					<td>이름</td>
					<td><input type="text" name="nm" value="${mem.name }"></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" value="${mem.id }"></td>
				</tr>
				<tr>
					<td>비밀번호 변경</td>
					<td><input type="password" name="pw"></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="pw_check" ></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email" value="${mem.email }"></td>
				</tr>	
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="phone" value="${mem.phone }"></td>
				</tr>	
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" value="${mem.address }"></td>
				</tr>
				<tr>
					<td>관리자여부</td>
					<td><input type="text" name="admin" value="${mem.u_level }" readonly></td>
				</tr>
				<tr>
					<td>입력</td>
					<td>
						<input type="submit" value="정보수정!" onclick="return upCheck()">
						<input type="reset" value="초기화">
					</td>
				</tr>														
			</table>
		</form>
		<script>
			function upCheck(){
				if(document.frm.nm.value.length==0){
					alert("변경하실 이름을 입력해 주세요");
					document.frm.nm.focus();
					return false;
				}
				if(document.frm.pw.value==""){
					alert("변경하실 비밀번호를 입력해 주세요");
					document.frm.pw.focus();
					return false;	
				if(document.frm.pw.value!=document.frm.pw_check.value)){
					alert("비밀번호 확인이 다릅니다. 다시 입력해 주세요");
					document.frm.pw_check.focus();
					return false;					
				}
				if(document.frm.email.value==""){
					alert("변경하실 이메일을 입력해 주세요");
					document.frm.email.focus();
					return false;					
				}
				if(document.frm.phone.value==""){
					alert("변경하실 연락처를 입력해 주세요");
					document.frm.phone.focus();
					return false;					
				}
				if(document.frm.address.value==""){
					alert("변경하실 주소를 입력해 주세요");
					document.frm.address.focus();
					return false;					
				}
				return true;
			}
		</script>
	</body>
</html>