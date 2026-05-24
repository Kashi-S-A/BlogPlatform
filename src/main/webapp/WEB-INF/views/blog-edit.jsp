<%@page import="com.tyss.entity.Blog"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Create Blog Post</title>

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
    margin-bottom:20px;
    color:#333;
}

/* Form Labels */
label{
    display:block;
    margin-bottom:8px;
    margin-top:15px;
    font-weight:bold;
    color:#333;
}

/* Input Fields */
input[type="text"],
textarea{
    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:4px;
    font-size:15px;
}

input[type="number"]
{
    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:4px;
    font-size:15px;
}

/* Textarea */
textarea{
    resize:vertical;
    min-height:100px;
}

/* Button */
.btn{
    width:100%;
    padding:12px;
    margin-top:15px;
    background:#2f2f2f;
    color:white;
    border:none;
    border-radius:4px;
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
}

/* Hover Effect */
.btn:hover{
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

.success-msg{
    color: green;
    text-align: center;
    margin-bottom: 15px;
}
</style>

</head>

<body>

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
	<h3 class="success-msg">${blogAdded}</h3>
    <h2>Edit Post</h2>

<%
		Blog blog =(Blog) request.getAttribute("blog");
%>

    <form action="/user/blog/edit" method="post">
		<label>Id:</label>
        <input type="number" name="id" value="<%=blog.getId()%>" readonly>

        <label>Title:</label>
        <input type="text" name="title" value="<%=blog.getTitle()%>">

        <label>Content:</label>
        <textarea name="content"><%=blog.getContent()%></textarea>

        <label>Tags:</label>
        <input type="text" name="tags" value="<%=blog.getTags()%>"  placeholder="Comma separated tags">

        <button type="submit" class="btn">
            Submit
        </button>

    </form>

</div>

<!-- Footer -->
<div class="footer">
    © 2024 Blog Platform
</div>

</body>
</html>