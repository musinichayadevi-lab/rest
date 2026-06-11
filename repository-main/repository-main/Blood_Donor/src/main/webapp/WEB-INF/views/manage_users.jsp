<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
<%@ page import="com.example.project1.Entity.ManageUser" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>BloodConnect - Manage Users</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, Helvetica, sans-serif;
}

body{
    background:#f5f6fa;
}

.container{
    display:flex;
    min-height:100vh;
}
.red-bg{
    background:#fde8e8;
    color:#d94b32;
}


/* SIDEBAR */

.sidebar{
    width:260px;
    background:#111827;
    color:white;
    display:flex;
    flex-direction:column;
    justify-content:space-between;
    padding:20px 0;
}

.logo{
    padding:0 20px 20px;
    border-bottom:1px solid rgba(255,255,255,0.1);
}

.logo h2{
    color:#ff5a5f;
    font-size:24px;
}

.logo p{
    font-size:12px;
    color:#bbb;
    margin-top:4px;
}

.menu{
    padding:20px;
}

.menu-title{
    color:#888;
    font-size:12px;
    margin:20px 0 10px;
    text-transform:uppercase;
}

.menu a{
    display:flex;
    align-items:center;
    gap:12px;
    text-decoration:none;
    color:#ddd;
    padding:12px 15px;
    border-radius:10px;
    margin-bottom:8px;
    transition:0.3s;
    font-size:15px;
}

.menu a:hover,
.menu a.active{
    background:#ef4444;
    color:white;
}

.sidebar-bottom{
    padding:20px;
    border-top:1px solid rgba(255,255,255,0.1);
}

.admin-box{
    display:flex;
    align-items:center;
    gap:12px;
    margin-bottom:20px;
}

.admin-avatar{
    width:45px;
    height:45px;
    border-radius:50%;
    background:#ef4444;
    display:flex;
    align-items:center;
    justify-content:center;
    font-weight:bold;
}

.signout{
    text-decoration:none;
    color:#ff6b6b;
    font-weight:bold;
}

/* MAIN */

.main{
    flex:1;
    padding:30px;
}

.topbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:30px;
}

.topbar h1{
    font-size:28px;
    color:#222;
}

.top-icons{
    display:flex;
    align-items:center;
    gap:20px;
}

.notification{
    position:relative;
}

.notification span{
    position:absolute;
    top:-8px;
    right:-8px;
    background:red;
    color:white;
    width:18px;
    height:18px;
    border-radius:50%;
    font-size:11px;
    display:flex;
    align-items:center;
    justify-content:center;
}

.profile{
    width:40px;
    height:40px;
    border-radius:50%;
    background:#ef4444;
    color:white;
    display:flex;
    align-items:center;
    justify-content:center;
    font-weight:bold;
}

.card{
    background:white;
    border-radius:15px;
    padding:25px;
    box-shadow:0 2px 10px rgba(0,0,0,0.05);
}

.card-header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:20px;
}

.card-header h2{
    color:#222;
}

.stats{
    display:flex;
    gap:20px;
    font-size:14px;
}

.active-count{
    color:green;
    font-weight:bold;
}

.blocked-count{
    color:red;
    font-weight:bold;
}

.search-box{
    margin-bottom:20px;
}

.search-box input{
    width:100%;
    padding:12px;
    border:1px solid #ddd;
    border-radius:10px;
    outline:none;
}

/* TABLE */

table{
    width:100%;
    border-collapse:collapse;
}

th{
    text-align:left;
    padding:14px 10px;
    color:#777;
    font-size:13px;
    border-bottom:1px solid #eee;
}

td{
    padding:16px 10px;
    border-bottom:1px solid #eee;
    font-size:14px;
}

.user-info{
    display:flex;
    align-items:center;
    gap:12px;
}

.user-avatar{
    width:42px;
    height:42px;
    border-radius:50%;
    background:#ef4444;
    color:white;
    display:flex;
    align-items:center;
    justify-content:center;
    font-weight:bold;
}

.user-details h4{
    font-size:14px;
    color:#222;
}

.user-details p{
    font-size:12px;
    color:#888;
}

.status-active{
    color:green;
    font-weight:bold;
}

.status-blocked{
    color:red;
    font-weight:bold;
}

.btn{
    border:none;
    padding:8px 14px;
    border-radius:8px;
    cursor:pointer;
    font-weight:bold;
    color:white;
}

.btn-block{
    background:#ef4444;
}

.btn-unblock{
    background:#22c55e;
}

.delete-icon{
    color:#999;
    margin-left:15px;
    cursor:pointer;
}

@media(max-width:900px){
    .sidebar{
        display:none;
    }

    .main{
        padding:15px;
    }

    table{
        display:block;
        overflow-x:auto;
    }
}
</style>
</head>

<body>
<script>


