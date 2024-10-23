<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인 처리 페이지</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");
		
			String inputID=request.getParameter("user_id");
			String inputPW=request.getParameter("user_pw");
			session.setAttribute("inputID",inputID);
			
			
			//다음의 쿼리문을 이용하여 비교하시오(교수님 작성)
			//select pw, u_level from user where id=입력된 아이디;
			//ResultSet.getString("pw").equals(입력된 비밀번호);
			//ResultSet.getString("u_level").equals("1")
			
			Connection conn=null;
			Statement stmt=null;
			ResultSet rs=null;
			
			String url="jdbc:mysql://127.0.0.1:3306/portfolio";
			String db_id="root";
			String db_pw="iotiot";

			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn=DriverManager.getConnection(url,db_id,db_pw);
				String sql="select pw, u_level from user where id='"+ inputID+"'";
				stmt=conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				String userPW=null;
				while(rs.next()){
					userPW = rs.getString(1);
				}				
				
				if(inputID.equals("admin") && inputPW.equals("1111")){
					//지금 관리자가 로그인한 상태
					out.print("<h1>관리자님 접속을 환영합니다.</h1>");
					session.setAttribute("grade","관리자");
					response.sendRedirect("main1.jsp");
				}else if(userPW.equals(inputPW)){
					out.print("<h1>회원님 접속을 환영합니다.</h1>");
					session.setAttribute("grade","일반회원");
					response.sendRedirect("main0.jsp");	//Java를 이용한 페이지 강제이동			
				}else{
					//로그인 실패
					%>
						<script>
							alert("로그인에 실패하셨습니다.");
							location.href="index.jsp";//JavaScript를 이용한 페이지 강제이동
						</script>
					<%
				}

			}catch(Exception e){
				System.out.println("로그인 접속 중 오류발생: "+e);
			}finally{
				try{
					if(rs!=null)rs.close();
					if(stmt!=null)stmt.close();
					if(conn!=null)conn.close();
				}catch(Exception ex){
					System.out.println("로그인 접속해제중 오류 발생: "+ex);
				}
			}
			%>
	</body>
</html>