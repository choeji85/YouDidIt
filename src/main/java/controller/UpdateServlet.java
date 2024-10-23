package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import DAO.MemberDAO;
import DTO.Member;


@WebServlet("/update.do")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		System.out.println("update.doGet실행확인!: "+id);
		MemberDAO mDAO=MemberDAO.getInstance();
		Member m=mDAO.getMember(id); //데이터베이스에서 검색된 7개의 데이터를 담은 객체
		request.setAttribute("mem", m);	//리퀘스트동안 데이터가 소멸하지 않고 목적지까지 살아있음.
		RequestDispatcher dis=request.getRequestDispatcher("edit.jsp");
		dis.forward(request, response);		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("update.doPost실행확인!");
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("nm");
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		String u_level=request.getParameter("u_level");
		Member m=new Member();
		m.setName(name);
		m.setPw(pw);
		m.setId(id);
		m.setEmail(email);
		m.setPhone(phone);
		m.setAddress(address);
		m.setU_level(u_level);
		MemberDAO mDAO=MemberDAO.getInstance();
		mDAO.updateMember(m);
		response.sendRedirect("login.do");
	}

}
