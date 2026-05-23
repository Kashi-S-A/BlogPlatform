<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Reports Dashboard</title>

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

/* Lighter Hover Effect */
.navbar a:hover{
    background:#8a8a8a;
}

/* Main Container */
.container{
    width:95%;
    margin:25px auto;
    background:white;
    padding:25px;
    border-radius:5px;
    box-shadow:0px 0px 5px rgba(0,0,0,0.2);
}

.container h2{
    color:#333;
    margin-bottom:20px;
}

/* Form Section */
.report-box{
    margin-top:15px;
}

/* Label */
label{
    font-size:18px;
    font-weight:bold;
    color:#444;
}

/* Dropdown */
select{
    width:100%;
    padding:12px;
    margin-top:10px;
    margin-bottom:20px;
    border:1px solid #ccc;
    border-radius:4px;
    font-size:16px;
}

/* Button */
.btn{
    width:100%;
    padding:12px;
    background:#2f2f2f;
    color:white;
    border:none;
    border-radius:4px;
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
}

/* Lighter Hover */
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

</style>

</head>

<body>

<!-- Header -->
<div class="header">
    Admin Blog Dashboard
</div>

<!-- Navigation -->
<div class="navbar">
    <a href="#">Manage Posts</a>
    <a href="#">Manage Users</a>
    <a href="#">Post Moderation</a>
    <a href="#">Reports</a>
</div>

<!-- Main Content -->
<div class="container">

    <h2>Reports</h2>

    <div class="report-box">

        <label>Select Report:</label>

        <select>
            <option>Most Active Users</option>
            <option>Most Popular Posts</option>
            <option>Monthly Traffic</option>
            <option>Reported Posts</option>
        </select>

        <button class="btn">
            Generate Report
        </button>

    </div>

</div>

<!-- Footer -->
<div class="footer">
    © 2024 Blog Platform
</div>

</body>
</html>