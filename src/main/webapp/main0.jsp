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
                    <h2><span class="star">긍정확언:</span> 오늘은 나에게 좋은 일이 생길 거에요</h2>
                </div>
                <div class="login">
                	<h3>안녕하세요 ${loginUser.name }(${loginUser.id })님</h3>
                	<div class="lmenu">
                    	<h5><a href="update.do?userid=${loginUser.id }">회원정보 수정</a></h5>
                    	<h5><a href="logout.do">로그아웃</a></h5>
                   	</div>
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
	    <script src="script/main.js"></script>
    </body>
</html>