<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>데이터 삭제 처리기</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");
			String del=request.getParameter("del");
			
			String sql="delete from user where num="+del+";";
			
			Connection conn=null;
			Statement stmt=null;
			
			String url="jdbc:mysql://127.0.0.1:3306/portfolio";
			String db_id="root";
			String db_pw="iotiot";
			
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn=DriverManager.getConnection(url,db_id,db_pw);
				stmt=conn.createStatement();
				stmt.executeUpdate(sql);
				response.sendRedirect("member.jsp");
			}catch(Exception e){
				System.out.println("delete.jsp 접속 중 오류발생: "+e);
			}finally{
				try{
					if(stmt!=null)stmt.close();
					if(conn!=null)conn.close();
				}catch(Exception ex){
					System.out.println("delete.jsp 접속 해제 중 오류발생: "+ex);
				}
			}
		%>
	</body>
</html>