<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String name = (String)session.getAttribute("name");
String bloodGroup = (String)session.getAttribute("bloodGroup");

if(name == null){
    name = "User";
}

if(bloodGroup == null){
    bloodGroup = "N/A";
}

String initials = "";

String[] words = name.split(" ");

for(String w : words){
    if(w.length() > 0){
        initials += Character.toUpperCase(w.charAt(0));
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<link rel="stylesheet" href="style.css">

        <style>
        *{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    background:#f4f5f7;
}

.container{
    display:flex;
    min-height:100vh;
}

/* Sidebar */

.sidebar{
    width:230px;
    background:#12142d;
    color:#fff;
    display:flex;
    flex-direction:column;
    justify-content:space-between;
    padding:20px 15px;
}

.logo{
    display:flex;
    gap:12px;
    align-items:center;
}

.logo-icon{
    width:40px;
    height:40px;
    border-radius:12px;
    background:#e04d37;
    display:flex;
    align-items:center;
    justify-content:center;
}

.logo h3{
    font-size:20px;
}

.logo span{
    font-size:12px;
    color:#b8b8c7;
}

.menu-section{
    margin-top:30px;
}

.menu-section p{
    color:#7d8099;
    font-size:12px;
    margin-bottom:12px;
}

.menu-section a{
    display:flex;
    align-items:center;
    gap:12px;
    color:#d8d8e4;
    text-decoration:none;
    padding:12px;
    border-radius:10px;
    margin-bottom:6px;
}

.menu-section a:hover{
    background:#1f2140;
}

.active{
    background:#d84a35;
    color:#fff !important;
}

.badge{
    margin-left:auto;
    background:#d84a35;
    color:#fff;
    font-size:12px;
    padding:2px 7px;
    border-radius:20px;
}

.sidebar-footer{
    margin-top:30px;
}

.user-card{
    display:flex;
    align-items:center;
    gap:12px;
    background:#1b1d38;
    padding:12px;
    border-radius:12px;
}

.avatar-small{
    width:36px;
    height:36px;
    background:#d84a35;
    border-radius:50%;
    display:flex;
    align-items:center;
    justify-content:center;
    font-weight:bold;
}

.user-card span{
    color:#b7b7c8;
    font-size:13px;
}

.logout{
    display:block;
    color:#ff7f72;
    text-decoration:none;
    margin-top:20px;
}

/* Main */

.main-content{
    flex:1;
    padding:25px;
}

.topbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:25px;
}

.top-icons{
    display:flex;
    align-items:center;
    gap:20px;
}

.bell{
    position:relative;
}

.bell span{
    position:absolute;
    top:-8px;
    right:-8px;
    background:#d84a35;
    color:#fff;
    font-size:11px;
    width:18px;
    height:18px;
    border-radius:50%;
    display:flex;
    align-items:center;
    justify-content:center;
}

.profile-circle{
    width:38px;
    height:38px;
    background:#d84a35;
    color:#fff;
    border-radius:50%;
    display:flex;
    align-items:center;
    justify-content:center;
    font-weight:600;
}

/* Profile Header */

.profile-header{
    background:#11142f;
    color:#fff;
    border-radius:24px;
    padding:30px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.profile-left{
    display:flex;
    gap:20px;
    align-items:center;
}

.avatar{
    width:80px;
    height:80px;
    background:#d84a35;
    border-radius:20px;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:36px;
    font-weight:bold;
}

.profile-details h1{
    margin-bottom:5px;
}

.profile-details p{
    color:#bfc2d4;
}

.tags{
    margin-top:12px;
    display:flex;
    gap:10px;
}

.blood,
.eligible{
    padding:10px 16px;
    border-radius:20px;
    font-size:14px;
    font-weight:600;
}

.blood{
    background:#fff;
    color:#d84a35;
}

.eligible{
    background:#fff7df;
    color:#f5a400;
}

.stats{
    display:flex;
    gap:50px;
    margin-top:20px;
}

.stats h3{
    font-size:34px;
}

.stats span{
    color:#bfc2d4;
    font-size:14px;
}

.edit-btn{
    border:1px solid #6d6f84;
    background:transparent;
    color:#fff;
    padding:12px 20px;
    border-radius:10px;
    cursor:pointer;
}

/* Content */

.content-grid{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:20px;
    margin-top:20px;
}

.card{
    background:#fff;
    border-radius:16px;
    padding:20px;
    box-shadow:0 2px 8px rgba(0,0,0,0.05);
}

.card h3{
    margin-bottom:20px;
}

table{
    width:100%;
    border-collapse:collapse;
}

table td{
    padding:16px 0;
    border-bottom:1px solid #eee;
}

table td:first-child{
    color:#777;
}

table td:last-child{
    text-align:right;
    font-weight:500;
}

.achievement{
    display:flex;
    align-items:center;
    gap:15px;
    padding:14px 0;
    border-bottom:1px solid #eee;
}

.icon{
    width:36px;
    height:36px;
    border-radius:10px;
    background:#fff0ed;
    color:#d84a35;
    display:flex;
    align-items:center;
    justify-content:center;
}

.achievement p{
    color:#888;
    font-size:14px;
}

.check{
    margin-left:auto;
    color:#28c76f;
}

.disabled{
    opacity:.45;
}
        </style>
</head>
<body>

<div class="container">

    <!-- SIDEBAR -->
    <aside class="sidebar">

        <div class="logo">

            <div class="logo-icon">
                <i class="fa-solid fa-heart"></i>
            </div>

            <div>
                <h3>BloodConnect</h3>
                <span>Save Lives Together</span>
            </div>

        </div>

        <div class="menu-section">

            <p>MAIN</p>

            <a onclick="window.location.href='userdashboard'"
               style="cursor:pointer;">
                <i class="fa-solid fa-house"></i>
                Dashboard
            </a>

            <a onclick="window.location.href='findDonors'"
               style="cursor:pointer;">
                <i class="fa-solid fa-magnifying-glass"></i>
                Find Donors
            </a>

            <a onclick="window.location.href='emergency_request'"
               style="cursor:pointer;">
                <i class="fa-solid fa-triangle-exclamation"></i>
                Emergency Request
            </a>

        </div>

        <div class="menu-section">

            <p>MY ACCOUNT</p>

            <a onclick="window.location.href='requestHistory'"
               style="cursor:pointer;">
                <i class="fa-solid fa-clock-rotate-left"></i>
                Request History
            </a>

            <a onclick="window.location.href='notifications'"
               style="cursor:pointer;">
                <i class="fa-regular fa-bell"></i>
                Notifications
            </a>

            <a onclick="window.location.href='profile'"
               class="active"
               style="cursor:pointer;">
                <i class="fa-regular fa-user"></i>
                My Profile
            </a>

        </div>

        <div class="menu-section">

            <p>SUPPORT</p>

            <a onclick="window.location.href='contactUs'"
               style="cursor:pointer;">
                <i class="fa-regular fa-envelope"></i>
                Contact Us
            </a>

        </div>

        <div class="sidebar-footer">

            <div class="user-card">

                <div class="avatar-small">
                    <%= initials %>
                </div>

                <div>
                    <h4><%= name %></h4>
                    <span><%= bloodGroup %> Donor</span>
                </div>

            </div>

            <form action="logout" method="post">

                <button type="submit" class="logout">
                    <i class="fa-solid fa-arrow-right-from-bracket"></i>
                    Sign Out
                </button>

            </form>

        </div>

    </aside>

    <!-- MAIN CONTENT -->
    <main class="main-content">

        <div class="topbar">

            <h2>My Profile</h2>

            <div class="top-icons">

                <div class="bell">
                    <i class="fa-regular fa-bell"></i>
                    <span>2</span>
                </div>

                <div class="profile-circle">
                    <%= initials %>
                </div>

            </div>

        </div>

        <!-- PROFILE HEADER -->
        <section class="profile-header">

            <div class="profile-left">

                <div class="avatar">
                    <%= initials %>
                </div>

                <div class="profile-details">

                    <h1><%= name %></h1>

                    <p>
                        <%= session.getAttribute("email") %> ·
                        <%= session.getAttribute("city") %>
                    </p>

                    <div class="tags">
                        <span class="blood">
                            <%= bloodGroup %>
                        </span>
                    </div>

                </div>

            </div>

        </section>

        <!-- PERSONAL INFO -->
        <section class="content-grid">

            <div class="card">

                <h3>Personal Information</h3>

                <table>

                    <tr>
                        <td>Full Name</td>
                        <td><%= name %></td>
                    </tr>

                    <tr>
                        <td>Email</td>
                        <td><%= session.getAttribute("email") %></td>
                    </tr>

                    <tr>
                        <td>Blood Group</td>
                        <td><%= bloodGroup %></td>
                    </tr>

                    <tr>
                        <td>City</td>
                        <td><%= session.getAttribute("city") %></td>
                    </tr>

                    <tr>
                        <td>Phone</td>
                        <td><%= session.getAttribute("phone") %></td>
                    </tr>

                    <tr>
                        <td>Last Donation</td>
                        <td><%= session.getAttribute("lastDonationDate") %></td>
                    </tr>

                </table>

            </div>

            <div class="card">

                <h3>Achievements</h3>

                <p>First Donation ✔</p>
                <p>5x Donor ✔</p>
                <p>Life Saver ✔</p>
                <p>Super Donor (Locked)</p>

            </div>

        </section>

    </main>

</div>

</body>
</html>