package com.king.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.king.dao.BoardDAO;
import com.king.dto.BoardDTO;
import com.king.util.Util;

@WebServlet("/edit")
public class Edit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Edit() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("mid") != null &&Util.intCheck(request.getParameter("no"))) {
			// no잡기
			int no = Util.str2Int(request.getParameter("no"));
			// dao에 질의 하기
			BoardDAO dao = new BoardDAO();
			BoardDTO dto = dao.detail(no);
			//System.out.println(dto.getMid().equals(session.getAttribute("mid")));
			//System.out.println(session.getAttribute("mid").equals(dto.getMid()));
			//System.out.println(session.getAttribute("mid") == (dto.getMid()));
			//System.out.println(((String)session.getAttribute("mid")).equals(dto.getMid()));

			if (dto.getMid().equals(session.getAttribute("mid"))) {
				request.setAttribute("edit", dto);
				RequestDispatcher rd = request.getRequestDispatcher("edit.jsp");
				rd.forward(request, response);
			} else {
				response.sendRedirect("./error.jsp");

			}
		} else {
			response.sendRedirect("./login?login=nologin");
			// System.out.println("문자");
			// 숫자가 아니면 에러표시
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// doGet(request, response);
		
		request.setCharacterEncoding("UTF-8");
		
		if(request.getParameter("title") != null
				&& request.getParameter("content") != null
				&& Util.intCheck(request.getParameter("no"))) {
			
			BoardDTO dto = new BoardDTO();
			dto.setContent(request.getParameter("content"));
			dto.setTitle(request.getParameter("title"));
			dto.setNo(Util.str2Int(request.getParameter("no")));
			
			BoardDAO dao = new BoardDAO();
			int result = dao.edit(dto);

			response.sendRedirect("./detail?no="+ request.getParameter("no"));
			
		} else {
			//error
			response.sendRedirect("./error.jsp");
		}
		
		
		
		

	}

}
