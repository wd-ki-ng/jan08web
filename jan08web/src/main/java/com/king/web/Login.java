package com.king.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.king.dao.LogDAO;
import com.king.dao.MemberDAO;
import com.king.dto.MemberDTO;
import com.king.util.Util;
//로그인---암호화
/*
 * member테이블
 * mno(pk,auto) mid(10) mpw(20) mname(10) mdate(datetime) int mgrade(1)
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDTO dto = new MemberDTO();
		HttpSession session = request.getSession();
		RequestDispatcher rd = null;
		String url = null;
		if(session.getAttribute("mname") !=null) {
			url = "already.jsp";
			//rd = request.getRequestDispatcher("already.jsp");
		} else {
			url = "login.jsp";
			//rd = request.getRequestDispatcher("login.jsp");
		}
		rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
		
		Map<String, Object> log = new HashMap<String, Object>();
		log.put("ip", Util.getIP(request));
		log.put("url", "./login");
		log.put("data", "id: " + dto.getMid() + ", pw: " + dto.getMpw() + "결과 : " + dto.getCount());
		
		LogDAO logDAO = new LogDAO();
		logDAO.write(log);
}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//2024-01-12 웹 서버프로그램 구현
		request.setCharacterEncoding("UTF-8");
		if(request.getParameter("id") != null && request.getParameter("pw") != null) {
			MemberDTO dto = new MemberDTO();
			dto.setMid(request.getParameter("id"));
			dto.setMpw(request.getParameter("pw"));
			
			MemberDAO dao = new MemberDAO();
			dao.login(dto);
			
			if(dto.getCount() == 1) {
				System.out.println("정상 로그인");
				//세션만들기******* 중요 *******
				HttpSession session = request.getSession();
				session.setAttribute("mname", dto.getMname());//mname이라는 이름으로 세션 만듦
				session.setAttribute("mid", dto.getMid());//mid라는 이름으로 세션 만듬

				//페이지 이동
				response.sendRedirect("./board");
				//request.getRequestDispatcher("board.jsp").forward(request, response);
				
				
			} else {
				System.out.println("비정상 로그인");
				//페이지 이동 = login?error=4567
				response.sendRedirect("./login?error=4567");
			}
			
		} else {
			
		}
		
	}

}
