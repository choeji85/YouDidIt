package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import DAO.MemberDAO;	//로그인 메서드, Connection 연결처리, 싱글톤 구현
import DTO.Member;		//객체정보를 확인할 수 있는 설계도 위치


@WebServlet("/login.do")	//화면에 보여질 주소, doGet이 실행됨..
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//a태그 또는 도메인 직접입력, Ajax get호출 등의 방식에서 doGet실행 *********************************
		RequestDispatcher dis=request.getRequestDispatcher("login.jsp");//실제 보여지는 화면주소
		dis.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//form태그 post submit또는 ajax post호출 등의 방식에서 doPost실행 *******************************
		String url="index.jsp";
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String u_level=request.getParameter("u_level");
		//MemberDAO mDAO=new MemberDAO(); 이거는 실행불가..private으로 생성자 막아둔거라..
		MemberDAO mDAO=MemberDAO.getInstance();	//회선이 여러개 생기는 경우 발생할 수 있는 문제 원천차단
		int result=mDAO.userCheck(id, pw);

		if(result==1) {	//로그인 성공
			HttpSession session=request.getSession();//앞에것만 쓰면 그동안 쓰고있었던 세션..
			//근데 서블릿에서 세션을 땡겨쓰려면 request를 통해야 함.
			Member m=mDAO.getMember(id);	//해당 아이디가 가지고 있는 DB정보를 저장한 객체 생성	
			session.setAttribute("loginUser",m);	//세션에 회원정보를 가진 객체를 저장
			//session.setAttribute("loginUser", "회원정보객체를 저장");
			request.setAttribute("message", "로그인에 성공하셨습니다.");
			if(id=="admin") {
				url="main1.jsp";
			}else{			
				url="main0.jsp";	//로그인에 성공한 사람은 main 화면으로 이동
			}
		}else if(result==0) {	//아이디는 있는데 입력된 비밀번호랑 가입된 비밀번호가 다른경우
			request.setAttribute("message", "비밀번호가 맞지 않습니다.");			
		}else if(result==-1) {	//회원가입이 되지 않은 경우, select문의 결과가 empty set 인 경우 userCheck메서드의 return 이 -1 인경우
			request.setAttribute("message", "존재하지 않는 회원입니다.");			
		}
		RequestDispatcher dis=request.getRequestDispatcher(url);
		dis.forward(request, response); 
	}
}
