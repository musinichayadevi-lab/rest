<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.temporal.ChronoUnit" %>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);


if(session.getAttribute("name") == null){
    response.sendRedirect("userlogin.jsp");
    return;
}

String name = (String)session.getAttribute("name");
String bloodGroup = (String)session.getAttribute("bloodGroup");

Date lastDonationDate =
        (Date)session.getAttribute("lastDonationDate");

if(name == null || name.trim().isEmpty()){
    name = "User";
}

if(bloodGroup == null || bloodGroup.trim().isEmpty()){
    bloodGroup = "N/A";
}

String initials = "";

String[] words = name.split(" ");

for(String w : words){
    if(w.length() > 0){
        initials += Character.toUpperCase(w.charAt(0));
    }
}

/* Blood donation gap = 90 days */

long eligibleDays = 0;

if(lastDonationDate != null){

    LocalDate lastDate = lastDonationDate.toLocalDate();

    LocalDate nextEligibleDate =
            lastDate.plusDays(90);

    eligibleDays =
            ChronoUnit.DAYS.between(
                    LocalDate.now(),
                    nextEligibleDate);

    if(eligibleDays < 0){
        eligibleDays = 0;
    }
}
%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>BloodConnect Dashboard</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    background:#f1f5f9;
    display:flex;
    min-height:100vh;
}

/* SIDEBAR */

.sidebar{
    width:270px;
    background:#0f172a;
    color:white;
    padding:25px 18px;
    display:flex;
    flex-direction:column;
}

.logo{
    display:flex;
    align-items:center;
    gap:15px;
    margin-bottom:40px;
}

.logo-icon{
    width:55px;
    height:55px;
    border-radius:15px;
    background:#ef4444;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:24px;
    color:white;
}

.logo-text h2{
    font-size:24px;
}

.logo-text p{
    color:#94a3b8;
    font-size:13px;
}

.nav-title{
    color:#64748b;
    font-size:12px;
    margin:20px 10px 12px;
    text-transform:uppercase;
}

.nav-item{
    padding:14px;
    border-radius:12px;
    margin-bottom:10px;
    cursor:pointer;
    display:flex;
    align-items:center;
    gap:12px;
    transition:0.3s;
    font-size:15px;
}

.nav-item:hover{
    background:#1e293b;
}

.active{
    background:#dc2626;
}

.user-box{
    margin-top:auto;
    background:#1e293b;
    padding:15px;
    border-radius:16px;
    display:flex;
    align-items:center;
    gap:12px;
}

.avatar{
    width:48px;
    height:48px;
    border-radius:50%;
    background:#ef4444;
    display:flex;
    align-items:center;
    justify-content:center;
    font-weight:bold;
    font-size:18px;
    color:white;
}

/* MAIN */

.main{
    flex:1;
    padding:35px;
}

.header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:30px;
}

.header h1{
    font-size:32px;
    color:#0f172a;
}

.top-right{
    display:flex;
    align-items:center;
    gap:20px;
}

.logout-btn{
    padding:12px 20px;
    border:none;
    border-radius:12px;
    background:#dc2626;
    color:white;
    cursor:pointer;
    font-weight:600;
    transition:0.3s;
}

.logout-btn:hover{
    background:#b91c1c;
}

/* WELCOME CARD */

.welcome-card{
    background:linear-gradient(135deg,#0f172a,#1d4ed8);
    color:white;
    padding:40px;
    border-radius:24px;
    margin-bottom:35px;
    box-shadow:0 10px 25px rgba(0,0,0,0.15);
}

.tag{
    display:inline-block;
    background:rgba(255,255,255,0.15);
    padding:9px 16px;
    border-radius:25px;
    margin-bottom:20px;
    font-size:14px;
}

.welcome-card h2{
    font-size:34px;
    margin-bottom:12px;
}

.welcome-card p{
    color:#dbeafe;
    margin-bottom:28px;
    font-size:17px;
    line-height:1.6;
}

.btn-group{
    display:flex;
    gap:15px;
    flex-wrap:wrap;
}

.btn{
    padding:14px 24px;
    border:none;
    border-radius:12px;
    cursor:pointer;
    font-weight:600;
    transition:0.3s;
    font-size:15px;
}

.btn-primary{
    background:#ef4444;
    color:white;
}

.btn-primary:hover{
    background:#dc2626;
}

.btn-secondary{
    background:rgba(255,255,255,0.12);
    color:white;
    border:1px solid rgba(255,255,255,0.2);
}

.btn-secondary:hover{
    background:rgba(255,255,255,0.2);
}

/* STATS */

.stats-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(240px,1fr));
    gap:24px;
}

