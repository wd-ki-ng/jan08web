package com.king.web;

import java.io.IOException;
import java.util.ArrayList;
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

@WebServlet("/index")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Index() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//response.sendRedirect("index.jsp");
		
		/*
		List<Map<String, String>> map = new ArrayList<Map<String,String>>();
		
		//요소만들기
		Map<String, String> e = new HashMap<String, String>();
		e.put("name","홍길동");
		e.put("age", "120");
		e.put("addr", "한양");
		map.add(e);
		
		e = new HashMap<String, String>();
		e.put("name", "김길동");
		e.put("age", "12");
		e.put("addr", "서울");
		map.add(e);
		
		request.setAttribute("map", map);
		*/
		
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);		
		
		LogDAO log = new LogDAO();
		log.logwrite(Util.getIP(request), "./index",null);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	
	

}
