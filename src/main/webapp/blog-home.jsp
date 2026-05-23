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

/* Sort Dropdown */
.sort-box select{
    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:4px;
    margin-bottom:20px;
    font-size:15px;
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
    <a href="#">Home</a>
    <a href="#">Create New Post</a>
    <a href="#">Profile</a>
</div>

<!-- Main Content -->
<div class="container">

    <h2>Blog Posts</h2>

    <!-- Search Box -->
    <div class="search-box">
        <input type="text" placeholder="Search posts...">
    </div>

    <!-- Sort Dropdown -->
    <div class="sort-box">
        <select>
            <option>Sort by Date</option>
            <option>Sort by Popularity</option>
            <option>Sort by Author</option>
        </select>
    </div>

    <!-- Blog Post Card -->
    <div class="blog-card">

        <h3>Blog Title 1</h3>

        <p>
            Author: John Doe | Date: 2024-08-09
        </p>

        <p>
            Excerpt: This is an example excerpt from a blog post...
        </p>

        <a href="#" class="read-more">Read More</a>

    </div>

    <!-- Pagination -->
    <div class="pagination">
        <a href="#">« Prev</a>
        <a href="#">Next »</a>
    </div>

</div>

<!-- Footer -->
<div class="footer">
    © 2024 Blog Platform
</div>

</body>
</html>