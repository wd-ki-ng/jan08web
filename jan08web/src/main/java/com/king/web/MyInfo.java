package com.king.web;

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
import javax.servlet.http.HttpSession;

import com.king.dao.MemberDAO;
import com.king.dto.MemberDTO;
import com.king.util.Util;

@WebServlet("/myInfo")
public class MyInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyInfo() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("mid") != null) {
			//mid를 데이터베이스에 질의
			MemberDTO dto = new MemberDTO();

			
			dto.setMid((String) session.getAttribute("mid"));
						
			MemberDAO dao = new MemberDAO();
			//dto에 담아서
			dto = dao.myInfo(dto);
			//myInfo.jsp에 찍어주도록 해주세요
			request.setAttribute("myInfo", dto);
			
			List<Map<String, Object>> readData = dao.readData(dto);
			request.setAttribute("readData", readData);
			
			RequestDispatcher rd = request.getRequestDispatcher("myInfo.jsp");
			rd.forward(request, response);
		} else {
			response.sendRedirect("./login");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("mid") != null) {
			MemberDTO dto = new MemberDTO();
			dto.setMpw(request.getParameter("newPW"));
			dto.setMid((String) session.getAttribute("mid"));
			MemberDAO dao = new MemberDAO();
			dto = dao.updatePW(dto);	
			
			response.sendRedirect("./logout");	
			
		} else {
			response.sendRedirect("./login");	
		}
	}

}
