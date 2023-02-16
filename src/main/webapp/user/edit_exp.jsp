<%@page import="com.entity.Expense"%>
<%@page import="com.db.HibernateUtil"%>
<%@page import="com.dao.ExpenseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page  isELIgnored="false"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expense Editing</title>
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

<%
		int id=Integer.parseInt(request.getParameter("id"));
		ExpenseDao dao=new ExpenseDao(HibernateUtil.getSessionFactory());
		Expense ex=dao.getExpenseById(id);

%>

<%@include file="../component/navbar.jsp" %>

<div class="container p-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header">
						<p class="text-center fs-3"><i><b>Edit Expense</b></i></p>
						
					</div>
					<div class="card-body">
						<form action="../Update" method="post">
						
						
						<div class="mb-3">
						<label>Title</label>
						<input type="text" class="form-control" name="title" value="<%=ex.getTitle() %>">
						</div>
						<div class="mb-3">
						<label>Date</label>
						<input type="date" class="form-control" name="date" value="<%=ex.getDate() %>">
						</div>
						
						<div class="mb-3">
						<label>Time</label>
						<input type="time" class="form-control" name="time" value="<%=ex.getTime() %>">
						</div>
						
						<div class="mb-3">
						<label>Description</label>
						<input type="text" class="form-control" name="description" value="<%=ex.getDescription() %>">
						</div>
						
						<div class="mb-3">
						<label>Price</label>
						<input type="text" class="form-control" name="price" value="<%=ex.getPrice() %>">
						</div>
						<input type="hidden" name="id" value="<%=ex.getId()%>">
						<button class="btn btn-success col-md-12">Update</button>
						
						
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>