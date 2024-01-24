package com.king.util;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import com.king.dto.BoardDTO;
import com.king.dto.CommentDTO;

// sring값이 들어오면 int타입인지 확인해보는 메소드

// 127 -> TRUE
// 1A2A5 -> FALSE

public class Util {
	public static boolean intCheck(String str) {
		try {
			Integer.parseInt(str);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public static int str2Int(String str) {
		// A59 -> 59
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < str.length(); i++) {
			if (Character.isDigit(str.charAt(i))) {
				sb.append(str.charAt(i));
			}
		}
		int number = 0;
		if (sb.length() > 0) {
			number = Integer.parseInt(sb.toString());		
		}
		return number;
	}

	public static boolean intCheck2(String str) {
		boolean result = true;
		for (int i = 0; i < str.length(); i++) {
			if (!Character.isDigit(str.charAt(i))) {
				result = false;
				break;
			}
		}
		return result;
	}
	
	public static String getIP(HttpServletRequest request) {
		String ip = request.getHeader("X-FORWARDED-FOR");
	      if(ip == null) {
	          ip = request.getHeader("Proxy-Client-IP");
	       }
	       if(ip == null) {
	          ip = request.getHeader("WL-Proxy-Client-IP");   
	       }
	       if(ip == null) {
	          ip = request.getHeader("HTTP_CLIENT_IP");
	       }
	       if(ip == null) {
	          ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	       }
	       if(ip == null) {
	          ip = request.getRemoteAddr();
	       }

		return ip;
	}
	
	//HMLT태그를 특수기호로 변경하기		< --> &lt    > --> &gt
	public static String removeTag(String str) {
		str = str.replaceAll("<", "&lt");
		str = str.replaceAll(">", "&gt");
		return str;
	}
	
	public static String addBR(String str) {
		   return str.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
	}


	public static String changeIP(BoardDTO dto) {
		String changeIP =dto.getIp().replaceAll(dto.getIp().substring(dto.getIp().indexOf(".")+1, dto.getIp().intern().indexOf("."+1)), "♥♥♥");
		return changeIP;
	}
}
