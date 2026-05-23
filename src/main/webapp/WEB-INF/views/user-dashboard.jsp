<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blog Dashboard</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family: Arial, sans-serif;
}

html,body{
    height:100%;
}

body{
    background:#dcdcdc;
    display:flex;
    flex-direction:column;
}

.header{
    background:#2d2d2d;
    color:white;
    text-align:center;
    padding:15px 0 40px;
}

.header h1{
    font-size:38px;
    margin-bottom:20px;
}

.navbar{
    width:96%;
    margin:auto;
}

.navbar a{
    display:block;
    background:#666;
    color:white;
    text-decoration:none;
    padding:14px;
    margin-bottom:5px;
    font-weight:bold;
    border-radius:3px;
}

.navbar a:hover{
    background:#777;
}


.main-content{
    flex:1;
}

.footer{
    background:#2d2d2d;
    color:white;
    text-align:center;
    padding:30px;
    font-size:24px;
}

</style>
</head>

<body>


<div class="header">

    <h1>Blog Dashboard</h1>

    
    <div class="navbar">
        <a href="/user/home">Home</a>
        <a href="/user/blog-post">Create New Post</a>
        <a href="/user/profile">Profile</a>
    </div>

</div>


<div class="main-content"></div>

<div class="footer">
    © 2024 Blog Platform
</div>

</body>
</html>