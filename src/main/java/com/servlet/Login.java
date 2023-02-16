package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.HibernateUtil;
import com.entity.User;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		UserDao dao=new UserDao(HibernateUtil.getSessionFactory());
		User u=dao.login(email, password);
		//System.out.println(u);
		
		HttpSession session=request.getSession();
		if(u==null)
		{
			session.setAttribute("msg", "Invalid Email & Password");
			response.sendRedirect("login.jsp");
		}
		else
		{
			session.setAttribute("loginUser", u);
			response.sendRedirect("user/home.jsp");
		}
	}

}
