package com.king.web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.king.dao.MemberDAO;
import com.king.db.DBConnection;
import com.king.dto.MemberDTO;

@WebServlet("/join")
public class Join extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Join() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher rd = request.getRequestDispatcher("join.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 값잡기
		request.setCharacterEncoding("UTF-8");
		if (request.getParameter("id") != null && request.getParameter("name") != null
				&& request.getParameter("pw1") != null) {
			MemberDTO dto = new MemberDTO();
			dto.setMid(request.getParameter("id"));
			dto.setMname(request.getParameter("name"));
			dto.setMpw(request.getParameter("pw1"));
			// db보내기
			MemberDAO dao = new MemberDAO();
			int result = dao.join(dto);

			if (result == 1) {
				response.sendRedirect("./login");
			} else {
				response.sendRedirect("./error.jsp");
			}
			// 정상로그인
		} else
			response.sendRedirect("./error.jsp");

		// 비정상 에러
	}

}
