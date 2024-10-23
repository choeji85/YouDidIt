<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>수고했어 오늘도</title>
        <link rel="stylesheet" href="css/index.css">
    </head>
    <body>
        <div id="wrap">
            <div id="title">
                <h1>수고했어 오늘도 <span class="star">♣</span></h1>
            </div>
            <div id="header">
                <div class="saying">
                    <h2><span class="star">긍정확언:</span> </h2>
                </div>
                <div class="login">
                    <form method="post" action="login.do" name="frm"> 
	                    <span class="input">아이디</span><input name="id" type="text"><br>              
	                    <span class="input">비밀번호</span><input name="pw" type="password"><br>
	                    <h5>
	                    	<input type="submit" value="로그인" onclick="return check()">
	                    	<input type="button" value="회원가입" onclick="reg()">
	                    </h5>
                    </form>
                </div>
            </div>
            <div id="body">
                <div class="left">
                    <h3>오늘 한 일</h3>
                    <ul class="did">
                    	<p>입력된 항목을 클릭하면 사라집니다.</p>
                        <li>
                        	<input type="text" placeholder="오늘 한 일은? ex)설거지">
                        	<input type="submit" id="did" value="입력">
                        </li>
                    </ul>
                </div>
                <div id="calandar">
                	<jsp:include page="calandar.jsp"></jsp:include>    
                </div>
                <div class="right">
                    <h3>오늘 할 일</h3>
                    <ul class="willdo">
                    	<p>입력된 항목을 클릭하면 사라집니다.</p>
                        <li>
                        	<input type="text" id="willdoIn" placeholder="오늘 할 일은? ex)책상 정리">
                        	<input type="submit" id="willdo" value="입력">
                        </li>
                    </ul>
                </div>
            </div>
            <div id="footer">
				<p>ⓒJihyang Choi</p>
            </div>
        </div>
	    <script src="script/index.js"></script>
    </body>
</html>