package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import DTO.Member; //데이터를 전송할 때 데이터를 담을 멤버 객체를 생성하기 위해서 반드시 필요
import DAO.MemberDAO; //데이터를 전송할 회선과 방식의 설계도

@WebServlet("/join.do")//doGet doPost를 쓰겠다는 의미라서 .do를 씀...근데 안써도 되고 큰 의미가 없음..(자매품 .io .ai 등)
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("join.doGet() 실행확인");
		RequestDispatcher dis=request.getRequestDispatcher("register1.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//입력받은 패러미터를 담아와서 sql문을 만들어서 데이터베이스에 전송하는 기능
		//register.jsp에서 form태그를 통해 전송한 데이터를 받아 변수에 저장하는 부분
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("nm");
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		String u_level=request.getParameter("u_level");
		//System.out.println(name+","+userid+","+pwd+","+email+","+phone+","+admin); 개발 시 확인용 코드
		
		//Member객체에 변수의 데이터를 저장하는 부분
		Member m=new Member();
		m.setName(name);
		m.setId(id);
		m.setPw(pw);
		m.setEmail(email);
		m.setPhone(phone);
		m.setAddress(address);
		m.setU_level(u_level);
		//데이터베이스에 해당 내용 전달
		MemberDAO mDAO=MemberDAO.getInstance();
		int result=mDAO.insertMember(m);
		//회원가입기능은 위의 코드까지...아래는 걍 고객서비스용
		//입력처리 이후 서비스 제작
		HttpSession session=request.getSession();
		if(result==1) {//회원가입 성공
			session.setAttribute("id", m.getId());	//바로 로그인이 되는 경우 이 기능 사용
			request.setAttribute("message", "회원가입에 성공하셨습니다.");
		}else if(result==-1) {//회원가입에 오류 발생
			request.setAttribute("message", "회원가입에 실패하셨습니다.");
		}
		RequestDispatcher dis=request.getRequestDispatcher("login.do");
		dis.forward(request, response);
	}
}
