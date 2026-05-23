<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Profile Page</title>

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
      background:#222;
      text-align:center;
      padding:10px;
    }

    .header h1{
      margin-bottom:10px;
      font-size:20px;
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
      width:95%;
      margin:15px auto;
      background:white;
      color:black;
      padding:15px;
    }

    .section-title{
      font-size:18px;
      margin-bottom:10px;
      font-weight:bold;
    }

    .profile-info{
      margin-bottom:20px;
      line-height:1.8;
    }

    /* POSTS SECTION */
    .posts{
      margin-top:10px;
    }

    .post-card{
      background:#e9e9e9;
      padding:12px;
      margin-bottom:10px;
    }

    .post-title{
      font-weight:bold;
      margin-bottom:10px;
    }

    .btn{
      width:100%;
      padding:8px;
      border:none;
      margin-top:8px;
      cursor:pointer;
      color:white;
      background:#666;
    }

    .logout-btn{
      width:100%;
      padding:10px;
      background:#222;
      color:white;
      border:none;
      margin-top:20px;
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
  </div>

  <!-- MAIN CONTENT -->
  <div class="container">

    <!-- PROFILE SECTION -->
    <div class="profile-section">
      <div class="section-title">User Profile</div>

      <div class="profile-info">
        <p><strong>Name:</strong> John Doe</p>
        <p><strong>Email:</strong> johndoe@example.com</p>
      </div>
    </div>

    <!-- POSTS SECTION -->
    <div class="posts">
      <div class="section-title">Your Posts</div>

      <div class="post-card">
        <div class="post-title">Your Blog Title 1</div>

        <button class="btn">Edit</button>
        <button class="btn">Delete</button>
      </div>
    </div>

    <!-- LOGOUT -->
    <button class="logout-btn">Logout</button>

  </div>

  <!-- FOOTER -->
  <div class="footer">
    © 2024 Blog Platform
  </div>

</body>
</html>