<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.tyss.entity.User"%>
<%@ page import="com.tyss.entity.Role"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit User</title>

<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	padding: 0;
	font-family: Arial, Helvetica, sans-serif;
	background-color: #ffffff;
	color: #000;
}

.header {
	background: #2f2f2f;
	color: white;
	text-align: center;
	padding: 15px;
	font-size: 28px;
	font-weight: bold;
}

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

.content-section {
	background-color: #eeeeee;
	padding: 18px 18px 34px 18px;
}

.card {
	background-color: white;
	border-radius: 4px;
	padding: 22px;
	box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.25);
	max-width: 650px;
	margin: 0 auto;
}

.card h3 {
	margin: 0 0 18px 0;
	font-size: 22px;
	font-weight: bold;
}

.form-group {
	margin-bottom: 16px;
}

label {
	display: block;
	font-weight: bold;
	margin-bottom: 7px;
	color: #222;
}

input, select {
	width: 100%;
	padding: 11px;
	border: 1px solid #bdbdbd;
	border-radius: 4px;
	font-size: 15px;
}

.btn {
	width: 100%;
	border: none;
	border-radius: 4px;
	padding: 12px;
	font-size: 15px;
	font-weight: bold;
	cursor: pointer;
	color: white;
	margin-top: 8px;
}

.update-btn {
	background-color: #198754;
}

.back-btn {
	display: block;
	text-align: center;
	background-color: #2f2f2f;
	color: white;
	text-decoration: none;
	border-radius: 4px;
	padding: 12px;
	font-size: 15px;
	font-weight: bold;
	margin-top: 12px;
}

.success-msg {
	background-color: #d4edda;
	color: #155724;
	padding: 12px;
	margin-bottom: 15px;
	border-radius: 4px;
	font-weight: bold;
}

.error-msg {
	background-color: #f8d7da;
	color: #721c24;
	padding: 12px;
	margin-bottom: 15px;
	border-radius: 4px;
	font-weight: bold;
}

.empty-msg {
	text-align: center;
	padding: 35px;
	font-size: 18px;
	color: #555;
	font-weight: bold;
}

.footer {
	background-color: #2f2f2f;
	color: white;
	text-align: center;
	padding: 25px 0;
	font-size: 16px;
	font-weight: bold;
	margin-top: 30px;
}
</style>

</head>

<body>

	<div class="header">Admin Blog Dashboard</div>

	<div class="navbar">
		<a href="/admin/dashboard">Manage Posts</a> <a href="/admin/users">Manage
			Users</a> <a href="/admin/post-module">Post Moderation</a> <a
			href="/admin/report">Reports</a>
	</div>

	<%
	User user = (User) request.getAttribute("user");

	String successMsg = (String) request.getAttribute("successMsg");
	%>

	<div class="content-section">

		<div class="card">

			<h3>Edit User</h3>

			<%
			if (successMsg != null) {
			%>
			<div class="success-msg">
				<%=successMsg%>
			</div>
			<%
			}
			%>

			<form action="/admin/update-user" method="post">

				<input type="hidden" name="id" value="<%=user.getId()%>"> <br>

				<label>Username</label> <br> 
				<input type="text" name="username" value="<%=user.getUsername()%>" required> <br> <br>
				
				<label>Full Name</label> <br>
				<input type="text" name="fullName" value="<%=user.getFullName()%>" required> <br> <br>
				
				<label>Email</label> <br> 
				<input type="email" name="email" value="<%=user.getEmail()%>" required> <br> <br>
				
				<button type="submit" class="btn update-btn">Update User</button>

			</form>

			<a class="back-btn" href="/admin/users"> Back to Manage Users </a>

		</div>

	</div>

	<div class="footer">© 2024 Blog Platform</div>

</body>
</html>