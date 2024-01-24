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

@WebServlet("/delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Delete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//글 삭제하기 2024-01-11 + 2024-01-16 로그인한 사용자 + 내글
		//no가 숫자야??
		HttpSession session = request.getSession();
		if (Util.intCheck(request.getParameter("no"))&& session.getAttribute("mid") != null) {			
			//번호잡기
			int no = Util.str2Int(request.getParameter("no"));
			BoardDAO dao = new BoardDAO();
			//board_no, mid가 같이 있는 클래스는 BoardDTO
			BoardDTO dto = new BoardDTO();
			//숫자면 삭제-> board로로 이동
			dto.setNo(no);
			dto.setMid((String) session.getAttribute("mid"));
			//DAO에게 일 시키기
			int result = dao.delete(dto);
			//잘 삭제되었는지 값 받기
			if(result == 1) {
				//값이 1이면 어디로
				response.sendRedirect("./board");
			} else {
				//값이 0이면 어디로
				response.sendRedirect("./error.jsp");
			}
		} else {
			response.sendRedirect("./error.jsp");
			//System.out.println("문자");
			//숫자가 아니면 에러표시
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
	}

}
