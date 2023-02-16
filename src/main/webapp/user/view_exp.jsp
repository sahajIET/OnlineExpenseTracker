<%@page import="java.util.List"%>
<%@page import="com.db.HibernateUtil"%>
<%@page import="com.entity.Expense"%>
<%@page import="com.dao.ExpenseDao"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page  isELIgnored="false"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Viewing Expense</title>
<%@include file="../component/all_css.jsp" %>
<style type="text/css">
.card{
	box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
}

</style>
</head>
<body class="bg-light">

<c:if test="${ empty loginUser}">
	<c:redirect url="../login.jsp"></c:redirect>
</c:if>
<%@include file="../component/navbar.jsp" %>

<div class="container p-5">
		<div class="row">
			<div class="col-md-12 ">
				<div class="card">
					<div class="card-header">
						<p class="text-center fs-3"><i><b>All Expenses</b></i></p>
						<c:if test="${not empty msg }">
							<p class="text-center text-success fs-2"><c:out value="${msg}"></c:out></p>
							<c:remove var="msg"/>
						</c:if>
					</div>
					<div class="card-body">
						<table class="table">
						  <thead class="table-dark">
						    <tr>
						      <th scope="col">Title</th>
						      <th scope="col">Description</th>
						      <th scope="col">Date</th>
						      <th scope="col">Time</th>
						      <th scope="col">Price</th>
						      <th scope="col">Action</th>
						    </tr>
						  </thead>
						  <tbody>
								<%

								User user = (User) session. getAttribute("loginUser");
								ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory ());
								List<Expense> list = dao.getAllExpenseByUser(user);
								for (Expense ex : list) {
							
								%>
								<tr> 	
								<th scope="row"><%=ex.getTitle()%></th>
								<td><%=ex.getDescription()%></td>
								<td><%=ex.getDate()%></td>
								<td><%=ex.getTime()%></td>
								<td><%=ex.getPrice()%></td> 
								<td>
								<a href="edit_exp.jsp?id=<%=ex.getId() %>"  class="btn btn-sm btn-primary me-1" >Edit</a>
								<a href="../Delete?id=<%=ex.getId() %>" class="btn btn-sm btn-danger me-1">Delete</a>
								</td>
									
								</tr>
								<%} %>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>