package cn.believeus.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;

public class ForwardFilter implements Filter {
	private String english = "english";

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession();
		String currenturi = httpRequest.getRequestURI();
		if (currenturi.equals("/english.jhtml")) {
			session.setAttribute(english, english);
			httpRequest.getRequestDispatcher("/english.jhtml").forward(httpRequest,
					httpResponse);
			return;
		}
		if (currenturi.equals("/")) {
			session.removeAttribute(english);
		}else if (currenturi.contains("/admin")) {
			String url = currenturi;
			httpRequest.getRequestDispatcher(url).forward(httpRequest,
					httpResponse);
			return;
		}else if (currenturi.contains("/UEupload")) {
			String url = currenturi;
			httpRequest.getRequestDispatcher(url).forward(httpRequest,
					httpResponse);
			return;
		}
		if (!StringUtils.isEmpty((String) session.getAttribute(english))) {
			String url = "/english" + currenturi;
			httpRequest.getRequestDispatcher(url).forward(httpRequest,
					httpResponse);
			return;
		}
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {

	}

}
