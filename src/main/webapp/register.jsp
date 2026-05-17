<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registration Page</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #4facfe, #00f2fe);
        }

        .register-container {
            background: #fff;
            padding: 40px;
            width: 350px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        .register-container h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        .input-group {
            margin-bottom: 18px;
        }

        .input-group label {
            display: block;
            margin-bottom: 6px;
            font-size: 14px;
            color: #555;
        }

        .input-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
            transition: 0.3s;
        }

        .input-group input:focus {
            border-color: #4facfe;
            box-shadow: 0 0 5px rgba(79, 172, 254, 0.5);
        }

        .register-btn {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 8px;
            background: #4facfe;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }

        .register-btn:hover {
            background: #2196f3;
        }

        .login-link {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }

        .login-link a {
            text-decoration: none;
            color: #4facfe;
            font-weight: bold;
        }

        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

    <div class="register-container">
        <h2>Create Account</h2>

        <form>
            <!-- Username Field -->
            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" placeholder="Enter username" required />
            </div>

            <!-- Email Field -->
            <div class="input-group">
                <label for="email">Email</label>
                <input type="email" id="email" placeholder="Enter email" required />
            </div>

            <!-- Password Field -->
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" placeholder="Enter password" required />
            </div>

            <!-- FullName Field -->
            <div class="input-group">
                <label for="FullName">FullName</label>
                <input type="text" id="fullname" placeholder="Enter FullName" required />
            </div>

            <!-- Register Button -->
            <button type="submit" class="register-btn">
                Register
            </button>

            <!-- Login Link -->
            <div class="login-link">
                Already have an account?
                <a href="login.html">Login</a>
            </div>
        </form>
    </div>

</body>

</html>