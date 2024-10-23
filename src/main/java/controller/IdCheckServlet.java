package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import DAO.MemberDAO;	//아이디 중복체크 메서드가 여기 있음

@WebServlet("/idCheck.do")
public class IdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		MemberDAO mDAO=MemberDAO.getInstance();		// 데이터베이스를 접속하기위한 객체
		int result=mDAO.confirmID(id);
		request.setAttribute("id", id); 	//EL로 userid를 확인할 수 있는 처리
		request.setAttribute("result", result);
		RequestDispatcher dis=request.getRequestDispatcher("id_check.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
