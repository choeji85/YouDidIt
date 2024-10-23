<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 가입 처리기</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8"); //한글깨짐방지
			String id=request.getParameter("id");	//input name="id"를 받아옴
			String pw=request.getParameter("pw");
			String name=request.getParameter("nm");
			String email=request.getParameter("em");
			String phone=request.getParameter("ph");
			String address=request.getParameter("ad");
			String u_level=request.getParameter("ulev");
		
			Connection conn=null;
			Statement stmt=null;
			ResultSet rs=null;
			
			String url="jdbc:mysql://127.0.0.1:3306/portfolio";
			String db_id="root";
			String db_pw="iotiot";
			try{				
				Class.forName("com.mysql.cj.jdbc.Driver");//자바에선 이게 필요 없었는데 다이나믹프로젝트에선 필요
				conn=DriverManager.getConnection(url, db_id, db_pw);
				String sql="insert into user (id, pw, name, email, phone, address, u_level) values(";
				sql+="'"+id+"','"+pw+"','"+name+"','"+email+"','"+phone+"','"+address+"','"+u_level+"');";
				stmt=conn.createStatement();
				stmt.execute(sql);
					//Statement.execute() :return boolean insert 문에 사용
					//Statement.executeQuery(): return ResultSet select 문에 사용
					//Statement.executeUpdate() : return int --변경시킨 줄 갯수를 반환함.
				response.sendRedirect("member.jsp");
			}catch(Exception e){
				System.out.println("접속 중 오류 발생: "+e);				
			}finally{
				try{
					if(rs!=null)rs.close();
					if(stmt!=null)stmt.close();
					if(conn!=null)conn.close(); //열어준 것 역순으로 닫아줌
				}catch(Exception ex){
					System.out.println("접속 해제중 오류 발생: "+ex);
				}
			}
		%>
	</body>
</html>