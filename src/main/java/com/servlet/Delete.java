package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ExpenseDao;
import com.db.HibernateUtil;

/**
 * Servlet implementation class Delete
 */
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			int id=Integer.parseInt(request.getParameter("id"));
			ExpenseDao dao=new ExpenseDao(HibernateUtil.getSessionFactory());
			
			boolean f=dao.deleteExpense(id);
			HttpSession session=request.getSession();
			
			if(f)
			{
				session.setAttribute("msg", "Expense deleted Successfully");
				response.sendRedirect("user/view_exp.jsp");
			}
			else
			{
				session.setAttribute("msg", "Something Wrong");
				response.sendRedirect("user/view_exp.jsp");
			}
	}

}
