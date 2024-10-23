<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입 페이지</title>
		<style>
			
		</style>
	</head>
	<body>
		<h1>여기는 회원가입 페이지 입니다.</h1>
		<form method="post" action="join.do" name="frm">
			<table>
				<tr>
					<td>이름</td>
					<td><input type="text" name="nm"></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="id">
						<input type="hidden" name="reId"><!-- 중복확인한 아이디 말고 엉뚱한 다른아이디 입력했는지 비교하기 위한 부분 -->
						<input type="button" value="중복확인" onclick="idCheck()">
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw"></td>
				</tr>	
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="pw_check"></td>
				</tr>				
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email"></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<td>등급</td>
					<td>
						<input type="radio" name="u_level" value="1">관리자<br>
						<input type="radio" name="u_level" value="0" checked>일반회원
					</td>
				</tr>
				<tr>
					<td>입력</td>
					<td>
						<input type="submit" value="회원가입" onclick="return joinCheck()">
						<input type="reset" value="초기화"> <!-- 모바일에서는 이거 만들면 욕많이 먹는다 -->
					</td>
				</tr>																							
			</table>
		</form>
		<script>
			function idCheck(){
				if(document.frm.id.value==""){
					alert("아이디를 입력하셔야 중복확인이 가능합니다.");
					document.frm.id.focus();
				}
				var url="idCheck.do?id="+document.frm.id.value;	//get통신 경로
				//alert(url+"로 데이터를 전송합니다."); 확인용이니 주소 잘 확인후 삭제하는 코드
				var popupX=(window.screen.width/2)-(450/2);	//기준 좌표에서 X방향으로 화면이 등장하는 위치
				var popupY=(window.screen.height/2)-(200/2);	//기준 좌표에서 Y방향으로 화면이 등장하는 위치
				window.open(url,"_blank_1", "toolbar=no, width=450, height=200, left="+popupX+", top="+popupY);//새창으로 띄운다는 것(요새는 거의 안사용되는 기법. 브라우저에 따라 안되는데도 있음)
			}
			function joinCheck(){
				if(document.frm.nm.value.length==0){ //value=="" 라고 써도 같은 코드임. 이름안적었는지 체크기능
					alert("이름을 입력해 주세요");
					document.frm.nm.focus();
					return false;	//이게 없으면 alert를 띄우고나서 다음 창으로 넘어가버림. 못넘어가게 막는 기능
				}
				if(document.frm.id.value.length==0){
					alert("아이디를 입력해 주세요");
					document.frm.id.focus();
					return false;
				}
				if(document.frm.id.value.length<4){	//아이디 작명 규칙 확인
					alert("아이디는 반드시 4문자 이상으로 만들어 주셔야 합니다.");
					document.frm.id.focus();
					return false;
				}
				if(document.frm.pw.value==""){
					alert("비밀번호는 반드시 입력하셔야 합니다.");
					document.frm.pw.focus();
					return false;
				}
				if(document.frm.pw.value!=document.frm.pw_check.value){
					alert("비밀번호 확인을 다시 해주세요.");
					document.frm.pw.focus();
					return false;
				}
				if(document.frm.reId.value.length==0){
					alert("아이디 중복확인이 필요합니다.");
					document.frm.id.focus();
					return false;
				}
				return true;
			}
		</script>
	</body>
</html>