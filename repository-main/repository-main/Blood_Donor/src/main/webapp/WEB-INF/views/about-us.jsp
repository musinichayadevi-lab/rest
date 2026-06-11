<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>About BloodConnect</title>

<style>
    :root{
  --red:#DC2626;
  --red-dark:#B91C1C;
  --bg:#F8FAFC;
  --white:#fff;
  --gray-50:#F9FAFB;
  --gray-100:#E5E7EB;
  --gray-200:#D1D5DB;
  --gray-300:#9CA3AF;
  --gray-400:#6B7280;
  --gray-500:#4B5563;
  --gray-600:#374151;
  --dark:#0F172A;
  --success:#10B981;
  --info:#2563EB;
  --warning:#F59E0B;
  --radius:16px;
}

*{
  margin:0;
  padding:0;
  box-sizing:border-box;
  font-family:'Segoe UI',sans-serif;
}

body{
  background:var(--bg);
  color:var(--dark);
}

a{
  text-decoration:none;
}

.container{
  width:90%;
  max-width:1200px;
  margin:auto;
}

.btn{
  padding:12px 22px;
  border:none;
  border-radius:10px;
  cursor:pointer;
  font-weight:600;
  transition:0.3s;
}

.btn-primary{
  background:var(--red);
  color:white;
}

.btn-primary:hover{
  background:var(--red-dark);
}

.btn-outline{
  border:1px solid var(--red);
  color:var(--red);
  background:white;
}

.card{
  background:white;
  border-radius:var(--radius);
  padding:24px;
  box-shadow:0 4px 10px rgba(0,0,0,0.05);
}

.input{
  width:100%;
  padding:14px;
  border:1px solid var(--gray-200);
  border-radius:10px;
  margin-top:8px;
  margin-bottom:18px;
  font-size:15px;
}

.input:focus{
  outline:none;
  border-color:var(--red);
}

.page-title{
  font-size:34px;
  margin-bottom:10px;
}

.page-sub{
  color:var(--gray-400);
  margin-bottom:30px;
}

.grid-2{
  display:grid;
  grid-template-columns:repeat(auto-fit,minmax(300px,1fr));
  gap:20px;
}

.table{
  width:100%;
  border-collapse:collapse;
}

.table th,
.table td{
  padding:14px;
  border-bottom:1px solid var(--gray-100);
  text-align:left;
}

.badge{
  padding:5px 10px;
  border-radius:20px;
  font-size:12px;
  font-weight:600;
}

.badge-green{
  background:#D1FAE5;
  color:#065F46;
}

.badge-red{
  background:#FEE2E2;
  color:#991B1B;
}

.navbar{
  background:white;
  padding:18px 0;
  box-shadow:0 2px 8px rgba(0,0,0,0.05);
}

.nav-content{
  display:flex;
  justify-content:space-between;
  align-items:center;
}

.logo{
  display:flex;
  align-items:center;
  gap:10px;
}

.logo-icon{
  width:40px;
  height:40px;
  background:var(--red);
  border-radius:10px;
  display:flex;
  align-items:center;
  justify-content:center;
  color:white;
  font-size:18px;
}

.hero{
  padding:80px 0;
  text-align:center;
}

.hero h1{
  font-size:60px;
  margin-bottom:20px;
}

.hero p{
  color:var(--gray-400);
  font-size:20px;
  margin-bottom:30px;
}

.footer{
  background:var(--dark);
  color:white;
  padding:30px;
  text-align:center;
  margin-top:50px;
}

@media(max-width:768px){

.hero h1{
  font-size:40px;
}

.page-title{
  font-size:28px;
}

}
</style>
</head>

<body>

<section class="hero">

<div class="container">

<h1>About BloodConnect</h1>

<p>
BloodConnect helps patients find blood donors quickly during emergencies.
</p>

</div>

</section>

<div class="container">

<div class="grid-2">

<div class="card">

<h2>Our Mission</h2>

<p style="margin-top:15px;color:gray">
To connect blood donors with people in need and save lives.
</p>

</div>

<div class="card">

<h2>Our Vision</h2>

<p style="margin-top:15px;color:gray">
A world where nobody suffers due to blood shortage.
</p>

</div>

</div>

</div>

<footer class="footer">
Blood donation saves lives ❤️
</footer>

</body>
</html>