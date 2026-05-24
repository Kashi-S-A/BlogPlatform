<%@page import="com.tyss.entity.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, sans-serif;
}

body {
	background-color: #f4f4f4;
}

.container {
	width: 95%;
	margin: auto;
	margin-top: 30px;
	background: white;
	padding: 20px;
	border-radius: 5px;
}

h2 {
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th {
	background: #333;
	color: white;
	padding: 12px;
	text-align: left;
}

td {
	padding: 12px;
	border-bottom: 1px solid #ccc;
}

.btn {
	padding: 8px 15px;
	text-decoration: none;
	border-radius: 4px;
	color: white;
}

.delete {
	background: red;
}

/* Header */
.header {
	background: #2f2f2f;
	color: white;
	text-align: center;
	padding: 15px;
	font-size: 28px;
	font-weight: bold;
}

/* Navigation */
.navbar {
	background: #2f2f2f;
	padding: 15px;
	text-align: center;
}

.navbar a {
	display: block;
	color: white;
	text-decoration: none;
	padding: 10px;
	margin: 5px auto;
	width: 98vw;
	background: #666;
	border-radius: 4px;
	transition: 0.3s;
}

.navbar a:hover {
	background: #888;
}

/* Main Container */
.container {
	width: 95%;
	margin: 20px auto;
	background: white;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
}

.container h2 {
	margin-bottom: 20px;
	color: #333;
}

/* Table */
table {
	width: 100%;
	border-collapse: collapse;
}

table th {
	background: #2f2f2f;
	color: white;
	padding: 12px;
	text-align: left;
}

table td {
	padding: 15px;
	border-bottom: 1px solid #ccc;
}

/* Buttons */
.btn {
	display: block;
	width: 850px;
	padding: 8px;
	margin: 5px 0;
	text-align: center;
	color: white;
	text-decoration: none;
	border-radius: 3px;
	font-size: 14px;
}

.edit {
	background: #444;
}

.delete {
	background: #555;
}

.feature {
	background: #666;
}

.btn:hover {
	opacity: 0.8;
}

/* Footer */
.footer {
	background: #2f2f2f;
	color: white;
	text-align: center;
	padding: 20px;
	margin-top: 20px;
}
</style>

</head>
<body>
	<div class="header">Admin Blog Dashboard</div>

	<!-- Navigation -->
	<div class="navbar">
		<a href="#">Manage Posts</a> 
		<a href="/admin/users">Manage Users</a> 
		<a href="/admin/post-module">Post Moderation</a> 
		<a href="/admin/report">Reports</a>
	</div>

	<!-- main content -->
	<div class="container">

		<h2>Manage Users</h2>
		
		<%
			List<User> users = (List<User>) request.getAttribute("users");
		%>

		<table>

			<tr>
				<th>Full Name</th>
				<th>Email</th>
				<th>Role</th>
				<th>Action</th>
			</tr>

			<%	if(!users.isEmpty()){
				for(User user : users)
				{
			%>

				<tr>

					<td><%=user.getFullName() %></td>
					<td><%=user.getEmail() %></td>
					<td><%=user.getRole() %></td>

					<td><a href="/admin/delete-user/<td><%=user.getId() %></td>" class="btn delete">
							Delete </a></td>

				</tr>

			<%}} %>

		</table>

	</div>

	<!-- Footer -->
	<div class="footer">© 2024 Blog Platform</div>
</body>
</html>