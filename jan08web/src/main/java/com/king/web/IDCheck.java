package com.king.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.king.dao.MemberDAO;
import com.king.dto.MemberDTO;

@WebServlet("/idCheck")
public class IDCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public IDCheck() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		MemberDTO dto = new MemberDTO();
		dto.setMid(id);
		
		MemberDAO dao = new MemberDAO();
		 int result = dao.idCheck(dto);
		 
		System.out.println("검사요청이 들어온 ID : " + id + "  결과는 :  "+ result);
		PrintWriter pw =response.getWriter();
		pw.print(result);
	}

}
