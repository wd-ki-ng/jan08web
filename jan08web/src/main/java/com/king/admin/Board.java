package com.king.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.king.dao.AdminDAO;
import com.king.dto.BoardDTO;
import com.king.util.Util;

@WebServlet("/admin/board")
public class Board extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Board() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		AdminDAO dao = new AdminDAO();
		List<BoardDTO> list = null;
		
		if (request.getParameter("search") != null) {
			list = dao.boardList(request.getParameter("search"));
		} else {
			list = dao.boardList();
		}

		request.setAttribute("list", list);

		RequestDispatcher rd = request.getRequestDispatcher("/admin/board.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		AdminDAO dao = new AdminDAO();
		BoardDTO dto = new BoardDTO();
		
		dto.setNo(Util.str2Int(request.getParameter("no")));
		dto.setDel(Util.str2Int(request.getParameter("del")) == 1 ? 0 : 1);
		
		int result = dao.boardDel(dto);
		
		PrintWriter pw = response.getWriter();
		pw.print(result);
	}
}
