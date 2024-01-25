package com.king.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.king.dao.CafeDAO;
import com.king.dto.CafeDTO;import com.king.util.Util;

@WebServlet("/cafe")
public class Cafe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Cafe() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CafeDTO dto = new CafeDTO();
		
		dto.setName(request.getParameter("name"));
		dto.setCoffee(Integer.parseInt(request.getParameter("coffee")));
		dto.setCoffee_Name(request.getParameter("coffee_name"));
		
		System.out.println(Integer.parseInt(request.getParameter("coffee1")));

		CafeDAO dao = new CafeDAO();
		int result = dao.cafehotice(dto);
		
		if (result == 1) {
			response.sendRedirect("./cafe");
		} else {
			response.sendRedirect("./choosemenu");
		}
	}
		
		//RequestDispatcher rd = request.getRequestDispatcher("./cafe.jsp");
		//rd.forward(request, response);
		
	}
	
