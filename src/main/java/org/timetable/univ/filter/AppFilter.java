package org.timetable.univ.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AppFilter extends HttpFilter {
	
	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		String req = request.getRequestURI();
		System.out.println("filter at " + req);
		if (req.endsWith(".css") || req.endsWith(".js") || req.equals("/index") || req.equals("/") || 
				req.equals("/join") || req.equals("/login/login") || 
				req.equals("/joinIdCheck") || req.equals("/joinNickCheck") ) {
			
			chain.doFilter(request, response);
		} else {
			HttpSession session = request.getSession();
			if (session.getAttribute("memberVo") == null) {
				System.out.println("test!!");
				session.setAttribute("target", req);
				session.setAttribute("no", request.getParameter("no"));
				response.sendRedirect(request.getServletContext().getContextPath() + "/index");
			} else {
				chain.doFilter(request, response);
			}
		}
	}

}