<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Reset Password</title>
<link rel="stylesheet" href="style.css">
<style>
body{
margin:0;
font-family:Segoe UI,sans-serif;
background:#f5f5f5;
}

.container{
display:flex;
height:100vh;
}

.left-panel{
width:50%;
background:#101332;
color:white;
padding:80px;
display:flex;
flex-direction:column;
justify-content:center;
}

.left-panel h1{
font-size:40px;
}

.left-panel h2{
font-size:45px;
margin-top:30px;
}

.right-panel{
width:50%;
display:flex;
justify-content:center;
align-items:center;
background:#f4f4f6;
}

.card{
width:400px;
background:white;
padding:40px;
border-radius:10px;
box-shadow:0 0 10px rgba(0,0,0,0.1);
}

.card h1{
text-align:center;
margin-bottom:30px;
}

label{
display:block;
margin-top:15px;
margin-bottom:5px;
}

input{
width:100%;
padding:12px;
border:1px solid #ddd;
border-radius:5px;
}

button{
width:100%;
padding:12px;
background:#c93b2a;
border:none;
color:white;
font-size:16px;
border-radius:5px;
margin-top:20px;
cursor:pointer;
}

a{
display:block;
text-align:center;
margin-top:15px;
text-decoration:none;
}
</style>
</head>
<body>

<div class="container">

<div class="left-panel">
<h1>BloodConnect</h1>
<h2>Every drop counts. Be a hero today.</h2>
</div>

<div class="right-panel">

<div class="card">

<h1>Set New Password</h1>

<form action="updatePassword" method="post">

<input type="hidden"
name="email"
value="${email}">

<label>New Password</label>

<input type="password"
name="password"
required>

<label>Confirm Password</label>

<input type="password"
name="confirmPassword"
required>

<button type="submit">
Reset Password
</button>

</form>

</div>

</div>

</div>

</body>
</html>