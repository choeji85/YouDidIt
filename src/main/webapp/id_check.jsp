<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%--태그 이름을 c라는 글자를 붙여서 쓰겠다..는의미 --%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 중복확인</title>
	</head>
	<body>
		<h1>아이디 중복 확인</h1>
		<form method="get" action="idCheck.do" name="frm">
			아이디:<input type="text" name="id" value="${id}">
			<input type="submit" value="중복확인!">
			<br>
			<c:if test= "${result== 1 }">
				${id }는 이미 사용중인 아이디입니다.
			</c:if>
			<c:if test= "${result==-1 }">
				${id }는 사용가능합니다.
				<input type="button" value="사용하기" onclick="idok()">
			</c:if>
		</form>
		<script>
			function idok(){
				//opener : 현재 보고있는 창을 띄워준 원인이 되는 창
				//self : 현재 보고있는 창
				opener.document.frm.id.value=document.frm.id.value;
				opener.document.frm.reId.value=document.frm.id.value;
				self.close();
			}
		</script>
	</body>
</html>