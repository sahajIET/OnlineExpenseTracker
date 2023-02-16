package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ExpenseDao;
import com.dao.UserDao;
import com.db.HibernateUtil;
import com.entity.Expense;
import com.entity.User;

/**
 * Servlet implementation class Save
 */
public class Save extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Save() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title=request.getParameter("title");
		String date=request.getParameter("date");
		String time=request.getParameter("time");
		String description=request.getParameter("description");
		String price=request.getParameter("price");
		
		
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("loginUser");
		
		Expense ex=new Expense(title,date,time,description,price,user);
		
		ExpenseDao dao=new ExpenseDao(HibernateUtil.getSessionFactory());
		boolean f=dao.saveExpense(ex);
		
		
		
		if(f)
		{
			session.setAttribute("msg", "Expense added Successfully");
			response.sendRedirect("user/add_exp.jsp");
		}
		else
		{
			session.setAttribute("msg", "Something Wrong");
			response.sendRedirect("user/add_exp.jsp");
		}
	}

}
