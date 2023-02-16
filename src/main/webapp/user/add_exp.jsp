<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page  isELIgnored="false"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expense Adding</title>
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
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header">
						<p class="text-center fs-3"><i><b>Add Expense</b></i></p>
						
						<c:if test="${not empty msg }">
							<p class="text-center text-success fs-2"><c:out value="${msg}"></c:out></p>
							<c:remove var="msg"/>
						</c:if>
					</div>
					<div class="card-body">
						<form action="../Save" method="post">
						
						
						<div class="mb-3">
						<label>Title</label>
						<input type="text" class="form-control" name="title">
						</div>
						<div class="mb-3">
						<label>Date</label>
						<input type="date" class="form-control" name="date">
						</div>
						
						<div class="mb-3">
						<label>Time</label>
						<input type="time" class="form-control" name="time">
						</div>
						
						<div class="mb-3">
						<label>Description</label>
						<input type="text" class="form-control" name="description">
						</div>
						
						<div class="mb-3">
						<label>Price</label>
						<input type="text" class="form-control" name="price">
						</div>
						<button class="btn btn-success col-md-12">Add</button>
						
						
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>