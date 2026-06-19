<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BloodConnect Register</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

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
    background:rgba(255,76,76,0.08);
    border-radius:50%;
    top:-120px;
    right:-100px;
}

.left::after{
    content:'';
    position:absolute;
    width:350px;
    height:350px;
    background:rgba(255,76,76,0.06);
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
    font-size:52px;
    line-height:1.2;
    margin-bottom:30px;
    font-weight:700;
}

.hero p{
    font-size:20px;
    line-height:1.8;
    color:#d7d7d7;
}

.stats{
    display:flex;
    gap:50px;
    margin-top:80px;
}

.stat h2{
    font-size:40px;
}

.stat p{
    color:#d6d6d6;
}

/* RIGHT SECTION */

.right{
    width:55%;
    display:flex;
    align-items:center;
    justify-content:center;
    background:#f5f5f5;
    padding:40px 0;
}

.register-box{
    width:520px;
}

.register-box h1{
    font-size:46px;
    margin-bottom:10px;
    color:#111827;
}

.subtitle{
    color:#6b7280;
    margin-bottom:35px;
    font-size:18px;
}

.form-group{
    margin-bottom:20px;
}

label{
    display:block;
    margin-bottom:8px;
    font-weight:500;
}

input,
select{
    width:100%;
    padding:16px;
    border:1px solid #ddd;
    border-radius:12px;
    font-size:16px;
    outline:none;
}

input:focus,
select:focus{
    border-color:#d6402f;
}

.btn{
    width:100%;
    padding:18px;
    background:#c73a2c;
    color:white;
    border:none;
    border-radius:14px;
    font-size:20px;
    cursor:pointer;
    margin-top:10px;
    transition:0.3s;
    font-weight:600;
}
.btn:hover{
    background:#a82d21;
}

.login{
    text-align:center;
    margin-top:25px;
    color:#9ca3af;
}

.login a{
    color:#d6402f;
    text-decoration:none;
    font-weight:600;
}
.login{
    text-align:center;
    margin-top:20px;
    color:#9ca3af;
    font-size:18px;
}

.login-btn{
    background:none;
    border:none;
    color:#d6402f;
    font-size:18px;
    font-weight:600;
    cursor:pointer;
    margin-left:5px;
}

.login-btn:hover{
    text-decoration:underline;
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
        font-size:38px;
    }

    .stats{
        flex-wrap:wrap;
        gap:30px;
    }

    .register-box{
        width:90%;
    }
}

</style>

</head>

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
            <h1>Become a donor and save lives.</h1>

            <p>
                Register today and help patients in need.
                Your single donation can save multiple lives.
            </p>
        </div>

        <div class="stats">

            <div class="stat">
                <h2>12K+</h2>
                <p>Donors</p>
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

        <div class="register-box">

            <h1>Create Account</h1>

            <p class="subtitle">Register as a blood donor</p>
            <form action="register" method="post">

                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text"name="fullname" placeholder="Enter Full Name"required>
                </div>
                <div class="form-group">
                    <label>Email Address</label>
                    <input type="email"name="email"placeholder="Enter Email"required>
                </div>

                <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="password" placeholder="Enter Password" required>
                </div>

                <div class="form-group">
                    <label>Blood Group</label>

                    <select name="bloodgroup" required>
                        <option value="">Select Blood Group</option>
                        <option>A+</option>
                        <option>A-</option>
                        <option>B+</option>
                        <option>B-</option>
                        <option>AB+</option>
                        <option>AB-</option>
                        <option>O+</option>
                        <option>O-</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>City</label>
                    <input type="text" name="city"placeholder="Enter City" required>
                </div>
                <div class="form-group">
                    <label>Phone Number</label>
                    <input type="text" name="phone"placeholder="Enter Phone Number"required>
                </div>
	
                <div class="form-group">
                    <label>Last Donation Date</label>
                     <input type="date"name="lastDonationDate">
                </div>
                <button type="submit" class="btn"> Register ❤️</button>
            </form>

            <div class="login">
    Already have an account?

    <button type="button"
            class="login-btn"
            onclick="window.location.href='userlogin'">
        Login
    </button>
</div>
        </div>

    </div>

</div>

</body>
</html>


