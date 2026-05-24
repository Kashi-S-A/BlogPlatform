<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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

body{
    background:#f4f4f4;
}

.header{
    background:#2f2f2f;
    color:white;
    text-align:center;
    padding:18px;
    font-size:30px;
    font-weight:bold;
}

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

.navbar a:hover{
    background:#8a8a8a;
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

.report-box{
    margin-top:15px;
}

label{
    font-size:18px;
    font-weight:bold;
    color:#444;
}

select{
    width:100%;
    padding:12px;
    margin-top:10px;
    margin-bottom:20px;
    border:1px solid #ccc;
    border-radius:4px;
    font-size:16px;
}

.btn1,.download{
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

.btn1:hover,.download:hover{
    background:#707070;
}

.footer{
    background:#2f2f2f;
    color:white;
    text-align:center;
    padding:20px;
    margin-top:25px;
}

table{
    width:100%;
    border-collapse:collapse;
    margin-top:20px;
}

table th{
    background:#2f2f2f;
    color:white;
    padding:12px;
    text-align:center;
}

table td{
    padding:12px;
    border:1px solid #ccc;
    text-align:center;
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
    <a href="/admin/dashboard">Manage Posts</a>
    <a href="/admin/users">Manage Users</a>
    <a href="/admin/post-module">Post Moderation</a>
    <a href="/admin/report">Reports</a>
</div>

<!-- Main Content -->
<div class="container">

    <h2>Reports</h2>

    <div class="report-box">

        <label>Select Report:</label>

        <select>
            <option>Most Active Users</option>
        </select>

        <button class="btn1" onclick="generateReport()">
            Show Report
        </button>

    </div>

    <br><br>

    <!-- Hidden Table -->
    <div id="reportTable" style="display:none;">

        <table>

            <tr>
                <th>User Name</th>
                <th>No Of Blogs</th>
            </tr>

            <c:forEach items="${reports}" var="report">

                <tr>
                    <td>${report[0]}</td>
                    <td>${report[1]}</td>
                </tr>

            </c:forEach>

		  <button class="download" onclick="downloadReport()">
            Download Report
        </button>

		
        </table>

    </div>
    <!-- Logout -->
    <a href="logout" class="logout-btn">Logout</a>

</div>

<!-- Footer -->
<div class="footer">
    © 2024 Blog Platform
</div>

<script>

	function generateReport() {

		// show table
		document.getElementById("reportTable").style.display = "block";

		// download pdf
	}
	
	function downloadReport() {

		// show table
		document.getElementById("reportTable").style.display = "block";

		// download pdf
		window.location.href='/admin/download-report';
	}

</script>

</body>
</html>