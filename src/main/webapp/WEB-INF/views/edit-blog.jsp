<%@page import="com.tyss.entity.Blog"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    Blog blog = (Blog) request.getAttribute("blog");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Blog</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, sans-serif;
}

body{
    background:#f4f4f4;
}

/* Header */
.header{
    background:#2f2f2f;
    color:white;
    padding:20px;
    text-align:center;
    font-size:32px;
    font-weight:bold;
}

/* Form Container */
.form-container{
    width:70%;
    margin:40px auto;
    background:white;
    padding:40px;
    border-radius:8px;
    box-shadow:0px 0px 10px rgba(0,0,0,0.2);
}

.form-container h2{
    margin-bottom:25px;
    color:#333;
}

/* Input Groups */
.form-group{
    margin-bottom:20px;
}

.form-group label{
    display:block;
    margin-bottom:8px;
    font-weight:bold;
    color:#444;
}

.form-group input,
.form-group textarea{
    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:5px;
    font-size:16px;
}

.form-group textarea{
    resize:vertical;
    min-height:180px;
}

/* Buttons */
.button-group{
    display:flex;
    gap:15px;
}

.btn{
    padding:12px 25px;
    border:none;
    border-radius:5px;
    cursor:pointer;
    font-size:16px;
    text-decoration:none;
    color:white;
}

.update-btn{
    background:#2f2f2f;
}

.cancel-btn{
    background:#777;
}

.btn:hover{
    opacity:0.9;
}

</style>

</head>

<body>

<div class="header">
    Edit Blog Post
</div>

<div class="form-container">

    <h2>Update Blog Details</h2>

    <form action="/admin/update-blog" method="post">

        <!-- Hidden ID -->
        <input type="hidden" name="id" value="<%= blog.getId() %>">

        <div class="form-group">
            <label>Title</label>
            <input type="text"
                   name="title"
                   value="<%= blog.getTitle() %>"
                   required>
        </div>

        <div class="form-group">
            <label>Author</label>
            <input type="text"
                   name="author"
                   value="<%= blog.getAuthor() %>"
                   required>
        </div>

        <div class="form-group">
            <label>Tags</label>
            <input type="text"
                   name="tags"
                   value="<%= blog.getTags() %>">
        </div>

        <div class="form-group">
            <label>Content</label>

            <textarea name="content" required><%= blog.getContent() %></textarea>
        </div>

        <div class="button-group">

            <button type="submit" class="btn update-btn">
                Update Blog
            </button>

            <a href="/admin/admindashboard" class="btn cancel-btn">
                Cancel
            </a>

        </div>

    </form>

</div>

</body>
</html>