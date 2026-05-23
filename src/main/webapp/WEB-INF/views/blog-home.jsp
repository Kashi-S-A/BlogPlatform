<%@page import="java.util.List"%>
<%@page import="com.tyss.entity.Blog"%>
<%@page import="org.springframework.data.domain.Page"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Blog Home</title>

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

/* Search Bar */
.search-box input{
    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:4px;
    margin-bottom:15px;
    font-size:15px;
}

/* Sort Button */
.search-box button{
    width:100%;
    padding:12px;
    background:#2f2f2f;
    color:white;
    border:none;
    border-radius:4px;
    font-size:15px;
    cursor:pointer;
    transition:0.3s;
}

/* Hover Effect */
.search-box button:hover{
    background:#707070;
}

/* Sort Dropdown */
.sort-box select{
    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:4px;
    margin-bottom:20px;
    font-size:15px;
}

/* Sort Button */
.sort-box button{
    width:100%;
    padding:12px;
    background:#2f2f2f;
    color:white;
    border:none;
    border-radius:4px;
    font-size:15px;
    cursor:pointer;
    transition:0.3s;
}

/* Hover Effect */
.sort-box button:hover{
    background:#707070;
}

/* Blog Card */
.blog-card{
    background:#dcdcdc;
    padding:20px;
    border-radius:4px;
    margin-bottom:20px;
}

.blog-card h3{
    margin-bottom:12px;
    color:#222;
}

.blog-card p{
    margin-bottom:12px;
    color:#333;
    line-height:1.5;
}

/* Read More Link */
.read-more{
    text-decoration:none;
    color:#111;
    font-weight:bold;
}

.read-more:hover{
    color:#555;
}

/* Pagination Buttons */
.pagination a{
    display:block;
    width:100%;
    text-align:center;
    padding:12px;
    margin:10px 0;
    background:#2f2f2f;
    color:white;
    text-decoration:none;
    border-radius:4px;
    transition:0.3s;
}

.pagination a:hover{
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

    <h2>Blog Posts</h2>

    <!-- Search Box -->
    
    <form action="/user/search">
    <div class="search-box">
        <input type="text" name="s" placeholder="Search posts...">
    </div>
    <button type="submit">Search</button>
	</form>
	
    <!-- Sort Dropdown -->
    <form action="/user/home">
    <div class="sort-box">
        <select name="by">
            <option value="createdDate">Sort by Date</option>
            <option value="userId">Sort by Author</option>
        </select>
        <button type="submit">Sort</button>
    </div>
    
    </form>
    <%
    	Page<Blog> pg =(Page<Blog>) request.getAttribute("page");
        String by = (String)request.getAttribute("by");
    	Blog blog = pg.getContent().get(0);
    	if(blog!=null)
    	{
    %>

    <!-- Blog Post Card -->
    <div class="blog-card">
    

        <h3><%=blog.getTitle()%></h3>

        <p>
            Author: <%=blog.getUser().getFullName()%> | Date: <%=blog.getCreatedDate()%>
        </p>

        <p>
            Excerpt: <%=blog.getContent()%>
        </p>
		<% }else{ %>
		<p>No blog Available</p>
		<%} %>
        <!-- <a href="#" class="read-more">Read More</a> -->

    </div>

    <!-- Pagination -->
    <div class="pagination">
        <%
        	if(!pg.isFirst())
        	{
        %>
         <a href="/user/home?pageNumber=<%=pg.getNumber()-1%>&by=<%=by%>">« Prev</a>
         <%
        	}
         %>
         
         <%
        	if(!pg.isLast())
        	{
        %>
        <a href="/user/home?pageNumber=<%= pg.getNumber() + 1%>&by=<%=by%>">Next »</a>
        <%
        	}
        %>
    </div>
	
</div>

<!-- Footer -->
<div class="footer">
    © 2024 Blog Platform
</div>

</body>
</html>