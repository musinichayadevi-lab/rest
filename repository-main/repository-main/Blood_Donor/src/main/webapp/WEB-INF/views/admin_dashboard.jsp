<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BloodConnect Admin Dashboard</title>
<link rel="stylesheet" href="admin.css">
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
    background:#f3f4f6;
    display:flex;
    min-height:100vh;
}

/* SIDEBAR */

.sidebar{
    width:320px;
    background:#11152f;
    color:white;
    padding:25px 20px;
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
    background:linear-gradient(135deg,#ff512f,#dd2476);
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:24px;
}

.logo h2{
    font-size:24px;
}

.logo p{
    color:#cbd5e1;
    margin-top:4px;
}

.section-title{
    font-size:13px;
    color:#9ca3af;
    margin:25px 10px 15px;
    letter-spacing:1px;
}

.menu-item{
    display:flex;
    align-items:center;
    gap:15px;
    padding:16px;
    border-radius:14px;
    margin-bottom:10px;
    cursor:pointer;
    transition:0.3s;
    font-size:18px;
}

.menu-item i{
    width:25px;
}

.menu-item:hover{
    background:#1f2947;
}

.active{
    background:#c8372b;
}

.notification{
    margin-left:auto;
    background:#e74c3c;
    width:28px;
    height:28px;
    border-radius:50%;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:14px;
}

.profile-box{
    margin-top:auto;
    background:#1d2243;
    padding:18px;
    border-radius:16px;
    display:flex;
    align-items:center;
    gap:15px;
}

.avatar{
    width:55px;
    height:55px;
    border-radius:50%;
    background:#d94b32;
    display:flex;
    align-items:center;
    justify-content:center;
    font-weight:bold;
    font-size:22px;
}

.profile-box h3{
    font-size:24px;
}

.profile-box p{
    color:#cbd5e1;
}

/* SIGN OUT */

.signout{
    margin-top:20px;
    display:flex;
    align-items:center;
    gap:12px;
    padding:15px;
    border-radius:12px;
    cursor:pointer;
    color:#ff6b6b;
    font-size:20px;
    transition:0.3s;
}

.signout:hover{
    background:#1f2947;
}

/* MAIN CONTENT */

.main{
    flex:1;
    padding:30px;
}

.topbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:40px;
}

.topbar h1{
    font-size:52px;
    color:#11152f;
}

.top-icons{
    display:flex;
    align-items:center;
    gap:20px;
}

.icon-box{
    width:60px;
    height:60px;
    background:#e5e7eb;
    border-radius:16px;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:24px;
    position:relative;
}

.badge{
    position:absolute;
    top:-5px;
    right:-5px;
    width:28px;
    height:28px;
    background:#d94b32;
    color:white;
    border-radius:50%;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:14px;
}

.top-avatar{
    width:60px;
    height:60px;
    border-radius:50%;
    background:#d94b32;
    color:white;
    display:flex;
    align-items:center;
    justify-content:center;
    font-weight:bold;
    font-size:22px;
}

/* HEADER */

.page-title h2{
    font-size:55px;
    color:#1e1e3f;
}

.page-title p{
    color:#6b7280;
    margin-top:10px;
    font-size:24px;
    margin-bottom:35px;
}

/* CARDS */

.card-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(280px,1fr));
    gap:25px;
}

.card{
    background:white;
    border-radius:25px;
    padding:30px;
    position:relative;
    overflow:hidden;
    border:1px solid #e5e7eb;
}

.card::after{
    content:'';
    position:absolute;
    width:220px;
    height:220px;
    border-radius:50%;
    top:-80px;
    right:-80px;
    opacity:0.15;
}

.red-card::after{
    background:#e74c3c;
}

.green-card::after{
    background:#27ae60;
}

.blue-card::after{
    background:#3498db;
}

.yellow-card::after{
    background:#f39c12;
}

.card-icon{
    width:60px;
    height:60px;
    border-radius:16px;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:28px;
    margin-bottom:20px;
}

.red-bg{
    background:#fde8e8;io
    color:#d94b32;
}

.green-bg{
    background:#dcfce7;
    color:#16a34a;
}

.blue-bg{
    background:#dbeafe;
    color:#2563eb;
}

.yellow-bg{
    background:#fef3c7;
    color:#d97706;
}

.card h1{
    font-size:60px;
    color:#1e1e3f;
}

.card p{
    margin-top:10px;
    color:#6b7280;
    font-size:26px;
}

.card span{
    display:block;
    margin-top:20px;
    font-size:22px;
    font-weight:600;
}

.green-text{
    color:#16a34a;
}

.red-text{
    color:#dc2626;
}

/* BOTTOM SECTION */

.bottom-grid{
    margin-top:35px;
    display:grid;
    grid-template-columns:2fr 1fr;
    gap:25px;
}

.bottom-card{
    background:white;
    border-radius:25px;
    padding:30px;
    border:1px solid #e5e7eb;
}

.bottom-card h2{
    margin-bottom:30px;
    color:#1e1e3f;
    font-size:38px;
}

/* CHART */

.chart{
    display:flex;
    align-items:flex-end;
    gap:25px;
    height:320px;
}

.bar{
    width:70px;
    background:#f3dede;
    border-radius:10px 10px 0 0;
    position:relative;
}

.bar span{
    position:absolute;
    top:-35px;
    left:10px;
    font-weight:bold;
    color:#6b7280;
}

.bar p{
    position:absolute;
    bottom:-40px;
    left:20px;
    font-weight:600;
}

/* ACTIVITY */

.activity{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:18px 0;
    border-bottom:1px solid #e5e7eb;
}

.activity-left{
    display:flex;
    align-items:center;
    gap:15px;
}

.dot{
    width:14px;
    height:14px;
    border-radius:50%;
}

