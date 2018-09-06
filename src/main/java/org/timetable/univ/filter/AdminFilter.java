package org.timetable.univ.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.timetable.univ.model.vo.MemberVo;

public class AdminFilter extends HttpFilter{
	
	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
				String req = request.getRequestURI();
				System.out.println("filter at " + req);
				
				HttpSession session = request.getSession();
				MemberVo vo = (MemberVo)session.getAttribute("memberVo");
				if (vo != null) {
					String id = vo.getId();
					if (!id.equals("admin")) {
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

