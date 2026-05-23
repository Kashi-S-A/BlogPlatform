<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Blog Dashboard</title>

  <style>
    *{
      margin:0;
      padding:0;
      box-sizing:border-box;
      font-family: Arial, sans-serif;
    }

    body{
      background:#2f2f2f;
      color:white;
    }

    /* HEADER */
    .header{
      text-align:center;
      padding:10px;
      background:#222;
    }

    .header h1{
      font-size:20px;
      margin-bottom:10px;
    }

    /* NAVBAR */
    .btn-section{
        display: flex;
        flex-direction: column;
        margin-bottom: 30px;
    }
    
    .btn-section button{
        padding: 8px 0;
        color: aliceblue;
        border: #3b3b3b;
        border-radius: 4px;
        background-color: #3b3b3b;
    }

    .btn-section .active{
        background-color: #555555;
    }

    /* MAIN CONTAINER */
    .container{
      width:98%;
      margin:15px auto;
      background:white;
      color:black;
      padding:15px;
      border-radius:2px;
    }

    .container h2{
      margin-bottom:10px;
      font-size:22px;
    }

    /* SEARCH */
    .search-box,
    .sort-box{
      width:100%;
      padding:8px;
      margin-bottom:10px;
      border:1px solid #ccc;
    }

    /* BLOG CARD */
    .blog-card{
      background:#e9e9e9;
      padding:15px;
      margin-top:15px;
    }

    .blog-card h3{
      margin-bottom:8px;
    }

    .blog-card p{
      margin-bottom:5px;
      font-size:14px;
    }

    .read-more{
      display:inline-block;
      margin-top:8px;
      text-decoration:none;
      color:black;
      font-weight:bold;
    }

    /* PAGINATION */
    .pagination{
      margin-top:20px;
    }

    .page-btn{
      width:100%;
      background:#2f2f2f;
      color:white;
      border:none;
      padding:8px;
      margin-bottom:8px;
      cursor:pointer;
    }

    /* FOOTER */
    .footer{
      text-align:center;
      background:#222;
      padding:20px;
      margin-top:20px;
      color:white;
    }
  </style>
</head>

<body>

  <!-- HEADER -->
  <div class="header">
    <h1>Blog Dashboard</h1>

    <!-- NAVBAR -->
    <div class="btn-section">
        <button class="active">Home</button>
        <button>Create New Post</button>
        <button>Profile</button>
    </div>

  <!-- CONTENT -->
  <div class="container">
    <h2>Blog Posts</h2>

    <input type="text" placeholder="Search posts..." class="search-box">

    <select class="sort-box">
      <option>Sort by Date</option>
      <option>Newest</option>
      <option>Oldest</option>
    </select>

    <!-- BLOG CARD -->
    <div class="blog-card">
      <h3>Blog Title 1</h3>

      <p>
        <strong>Author:</strong> John Doe |
        <strong>Date:</strong> 2024-08-09
      </p>

      <p>
        Excerpt: This is an example excerpt from a blog post...
      </p>

      <a href="#" class="read-more">Read More</a>
    </div>

    <!-- PAGINATION -->
    <div class="pagination">
      <button class="page-btn">&lt; Prev</button>
      <button class="page-btn">Next &gt;</button>
    </div>
  </div>

  <!-- FOOTER -->
  <div class="footer">
    © 2024 Blog Platform
  </div>

</body>
</html>