<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>adminLogin - BloodConnect</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, sans-serif;
}

body{
    background:#f5f7fb;
}
.red-bg{
    background:#fde8e8;
    color:#d94b32;
}
.container{
    display:flex;
    height:100vh;
}

/* LEFT SIDE */

.left{
    flex:1;
    background:linear-gradient(135deg,#d62828,#ff6b6b);
    color:white;
    padding:60px;
    display:flex;
    flex-direction:column;
    justify-content:center;
}

.logo{
    display:flex;
    align-items:center;
    margin-bottom:40px;
}

.logo-icon{
    font-size:40px;
    margin-right:15px;
}

.logo-text h2{
    font-size:30px;
}

.logo-text p{
    font-size:14px;
}

.hero h1{
    font-size:42px;
    margin-bottom:20px;
    line-height:1.3;
}

.hero p{
    font-size:18px;
    line-height:1.6;
    margin-bottom:40px;
}

.stats{
    display:flex;
    gap:30px;
}

.stat{
    background:rgba(255,255,255,0.15);
    padding:20px;
    border-radius:12px;
    width:140px;
    text-align:center;
}

.stat h2{
    font-size:28px;
}

.stat p{
    margin-top:10px;
}

/* RIGHT SIDE */

.right{
    flex:1;
    display:flex;
    justify-content:center;
    align-items:center;
    background:white;
}

.login-box{
    width:400px;
    padding:40px;
    border-radius:15px;
    box-shadow:0 0 20px rgba(0,0,0,0.1);
}

.login-box h1{
    margin-bottom:10px;
    color:#d62828;
}

.subtitle{
    margin-bottom:30px;
    color:gray;
}

.form-group{
    margin-bottom:20px;
}

.form-group label{
    display:block;
    margin-bottom:8px;
    font-weight:bold;
}

.form-group input{
    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:8px;
    font-size:15px;
}

.row{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:25px;
}

.remember{
    display:flex;
    align-items:center;
    gap:8px;
}

.forgot{
    text-decoration:none;
    color:#d62828;
    font-size:14px;
}

.btn{
    width:100%;
    padding:14px;
    border:none;
    border-radius:10px;
    background:#d62828;
    color:white;
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
}

.btn:hover{
    background:#b71c1c;
}

.register{
    margin-top:20px;
    text-align:center;
}

.register a{
    color:#d62828;
    text-decoration:none;
    font-weight:bold;
}

.admin-tag{
    background:#fff3f3;
    color:#d62828;
    padding:8px 15px;
    border-radius:20px;
    display:inline-block;
    margin-bottom:20px;
    font-weight:bold;
}


</style>
</head>

<body>

<div class="container">

    <!-- LEFT SIDE -->

    <div class="left">

        <div class="logo">

            <div class="logo-icon"></div>

            <div class="logo-text">
                <h2>BloodConnect</h2>
                <p>Admin Panel</p>
            </div>

        </div>

        <div class="hero">

            <h1>Manage donors, requests, and save lives efficiently.</h1>

            <p>
                Admin dashboard helps manage blood donors,
                monitor requests, and maintain the system securely.
            </p>

        </div>

        <div class="stats">

            <div class="stat">
                <h2>12K+</h2>
                <p>Users</p>
            </div>

            <div class="stat">
                <h2>5K+</h2>
                <p>Requests</p>
            </div>

            <div class="stat">
                <h2>99%</h2>
                <p>Success Rate</p>
            </div>

        </div>

    </div>

    <!-- RIGHT SIDE -->

    <div class="right">

        <div class="login-box">

            <div class="admin-tag">
                ADMIN LOGIN
            </div>

            <h1>Welcome Admin</h1>

            <p class="subtitle">
                Login to access the admin dashboard
            </p>

            <form action="/adminlogin" method="post">
                <div class="form-group">
                    <label>Username</label>
                    <input type="text" name="username"placeholder="Enter Username"required>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password"
                           name="password"
                           placeholder="Enter Password"
                            required>
                </div>
                <div class="row">
                    <div class="remember">
                        <input type="checkbox">
                        <span>Remember me</span>
                    </div>
                    <a href="#" class="forgot">
                        Forgot password?
                    </a>
                </div>

                <button type="submit" class="btn">
                    Admin Login 
                </button>

            </form>

            <div class="register">
                Back to
                <a href="index.html">User Login</a>
            </div>

        </div>

    </div>

</div>

</body>
</html>