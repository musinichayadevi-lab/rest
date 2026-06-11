<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BloodConnect Login</title>

    <link rel="stylesheet" href="style.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<style>
    *{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:#f3f3f3;
}

.container{
    display:flex;
    min-height:100vh;
}

/* LEFT SECTION */

.left{
    width:45%;
    background:linear-gradient(135deg,#0f122d,#1b1230);
    color:white;
    padding:70px;
    position:relative;
    overflow:hidden;
}

.left::before{
    content:'';
    position:absolute;
    width:500px;
    height:500px;
    background:rgba(255, 76, 76, 0.08);
    border-radius:50%;
    top:-120px;
    right:-100px;
}

.left::after{
    content:'';
    position:absolute;
    width:350px;
    height:350px;
    background:rgba(255, 76, 76, 0.06);
    border-radius:50%;
    bottom:-120px;
    left:-100px;
}

.logo{
    display:flex;
    align-items:center;
    gap:15px;
    margin-bottom:90px;
}

.logo-icon{
    width:55px;
    height:55px;
    background:#e74c3c;
    border-radius:14px;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:26px;
}

.logo-text h2{
    font-size:22px;
}

.logo-text p{
    font-size:14px;
    color:#d1d1d1;
}

.hero h1{
    font-size:58px;
    line-height:1.2;
    margin-bottom:30px;
    font-weight:700;
}

.hero p{
    font-size:22px;
    line-height:1.8;
    color:#d7d7d7;
    max-width:650px;
}

.stats{
    display:flex;
    gap:70px;
    margin-top:90px;
}

.stat h2{
    font-size:48px;
    margin-bottom:10px;
}

.stat p{
    font-size:20px;
    color:#d6d6d6;
}

/* RIGHT SECTION */

.right{
    width:55%;
    display:flex;
    align-items:center;
    justify-content:center;
    background:#f5f5f5;
}

.login-box{
    width:500px;
}

.login-box h1{
    font-size:52px;
    margin-bottom:15px;
    color:#111827;
}

.subtitle{
    color:#6b7280;
    margin-bottom:45px;
    font-size:22px;
}

.form-group{
    margin-bottom:28px;
}

label{
    display:block;
    margin-bottom:10px;
    font-weight:500;
    font-size:18px;
}

input,
select{
    width:100%;
    padding:20px;
    border:1px solid #ddd;
    border-radius:14px;
    font-size:18px;
    outline:none;
    background:white;
}

input:focus,
select:focus{
    border-color:#d6402f;
}

.row{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:30px;
}

.remember{
    display:flex;
    align-items:center;
    gap:10px;
    color:#555;
    font-size:18px;
}

.remember input{
    width:auto;
}

.forgot{
    text-decoration:none;
    color:#d6402f;
    font-size:18px;
}

.btn{
    width:100%;
    padding:18px;
    background:#c73a2c;
    color:white;
    border:none;
    border-radius:14px;
    font-size:24px;
    cursor:pointer;
    transition:0.3s;
    font-weight:600;
}

.btn:hover{
    background:#a82d21;
}

.register{
    text-align:center;
    margin-top:30px;
    color:#9ca3af;
    font-size:18px;
}

.register a{
    color:#d6402f;
    text-decoration:none;
    font-weight:600;
}

/* RESPONSIVE */

@media(max-width:992px){

    .container{
        flex-direction:column;
    }

    .left,
    .right{
        width:100%;
    }

    .left{
        padding:40px;
    }

    .hero h1{
        font-size:42px;
    }

    .stats{
        gap:30px;
        flex-wrap:wrap;
    }

    .login-box{
        width:90%;
        padding:50px 0;
    }
}
</style>
<body>

<div class="container">

    <!-- LEFT SIDE -->

    <div class="left">

        <div class="logo">
            <div class="logo-icon">❤️</div>

            <div class="logo-text">
                <h2>BloodConnect</h2>
                <p>Save Lives Together</p>
            </div>
        </div>

        <div class="hero">
            <h1>Every drop counts. Be a hero today.</h1>

            <p>
                Join thousands of donors who have saved lives across India.
                Register, donate, and track your impact.
            </p>
        </div>

        <div class="stats">

            <div class="stat">
                <h2>12K+</h2>
                <p>Active Donors</p>
            </div>

            <div class="stat">
                <h2>8K+</h2>
                <p>Lives Saved</p>
            </div>

            <div class="stat">
                <h2>200+</h2>
                <p>Cities</p>
            </div>

        </div>

    </div>

    <!-- RIGHT SIDE -->

    <div class="right">

        <div class="login-box">

            <h1>Welcome back</h1>

            <p class="subtitle">
                Sign in to your account to continue
            </p>

            <form action="userlogin" method="post">

                <div class="form-group">
                    <label>Email address</label>

                    <input type="email"name="email"placeholder="Enter Email"required>
                </div>

                <div class="form-group">
                    <label>Password</label>

                    <input type="password" name="password" placeholder="Enter Password"required>
                </div>
                 <div class="form-group">
					    <label>Role</label>
					
					    <select name="role" required>
					        <option value="">Select Role</option>
					        <option value="USER">User</option>
					        <option value="DONOR">Donor</option>
					        <option value="ADMIN">Admin</option>
					    </select>
					</div>

                <div class="row">

                    <div class="remember"><input type="checkbox"> <span>Remember me</span>
                    <a href="#" class="forgot">
                        Forgot password?
                    </a>
                </div>
                </div>

                <button type="submit" class="btn">
                    Login 🔐
                </button>

            </form>

            <div class="register">
                Don't have an account?
                <a href="register.html">Register now</a>
            </div>

        </div>

    </div>

</div>

</body>
</html>