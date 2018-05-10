 package com.hyg.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class CheckUserFilter
 */
@WebFilter("/CheckUserFilter")
public class CheckUserFilter implements Filter {
	private FilterConfig filterConfig;
	private String loginPage="Login.jsp";
    /**
     * Default constructor. 
     */
    public CheckUserFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		filterConfig=null;
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest) request;
		HttpServletResponse res=(HttpServletResponse) response;
		//获取请求页面
		String uri=req.getRequestURI();
		HttpSession session=req.getSession(true);
		//如果访问登录页面或已经登录
		if(uri.endsWith(loginPage)||uri.endsWith("/login")
				||session.getAttribute("username")!=null){
			
		chain.doFilter(req, res);
		return;
		}
		else{
			res.sendRedirect(loginPage);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig config) throws ServletException {
		//通过FileterConfig获得web.xml中设置的初始化参数
		filterConfig=config;
		if(filterConfig.getInitParameter("loginPage")!=null){
			loginPage = filterConfig.getInitParameter("loginPage");
		}
		
	}

}
