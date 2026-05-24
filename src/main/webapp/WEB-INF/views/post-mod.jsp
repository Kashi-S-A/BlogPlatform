<%@page import="com.tyss.entity.Blog"%>
<%@page import="org.springframework.data.domain.Page"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    Page<Blog> pg = (Page<Blog>) request.getAttribute("page");

    Blog blog = null;

    if (pg != null && pg.hasContent()) {
        blog = pg.getContent().get(0);
    }

    String successMsg = (String) request.getAttribute("successMsg");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Blog Dashboard</title>

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

    .page-wrapper {
        width: 100%;
        min-height: 100vh;
        border-left: 10px solid #263746;
        border-right: 10px solid #263746;
        background-color: #f1f1f1;
    }

    .top-section {
        background-color: #2f2f2f;
        padding: 12px 24px 38px 24px;
        text-align: center;
    }

    .top-section h2 {
        color: white;
        font-size: 22px;
        margin: 0 0 18px 0;
        font-weight: bold;
    }

    .nav-menu {
        width: 100%;
        margin: 0 auto;
    }

    .nav-menu a {
        display: block;
        width: 100%;
        background-color: #555555;
        color: white;
        text-decoration: none;
        padding: 9px 0;
        margin-bottom: 2px;
        border-radius: 4px;
        font-size: 14px;
        font-weight: bold;
    }

    .nav-menu a:hover {
        background-color: #6a6a6a;
    }

    .nav-menu .active {
        background-color: #858585;
    }

    .content-section {
        background-color: #eeeeee;
        padding: 18px 18px 34px 18px;
    }

    .card {
        background-color: white;
        border-radius: 4px;
        padding: 18px;
        box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.25);
    }

    .card h3 {
        margin: 0 0 18px 0;
        font-size: 22px;
        font-weight: bold;
    }

    .success-msg {
        background-color: #d4edda;
        color: #155724;
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

    table {
        width: 100%;
        border-collapse: collapse;
        font-size: 16px;
    }

    thead tr {
        background-color: #2f2f2f;
        color: white;
    }

    th {
        padding: 9px 10px;
        text-align: left;
        font-weight: bold;
    }

    td {
        padding: 12px 10px;
        height: 115px;
        vertical-align: middle;
    }

    .title-col {
        width: 20%;
    }

    .author-col {
        width: 15%;
    }

    .date-col {
        width: 18%;
    }

    .status-col {
        width: 15%;
    }

    .action-col {
        width: 32%;
    }

    .bottom-border {
        border-bottom: 1px solid #cfcfcf;
    }

    .status-badge {
        display: inline-block;
        background-color: orange;
        color: white;
        padding: 7px 12px;
        border-radius: 4px;
        font-weight: bold;
        font-size: 14px;
    }

    .action-box {
        display: flex;
		flex-direction: column;
        flex-direction: column;
        gap: 8px;
        align-items: flex-start;
    }

    .action-box form {
        margin: 0;
    }

    .action-btn {
        color: white;
        border: none;
        border-radius: 3px;
        padding: 8px 18px;
        font-size: 14px;
        font-weight: bold;
        cursor: pointer;
        width: 110px;
    }

    .approve-btn {
        background-color: #198754;
    }

    .reject-btn {
        background-color: #dc3545;
    }

    .remove-btn {
        background-color: #343a40;
    }

    .action-btn:hover {
        opacity: 0.85;
    }

    .note-box {
        width: 210px;
        height: 38px;
        padding: 6px;
        resize: none;
        font-size: 13px;
        margin-bottom: 5px;
    }

    .pagination {
        margin-top: 20px;
        text-align: center;
    }

    .pagination a,
    .pagination span {
        display: inline-block;
        padding: 8px 14px;
        margin: 0 3px;
        border-radius: 4px;
        text-decoration: none;
        background-color: #2f2f2f;
        color: white;
        font-weight: bold;
    }

    .pagination .disabled {
        background-color: #b5b5b5;
        color: #444;
        cursor: not-allowed;
    }

    .page-info {
        text-align: center;
        margin-top: 12px;
        font-weight: bold;
        color: #333;
    }

    .footer {
        background-color: #2f2f2f;
        color: white;
        text-align: center;
        padding: 25px 0;
        font-size: 16px;
        font-weight: bold;
    }
</style>

</head>
<body>

<div class="page-wrapper">

    <div class="top-section">
        <h2>Admin Blog Dashboard</h2>

        <div class="nav-menu">
            <a href="/admin/dashboard">Manage Posts</a>
            <a href="/admin/users">Manage Users</a>
            <a href="/admin/post-module" class="active">Post Moderation</a>
            <a href="/admin/report">Reports</a>
        </div>
    </div>

    <div class="content-section">
        <div class="card">

            <h3>Post Moderation</h3>

            <% if (successMsg != null) { %>
                <div class="success-msg">
                    <%= successMsg %>
                </div>
            <% } %>

            <% if (blog == null) { %>

                <div class="empty-msg">
                    No pending blogs available for moderation.
                </div>

            <% } else { %>

                <table>
                    <thead>
                        <tr>
                            <th class="title-col">Title</th>
                            <th class="author-col">Author</th>
                            <th class="date-col">Date</th>
                            <th class="status-col">Status</th>
                            <th class="action-col">Actions</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr class="bottom-border">

                            <td><%= blog.getTitle() %></td>

                            <td>
                                <%= blog.getAuthor() %>
                            </td>

                            <td><%= blog.getCreatedDate() %></td>

                            <td>
                                <span class="status-badge">
                                    <%= blog.getStatus() %>
                                </span>
                            </td>

                            <td>
                                <div class="action-box">

                                    <form action="<%= request.getContextPath() %>/admin/blog/approve" method="post">
                                        <input type="hidden" name="id" value="<%= blog.getId() %>">
                                        <input type="hidden" name="page" value="<%= pg.getNumber() %>">

                                        <button type="submit" class="action-btn approve-btn">
                                            Approve
                                        </button>
                                    </form>

                                    <form action="<%= request.getContextPath() %>/admin/blog/reject" method="post">
                                        <input type="hidden" name="id" value="<%= blog.getId() %>">
                                        <input type="hidden" name="page" value="<%= pg.getNumber() %>">

                                        <button type="submit" class="action-btn reject-btn">
                                            Reject
                                        </button>
                                    </form>

                                    <form action="<%= request.getContextPath() %>/admin/blog/remove" method="post">
                                        <input type="hidden" name="id" value="<%= blog.getId() %>">
                                        <input type="hidden" name="page" value="<%= pg.getNumber() %>">
                                        <input type="hidden" name="adminNote" value="Blog removed by admin">

                                        <button type="submit" class="action-btn remove-btn">
                                            Remove
                                        </button>
                                    </form>

                                </div>
                            </td>

                        </tr>
                    </tbody>
                </table>

                <div class="pagination">

                    <% if (!pg.isFirst()) { %>
                        <a href="<%= request.getContextPath() %>/admin/post-module?page=<%= pg.getNumber() - 1 %>">
                            Previous
                        </a>
                    <% } else { %>
                        <span class="disabled">Previous</span>
                    <% } %>

                    <% if (!pg.isLast()) { %>
                        <a href="<%= request.getContextPath() %>/admin/post-module?page=<%= pg.getNumber() + 1 %>">
                            Next
                        </a>
                    <% } else { %>
                        <span class="disabled">Next</span>
                    <% } %>

                </div>

            <% } %>

        </div>
    </div>

    <div class="footer">
        © 2024 Blog Platform
    </div>

</div>

</body>
</html>