<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 조회 페이지</title>
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
		</style>
	</head>
	<body>
		<%
			Connection conn=null; //통로
			Statement stmt=null;  //데이터를 보내줄 객체
			ResultSet rs=null;	//데이터를 받아올 객체
			
			String url="jdbc:mysql://127.0.0.1:3306/portfolio";//프로토콜 지정 (접속경로, db이름)
			String db_id="root";
			String db_pw="iotiot";//데이터베이스 설치시 설정했던 id와 비번임
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");//그냥 이름이 이렇게 생겼다..포함관계 이런건 아님
				conn=DriverManager.getConnection(url,db_id,db_pw);
				String sql="select * from user;";
				stmt=conn.createStatement();
				//System.out.println(sql); //이거는 공부할 때 꼭 남기기..
				rs=stmt.executeQuery(sql);
				%>
					<div id="wrap">
						<table>
							<tr>
								<th>회원번호</th>
								<th>아이디</th>
								<th>비밀번호</th>
								<th>이름</th>
								<th>이메일</th>
								<th>전화번호</th>
								<th>주소</th>
								<th>회원등급</th>
								<th>삭제</th>
							</tr>
				<%
					while(rs.next()){
						String num=rs.getString("num");
						String id=rs.getString("id");
						String pw=rs.getString("pw");
						String name=rs.getString("name");
						String email=rs.getString("email");
						String phone=rs.getString("phone");
						String address=rs.getString("address");
						String u_level=rs.getString("u_level");
						%>
							<tr>
								<td><%=num %></td>
								<td><%=id %></td>
								<td><%=pw %></td>
								<td><%=name %></td>
								<td><%=email %></td>
								<td><%=phone %></td>
								<td><%=address %></td>
								<td><%=u_level %></td>
								<td>
									<form method="post" action="delete.jsp">
										<input type="hidden" value="<%=num %>"name="del">
										<input type="submit" value="삭제">
									</form>
								</td>
							</tr>
						<%
					}
				%>
						</table>
					</div>
				<%
			}catch(Exception e){
				System.out.println("접속 중 오류발생: "+e);
			}finally{
				try{
					if(rs!=null)rs.close();
					if(stmt!=null)stmt.close();
					if(conn!=null)conn.close();
				}catch(Exception ex){
					System.out.println("접속 해제 중 오류발생: "+ex);
				}
			}
		%>
	</body>
</html>