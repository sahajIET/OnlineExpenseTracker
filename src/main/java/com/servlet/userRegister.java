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
 * Servlet implementation class userRegister
 */
public class userRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String name=request.getParameter("fullname");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String about=request.getParameter("about");
		
		User u=new User(name,email,password,about);
		//System.out.println(u);
		
		UserDao dao=new UserDao(HibernateUtil.getSessionFactory());
		boolean f=dao.saveuser(u);
		
		HttpSession session=request.getSession();
		
		if(f)
		{
			session.setAttribute("msg", "Registerd Successfully");
			response.sendRedirect("register.jsp");
		}
		else
		{
			session.setAttribute("msg", "Something Wrong");
			response.sendRedirect("register.jsp");
		}
		
	}

}