.card{
    background:white;
    border-radius:20px;
    padding:30px;
    box-shadow:0 4px 15px rgba(0,0,0,0.06);
    transition:0.3s;
}

.card:hover{
    transform:translateY(-6px);
}

.card-icon{
    width:60px;
    height:60px;
    border-radius:16px;
    background:#fee2e2;
    color:#dc2626;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:24px;
    margin-bottom:18px;
}

.value{
    font-size:38px;
    font-weight:bold;
    color:#0f172a;
}

.label{
    color:#64748b;
    margin-top:8px;
    font-size:15px;
}

/* RESPONSIVE */

@media(max-width:900px){

    body{
        flex-direction:column;
    }

    .sidebar{
        width:100%;
    }

    .main{
        padding:20px;
    }

    .header{
        flex-direction:column;
        align-items:flex-start;
        gap:15px;
    }

    .welcome-card{
        padding:25px;
    }

    .welcome-card h2{
        font-size:28px;
    }
}

</style>

</head>

<body>

<!-- SIDEBAR -->

<div class="sidebar">

    <div class="logo">

        <div class="logo-icon">
            <i class="fa-solid fa-heart"></i>
        </div>

        <div class="logo-text">
            <h2>BloodConnect</h2>
            <p>Save Lives Together</p>
        </div>

    </div>

    <div class="nav-title">Main Menu</div>

  <div class="nav-item" onclick="window.location.href='requestHistory'">
    Request History
</div>

<div class="nav-item" onclick="window.location.href='notifications'">
    Notifications
</div>

<div class="nav-item" onclick="window.location.href='profile'">
    My Profile
</div>
    <div class="user-box">

        <div class="avatar">
            <%= initials %>
        </div>

        <div>
            <h4><%= name %></h4>
            <p><%= bloodGroup %> Donor</p>
        </div>

    </div>

</div>

<!-- MAIN -->

<div class="main">

    <!-- HEADER -->

    <div class="header">

        <h1>
            <i class="fa-solid fa-droplet"></i>
            User Dashboard
            
        </h1>

        <div class="top-right">

            <div class="avatar">
                <%= initials %>
            </div>

           
   <form action="logout" method="post" style="display:inline;">
    <button class="btn btn-primary" type="submit">
        <i class="fa-solid fa-right-from-bracket"></i>
        Logout
    </button>
</form>


        </div>

    </div>

    <!-- WELCOME CARD -->

    <div class="welcome-card">

        <div class="tag">
            <i class="fa-solid fa-clock"></i>
            Eligible to donate in <%= eligibleDays %> days
        </div>

        <h2>
            Welcome back, <%= name %>
        </h2>

        <p>
            Your blood group
            <strong><%= bloodGroup %></strong>
            is currently in high demand.
            Thank you for helping save lives.
        </p>

        <div class="btn-group">
        <div class="btn-group">

<button class="btn btn-primary"
onclick="window.location.href='findDonors'">
    <i class="fa-solid fa-magnifying-glass"></i>
    Find Donors
</button>

<button class="btn btn-primary"
onclick="window.location.href='emergency_request'">
    <i class="fa-solid fa-triangle-exclamation"></i>
    Emergency Request
</button>

</div>
			
        </div>

    </div>

    <!-- STATS -->

    <div class="stats-grid">

        <div class="card">

            <div class="card-icon">
                <i class="fa-solid fa-heart"></i>
            </div>

            <div class="value">8</div>

            <div class="label">
                Total Donations
            </div>

        </div>

        <div class="card">

            <div class="card-icon">
                <i class="fa-solid fa-hospital"></i>
            </div>

            <div class="value">8</div>

            <div class="label">
                Lives Saved
            </div>

        </div>

        <div class="card">

            <div class="card-icon">
                <i class="fa-solid fa-calendar-days"></i>
            </div>

            <div class="value"><%= eligibleDays %></div>

            <div class="label">
                Days Until Eligible
            </div>

        </div>

        <div class="card">

            <div class="card-icon">
                <i class="fa-solid fa-triangle-exclamation"></i>
            </div>

            <div class="value">1</div>

            <div class="label">
                Active Requests
            </div>

        </div>

    </div>

</div>

</body>
</html>
