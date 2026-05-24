<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ page import="com.tyss.entity.User" %>
	<%@ page import="com.tyss.entity.Blog" %>
	<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>User Profile</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family: Arial, sans-serif;
}

/* Body */
body{
    background:#f4f4f4;
}

/* Header */
.header{
    background:#2f2f2f;
    color:white;
    text-align:center;
    padding:18px;
    font-size:30px;
    font-weight:bold;
}

/* Navigation */
.navbar{
    background:#2f2f2f;
    padding:15px;
    text-align:center;
}

.navbar a{
    display:block;
    width:98%;
    margin:6px auto;
    padding:12px;
    text-decoration:none;
    color:white;
    background:#5a5a5a;
    border-radius:4px;
    transition:0.3s;
}

/* Hover Effect */
.navbar a:hover{
    background:#8a8a8a;
}

/* Main Container */
.container{
    width:95%;
    margin:20px auto;
    background:white;
    padding:20px;
    border-radius:5px;
    box-shadow:0px 0px 5px rgba(0,0,0,0.2);
}

.container h2{
    margin-bottom:15px;
    color:#333;
}

.profile-info{
    margin-bottom:25px;
}

.profile-info p{
    margin-bottom:8px;
    font-size:18px;
    color:#333;
}

/* Post Card */
.post-card{
    background:#dcdcdc;
    padding:15px;
    border-radius:4px;
    margin-top:15px;
}

.post-card h3{
    margin-bottom:15px;
    color:#222;
}

/* Buttons */
.btn{
    display:block;
    width:100%;
    padding:12px;
    margin:8px 0;
    text-align:center;
    text-decoration:none;
    background:#7a7a7a;
    color:white;
    border-radius:4px;
    transition:0.3s;
}

/* Hover Effect */
.btn:hover{
    background:#9a9a9a;
}

/* Logout Button */
.logout-btn{
    display:block;
    width:100%;
    padding:12px;
    margin-top:20px;
    text-align:center;
    text-decoration:none;
    background:#2f2f2f;
    color:white;
    border-radius:4px;
    transition:0.3s;
}

.logout-btn:hover{
    background:#707070;
}

/* Footer */
.footer{
    background:#2f2f2f;
    color:white;
    text-align:center;
    padding:20px;
    margin-top:25px;
}

</style>

</head>

<body>
	
	<%
	    User currentUser = (User) request.getAttribute("profileUser");
	    List<Blog> userBlogs = (List<Blog>) request.getAttribute("profileBlogs");
	%>

<!-- Header -->
<div class="header">
    Blog Dashboard
</div>

<!-- Navigation -->
<div class="navbar">
     <a href="/user/home">Home</a>
        <a href="/user/blog-post">Create New Post</a>
        <a href="/user/profile">Profile</a>
</div>

<!-- Main Content -->
<div class="container">

	<h2>User Profile</h2>

	    <div class="profile-info">
	        <p>Name: <%= (currentUser != null) ? currentUser.getFullName() : "" %></p>
	        <p>Email: <%= (currentUser != null) ? currentUser.getEmail() : "" %></p>
	    </div>

	    <h2>Your Posts</h2>

	    <% 
	        if (userBlogs != null && !userBlogs.isEmpty()) {
	            for (Blog blog : userBlogs) {
	    %>
	                <div class="post-card">
	                    <h3>Title : <%= blog.getTitle() %></h3>
						<h3>Date : <%= blog.getCreatedDate() %></h3>
	                    <a href="#" class="btn">Edit</a>
	                    <a href="#" class="btn">Delete</a>
	                </div>
	    <% 
	            }
	        } else { 
	    %>
	            <p style="margin-top:15px; color:#666;">You haven't written any posts yet.</p>
	    <% 
	        } 
	    %>
    <!-- Logout -->
    <a href="#" class="logout-btn">Logout</a>

</div>

<!-- Footer -->
<div class="footer">
    © 2024 Blog Platform
</div>

</body>
</html>