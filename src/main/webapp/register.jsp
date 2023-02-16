<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page  isELIgnored="false"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New User Registration</title>
<%@ include file="component/all_css.jsp" %>
<style type="text/css">
.card{
	box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
}

</style>
</head>
<body class="bg-light">

<%@include file="component/navbar.jsp" %>

<div class="container p-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header">
						<p class="text-center fs-3">Registeration Page</p>
						<c:if test="${not empty msg }">
							<p class="text-center text-success fs-2"><c:out value="${msg}"></c:out></p>
							<c:remove var="msg"/>
						</c:if>
					</div>
					<div class="card-body">
						<form action="userRegister" method="post">
						
						<div class="mb-3">
						<label>Enter Full Name </label>
						<input type="text" class="form-control" name="fullname">
						</div>
						<div class="mb-3">
						<label>Enter Email </label>
						<input type="email" class="form-control" name="email">
						</div>
						<div class="mb-3">
						<label>Enter Password </label>
						<input type="password" class="form-control" name="password">
						</div>
						<div class="mb-3">
						<label>About </label>
						<input type="text" class="form-control" name="about">
						</div>
						<button class="btn btn-primary col-md-12">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>