.green-dot{
    background:#16a34a;
}

.red-dot{
    background:#dc2626;
}

.blue-dot{
    background:#2563eb;
}

.activity p{
    font-size:22px;
    color:#1e1e3f;
}

.activity span{
    color:#9ca3af;
    font-size:18px;
}

/* RESPONSIVE */

@media(max-width:1200px){

    .bottom-grid{
        grid-template-columns:1fr;
    }

    .sidebar{
        width:260px;
    }
}

.red-bg{
    background:#fde8e8;
    color:#d94b32;
}
@media(max-width:768px){

    body{
        flex-direction:column;
    }

    .sidebar{
        width:100%;
    }

    .topbar{
        flex-direction:column;
        gap:20px;
    }

    .page-title h2{
        font-size:40px;
    }
}

</style>
</head>

<body>

<!-- SIDEBAR -->

<div class="sidebar">

    <div class="logo">

        <div class="logo-icon"></div>

        <div>
            <h2>BloodConnect</h2>
            <p>Save Lives Together</p>
        </div>

    </div>

    <div class="section-title">OVERVIEW</div>

    <div class="menu-item active">
        <i class="fa-solid fa-chart-column"></i>
        Dashboard
    </div>

   <div class="section-title">MANAGEMENT</div>

<div class="menu-item"
     onclick="openManageUsers()">

    <i class="fa-solid fa-users"></i>
    Manage Users

</div>

<div class="menu-item"
     onclick="openManageDonors()">

    <i class="fa-regular fa-heart"></i>
    Manage Donors

</div>

<div class="menu-item"
     onclick="openBloodRequest()">

    <i class="fa-regular fa-heart"></i>
    Blood Requests

</div>
    <div class="menu-item">
        <i class="fa-regular fa-bell"></i>
        Notifications
        <div class="notification">2</div>
    </div>

    <div class="section-title">SUPPORT</div>

    <div class="menu-item">
        <i class="fa-regular fa-envelope"></i>
        Contact Us
    </div>

    <div class="profile-box">

        <div class="avatar">RS</div>

        <div>
            <h3> </h3>
            <p>Administrator</p>
        </div>

    </div>

    <div class="signout" onclick="logout()">
        <i class="fa-solid fa-arrow-right-from-bracket"></i>
        Sign Out
    </div>

</div>

<!-- MAIN -->

<div class="main">

    <div class="topbar">

        <h1>Admin Dashboard</h1>

        <div class="top-icons">

            <div class="icon-box">
                <i class="fa-regular fa-bell"></i>
                <div class="badge">2</div>
            </div>

            <div class="top-avatar">RS</div>

        </div>

    </div>

    <div class="page-title">
        <h2>Admin Dashboard</h2>
        <p>System overview and analytics</p>
    </div>

    <!-- CARDS -->

    <div class="card-grid">

        <div class="card red-card">

            <div class="card-icon red-bg">
                <i class="fa-solid fa-users"></i>
            </div>

            <h1>12,480</h1>

            <p>Total Users</p>

            <span class="green-text">+8.2% this month</span>

        </div>

        <div class="card green-card">

            <div class="card-icon green-bg">
                <i class="fa-regular fa-heart"></i>
            </div>

            <h1>8,320</h1>

            <p>Active Donors</p>

            <span class="green-text">+12.5% this month</span>

        </div>

        <div class="card blue-card">

            <div class="card-icon blue-bg">
                <i class="fa-solid fa-triangle-exclamation"></i>
            </div>

            <h1>247</h1>

            <p>Blood Requests</p>

            <span class="red-text">23 pending</span>

        </div>

        <div class="card yellow-card">

            <div class="card-icon yellow-bg">
                <i class="fa-solid fa-droplet"></i>
            </div>

            <h1>45,200</h1>

            <p>Total Donations</p>

            <span class="green-text">+5.1% this month</span>

        </div>

    </div>

    <!-- BOTTOM -->

    <div class="bottom-grid">

        <!-- CHART -->

        <div class="bottom-card">

            <h2>Donors by Blood Group</h2>

            <div class="chart">

                <div class="bar" style="height:180px;">
                    <span>3.2K</span>
                    <p>A+</p>
                </div>

                <div class="bar" style="height:150px;">
                    <span>2.8K</span>
                    <p>O+</p>
                </div>

                <div class="bar" style="height:110px;">
                    <span>2.1K</span>
                    <p>B+</p>
                </div>

                <div class="bar" style="height:70px;">
                    <span>0.9K</span>
                    <p>AB+</p>
                </div>

                <div class="bar" style="height:60px;">
                    <span>0.8K</span>
                    <p>O-</p>
                </div>

            </div>

        </div>

        <!-- ACTIVITY -->

        <div class="bottom-card">

            <h2>Recent Activity</h2>

            <div class="activity">

                <div class="activity-left">
                    <div class="dot green-dot"></div>
                    <p>New donor registered: Suresh K (B+)</p>
                </div>

                <span>5 min ago</span>

            </div>

            <div class="activity">

                <div class="activity-left">
                    <div class="dot red-dot"></div>
                    <p>Emergency request: O- needed at NIMS</p>
                </div>

                <span>12 min ago</span>

            </div>

            <div class="activity">

                <div class="activity-left">
                    <div class="dot blue-dot"></div>
                    <p>Request #247 marked completed</p>
                </div>

                <span>1 hour ago</span>

            </div>

        </div>

    </div>

</div>

<script>

function openManageUsers(){

    window.location.href = "manageUsers";
}

function openManageDonors(){

    window.location.href = "manageDonors";
}

function openBloodRequest(){

    window.location.href = "bloodRequests";
}

function logout(){

    alert("Admin logged out successfully!");

    window.location.href = "adminlogin.jsp";
}

</script>

</body>
</html>