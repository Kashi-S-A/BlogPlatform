<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Users</title>

<style>

*{
	margin:0;
	padding:0;
	box-sizing:border-box;
	font-family:Arial;
}

body{
	background:#f4f4f4;
}

.container{
	width:95%;
	margin:auto;
	margin-top:30px;
	background:white;
	padding:20px;
	border-radius:5px;
}

h2{
	margin-bottom:20px;
}

table{
	width:100%;
	border-collapse:collapse;
}

th{
	background:#333;
	color:white;
	padding:12px;
	text-align:left;
}

td{
	padding:12px;
	border-bottom:1px solid #ccc;
}

.btn{
	padding:8px 15px;
	text-decoration:none;
	border-radius:4px;
	color:white;
}

.delete{
	background:red;
}

</style>

</head>
<body>

<div class="container">

	<h2>Manage Users</h2>

	<table>

		<tr>
			<th>ID</th>
			<th>Username</th>
			<th>Full Name</th>
			<th>Email</th>
			<th>Role</th>
			<th>Action</th>
		</tr>

		<c:forEach items="${users}" var="u">

			<tr>

				<td>${u.id}</td>
				<td>${u.username}</td>
				<td>${u.fullName}</td>
				<td>${u.email}</td>
				<td>${u.role}</td>

				<td>
					<a href="/admin/delete-user/${u.id}"
					   class="btn delete">
					   Delete
					</a>
				</td>

			</tr>

		</c:forEach>

	</table>

</div>

</body>
</html>