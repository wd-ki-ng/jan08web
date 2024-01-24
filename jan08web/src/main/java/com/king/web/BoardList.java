package com.king.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.king.dao.BoardDAO;
import com.king.dao.LogDAO;
import com.king.dto.BoardDTO;
import com.king.util.Util;

@WebServlet("/board")
public class BoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int page = 1;
		if(request.getParameter("page") != null && request.getParameter("page") != "") {
			page = Util.str2Int(request.getParameter("page"));			
		} //페이지번호가 null이 아닐때 실행
		
		//log
		Map<String, Object> log = new HashMap<String, Object>();
		log.put("ip", Util.getIP(request));
		log.put("url", "./board");
		log.put("data", "page=" + page);
		LogDAO logDAO = new LogDAO();
		logDAO.write(log);
		
		//DAO랑 연결
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> list = dao.boardList(page);
		int totalCount = dao.totalCount();
		
		request.setAttribute("list", list);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("page", page);
		
		RequestDispatcher rd = request.getRequestDispatcher("board.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
