package com.king.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.king.dao.AdminDAO;

@WebServlet("/admin/ip")
public class Ip extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ip() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println(request.getParameter("ip"));
		
		AdminDAO dao = new AdminDAO();
		
		request.setAttribute("list2", dao.ipAccessList5());
		request.setAttribute("list3", dao.ipAccessList10());
		
		List<Map<String, Object>> list = null;
		
		if(request.getParameter("ip") != null && !request.getParameter("ip").equals("")) {
			list = dao.ipList(request.getParameter("ip"));
		} else {
			list = dao.ipList();
		}
		
		request.setAttribute("list", list);
		//List<Map<String, Object>> list = dao.ipList();
		//request.setAttribute("list", list);
		
		//List<Map<String, Object>> list2 = dao.ipAccessList5();
		//request.setAttribute("list2", list2);

		//List<Map<String, Object>> list3 = dao.ipAccessList10();
		//request.setAttribute("list3", list3);
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/admin/ip.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
