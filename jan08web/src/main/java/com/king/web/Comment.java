package com.king.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.king.dao.BoardDAO;
import com.king.dao.CommentDAO;
import com.king.dto.BoardDTO;
import com.king.dto.CommentDTO;
import com.king.util.Util;

@WebServlet("/comment")
public class Comment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Comment() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글처리
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		if (session.getAttribute("mid") == null && session.getAttribute("mname") == null
				&& session.getAttribute("mpw") == null) {
			response.sendRedirect("./login.jsp");
		} else {
			//오는값 받기
			String commentcontent = request.getParameter("commentcontent");
			String bno = request.getParameter("bno");
			
			//오는 값에서 특수기호 <,>, 변경하기
			//HTML에서 태그를 특수기호로 변경하기
			commentcontent = Util.removeTag(commentcontent);
			//줄바꿈 처리해주기 /r /n /nr
			commentcontent = Util.addBR(commentcontent);
			//저장
			CommentDTO dto = new CommentDTO();
			dto.setComment(commentcontent);
			dto.setBoard_no(Util.str2Int(bno));
			dto.setMid((String)session.getAttribute("mid"));
			dto.setCip(Util.getIP(request));
			CommentDAO dao = new CommentDAO();
			int result = dao.commentWrite(dto);
			
			if (result == 1) {
				response.sendRedirect("./detail?no="+bno);				
			} else {
				response.sendRedirect("./error.jsp");
			}
		}
		
	}

}