document.addEventListener("DOMContentLoaded", function () {
    // SEARCH USERS
    const searchInput =
        document.querySelector(".search-box input");

    searchInput.addEventListener("keyup", function () {

        let searchValue =
            this.value.toLowerCase().trim();

        let tableRows =
            document.querySelectorAll("tbody tr");

        tableRows.forEach(row => {

            let rowText =
                row.innerText.toLowerCase();

            if(rowText.includes(searchValue)){

                row.style.display = "";

            }else{

                row.style.display = "none";

            }

        });

    });

    // BLOCK / UNBLOCK USERS
    document.querySelectorAll(".btn").forEach(button => {

        button.addEventListener("click", function () {

            let row =
                this.closest("tr");

            let status =
                row.querySelector("td:nth-child(4) span");

            // BLOCK USER

            if(this.classList.contains("btn-block")){

                status.innerHTML = "Blocked";

                status.classList.remove("status-active");

                status.classList.add("status-blocked");

                this.innerHTML = "Unblock";

                this.classList.remove("btn-block");

                this.classList.add("btn-unblock");

                this.style.background = "#22c55e";

            }

            // UNBLOCK USER

            else{

                status.innerHTML = "Active";

                status.classList.remove("status-blocked");

                status.classList.add("status-active");

                this.innerHTML = "Block";

                this.classList.remove("btn-unblock");

                this.classList.add("btn-block");

                this.style.background = "#ef4444";

            }

        });

    });

    // DELETE USER
    document.querySelectorAll(".delete-icon").forEach(icon => {

        icon.addEventListener("click", function () {

            let confirmDelete =
                confirm("Are you sure you want to delete this user?");

            if(confirmDelete){

                let row =
                    this.closest("tr");

                row.remove();

            }

        });

    });

});

</script>
<div class="container">

    <!-- SIDEBAR -->

    <aside class="sidebar">

        <div>

            <div class="logo">
                <h2>❤️ BloodConnect</h2>
                <p>Save Lives Together</p>
            </div>

            <div class="menu">

                <div class="menu-title">Overview</div>

                <a href="${pageContext.request.contextPath}/adminDashboard">
    <i class="fa-solid fa-chart-line"></i>
    Dashboard  </a>
   <div class="menu-title">Management</div>

                <a href="#" class="active">
                    <i class="fa-solid fa-users"></i>
                    Manage Users
                </a>

                <a href="#">
                    <i class="fa-solid fa-heart"></i>
                    Manage Donors
                </a>

                <a href="#">
                    <i class="fa-solid fa-droplet"></i>
                    Blood Requests
                </a>

                <a href="#">
                    <i class="fa-solid fa-bell"></i>
                    Notifications
                </a>

                <div class="menu-title">Support</div>

                <a href="#">
                    <i class="fa-solid fa-envelope"></i>
                    Contact Us
                </a>

            </div>

        </div>

        <div class="sidebar-bottom">

            <div class="admin-box">
                <div class="admin-avatar">RS</div>

                <div>
                    <h4>Rahul</h4>
                    <p style="font-size:12px;color:#aaa;">Administrator</p>
                </div>
            </div>

            <a href="#" class="signout">
                <i class="fa-solid fa-right-from-bracket"></i>
                Sign Out
            </a>

        </div>

    </aside>

    <!-- MAIN -->

    <main class="main">

        <div class="topbar">

            <h1>Manage Users</h1>

            <div class="top-icons">

                <div class="notification">
                    <i class="fa-regular fa-bell fa-lg"></i>
                    <span>2</span>
                </div>

                <div class="profile">RS</div>

            </div>

        </div>

        <div class="card">

            <div class="card-header">

                <div>
                    <h2>Manage Users</h2>
                    <p style="color:#777;margin-top:5px;">
                        View, block, and manage registered users
                    </p>
                </div>

<%
int activeCount = 0;
int blockedCount = 0;

List<ManageUser> usersList =
(List<ManageUser>) request.getAttribute("users");

if(usersList != null){

    for(ManageUser u : usersList){

        if("Blocked".equalsIgnoreCase(u.getStatus())){
            blockedCount++;
        }
        else{
            activeCount++;
        }
    }
}
%>

<div class="stats">

    <span class="active-count">
        <%= activeCount %> Active
    </span>

    <span class="blocked-count">
        <%= blockedCount %> Blocked
    </span>

</div>
            </div>

            <div class="search-box">
                <input type="text" placeholder="Search users...">
            </div>

            <table>

                <thead>
                    <tr>
                        <th>USER</th>
                        <th>BLOOD GROUP</th>
                        <th>CITY</th>
                        <th>STATUS</th>
                        <th>ACTIONS</th>
                    </tr>
                </thead>

               <tbody>

<%
List<ManageUser> users =
(List<ManageUser>) request.getAttribute("users");

if(users != null && !users.isEmpty()){

    for(ManageUser u : users){

        String initials = "";

        if(u.getFullName() != null){

            String[] parts = u.getFullName().split(" ");

            initials += parts[0]
                    .substring(0,1)
                    .toUpperCase();

            if(parts.length > 1){

                initials += parts[1]
                        .substring(0,1)
                        .toUpperCase();
            }
        }
%>

<tr>

<td>

<div class="user-info">

<div class="user-avatar">
<%= initials %>
</div>

<div class="user-details">

<h4>
<%= u.getFullName() %>
</h4>

<p>
<%= u.getEmail() %>
</p>

</div>

</div>

</td>

<td>
<%= u.getBloodGroup() %>
</td>

<td>
<%= u.getCity() %>
</td>



<td>

<%
if("Blocked".equalsIgnoreCase(u.getStatus())){
%>

<span class="status-blocked">
Blocked
</span>

<%
}else{
%>

<span class="status-active">
Active
</span>

<%
}
%>

</td>

<td>

<%
if("Blocked".equalsIgnoreCase(u.getStatus())){
%>

<button class="btn btn-unblock">
Unblock
</button>

<%
}else{
%>

<button class="btn btn-block">
Block
</button>

<%
}
%>

<i class="fa-regular fa-trash-can delete-icon"></i>

</td>

</tr>

<%
    }
}else{
%>

<tr>
<td colspan="7" style="text-align:center;">
No Users Found
</td>
</tr>

<%
}
%>

</tbody>

            </table>

        </div>

    </main>

</div>

</body>
</html>