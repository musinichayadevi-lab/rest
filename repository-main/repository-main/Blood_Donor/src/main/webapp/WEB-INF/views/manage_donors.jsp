<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
<%@ page import="com.example.project1.Entity.ManageDonor" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Donors - BloodConnect</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

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

.app{
    display:flex;
    min-height:100vh;
}

/* SIDEBAR */

.sidebar{
    width:260px;
    background:#141b34;
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
    color:#ff5b5b;
}

.menu{
    padding:20px;
}

.menu-title{
    font-size:12px;
    color:#999;
    margin:20px 0 10px;
    text-transform:uppercase;
}

.menu a{
    display:flex;
    align-items:center;
    gap:12px;
    text-decoration:none;
    color:white;
    padding:12px 15px;
    border-radius:10px;
    margin-bottom:10px;
    transition:0.3s;
}

.menu a:hover,
.menu .active{
    background:#ff5b5b;
}

.profile{
    padding:20px;
    border-top:1px solid rgba(255,255,255,0.1);
}

.profile-box{
    background:#1d2645;
    padding:15px;
    border-radius:12px;
}

.profile-name{
    font-weight:bold;
    margin-bottom:5px;
}

.logout{
    margin-top:15px;
    color:#ff5b5b;
    cursor:pointer;
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
}

.card{
    background:white;
    border-radius:16px;
    padding:25px;
    box-shadow:0 2px 10px rgba(0,0,0,0.05);
}

.card-header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:20px;
}

.search-box{
    width:300px;
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

table thead{
    background:#f7f7f7;
}

table th{
    text-align:left;
    padding:15px;
    color:#555;
    font-size:14px;
}

table td{
    padding:15px;
    border-bottom:1px solid #eee;
    font-size:14px;
}

.user-info{
    display:flex;
    align-items:center;
    gap:12px;
}

.avatar{
    width:42px;
    height:42px;
    border-radius:50%;
    background:#ff5b5b;
    color:white;
    display:flex;
    justify-content:center;
    align-items:center;
    font-weight:bold;
}

.email{
    color:#888;
    font-size:12px;
}

.status{
    font-weight:bold;
}

.active-status{
    color:green;
}

.inactive-status{
    color:red;
}

.btn{
    border:none;
    padding:8px 14px;
    border-radius:8px;
    cursor:pointer;
    font-size:13px;
    color:white;
}

.approve-btn{
    background:green;
}

.reject-btn{
    background:#ff5b5b;
}

.view-btn{
    background:#3b82f6;
}

.action-buttons{
    display:flex;
    gap:10px;
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
.red-bg{
    background:#fde8e8;
    color:#d94b32;
}

</style>

</head>
<body>
<script>

document.addEventListener("DOMContentLoaded", function () {

    // SEARCH DONORS
    const searchInput =
        document.querySelector(".search-box input");

    searchInput.addEventListener("keyup", function () {

        let value =
            this.value.toLowerCase();

        let rows =
            document.querySelectorAll("tbody tr");

        rows.forEach(row => {

            let rowText =
                row.innerText.toLowerCase();

            if(rowText.includes(value)){

                row.style.display = "";

            }else{

                row.style.display = "none";

            }

        });

    });
    // BLOCK / UNBLOCK BUTTON
    document.querySelectorAll(".reject-btn, .approve-btn")
    .forEach(button => {

        button.addEventListener("click", function () {

            let row =
                this.closest("tr");

            let statusCell =
                row.querySelector(".status");

            // BLOCK USER

            if(this.classList.contains("reject-btn")){

                statusCell.innerHTML = "Blocked";

                statusCell.classList.remove("active-status");

                statusCell.classList.add("inactive-status");

                this.innerHTML = "Unblock";

                this.classList.remove("reject-btn");

                this.classList.add("approve-btn");

                this.style.background = "green";

            }
            // UNBLOCK USER
            else{

                statusCell.innerHTML = "Active";

                statusCell.classList.remove("inactive-status");

                statusCell.classList.add("active-status");

                this.innerHTML = "Block";

                this.classList.remove("approve-btn");

                this.classList.add("reject-btn");

                this.style.background = "#ff5b5b";

            }

        });

    });
    // VIEW BUTTON
    document.querySelectorAll(".view-btn")
    .forEach(button => {

        button.addEventListener("click", function () {

            let row =
                this.closest("tr");

            let donorName =
                row.querySelector(".user-info div div")
                .innerText;

            alert("Viewing donor: " + donorName);

        });

    });

});

</script>
<div class="app">

    <!-- SIDEBAR -->

    <div class="sidebar">

        <div>

            <div class="logo">
                <h2>❤️ BloodConnect</h2>
                <p style="font-size:13px;color:#bbb;">Save Lives Together</p>
            </div>

            <div class="menu">

                <div class="menu-title">Overview</div>
 <a href="${pageContext.request.contextPath}/adminDashboard">
    <i class="fa-solid fa-chart-line"></i>
    Dashboard
</a>
                <div class="menu-title">Management</div>

                <a href="#">
                    <i class="fa-solid fa-users"></i>
                    Manage Users
                </a>

                <a href="#" class="active">
                    <i class="fa-solid fa-heart-circle-plus"></i>
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

            </div>

        </div>

        <div class="profile">

            <div class="profile-box">
                <div class="profile-name">Rahul</div>
                <div style="font-size:13px;color:#bbb;">Administrator</div>

                <div class="logout">
                    <i class="fa-solid fa-right-from-bracket"></i>
                    Sign Out
                </div>
            </div>

        </div>

    </div>

    <!-- MAIN CONTENT -->

    <div class="main">

        <div class="topbar">
            <h1>Manage Donors</h1>

            <div>
                <i class="fa-regular fa-bell" style="font-size:22px;"></i>
            </div>
        </div>

        <div class="card">

            <div class="card-header">

                <div>
                    <h2>Manage Donors</h2>
                    <p style="color:#777;font-size:14px;margin-top:5px;">
                        View and manage blood donors
                    </p>
                </div>

                <div class="search-box">
                    <input type="text" placeholder="Search donors...">
                </div>

            </div>

            <!-- TABLE -->

            <table>

                <thead>
                    <tr>
                        <th>DONOR</th>
                        <th>BLOOD GROUP</th>
                        <th>CITY</th>
                        <th>DONATIONS</th>
                        <th>LAST DONATION</th>
                        <th>STATUS</th>
                        <th>ACTIONS</th>
                    </tr>
                </thead>
<tbody>

<%

List<ManageDonor> donors =
(List<ManageDonor>) request.getAttribute("donors");

if(donors != null && !donors.isEmpty()){

    for(ManageDonor d : donors){

        String initials = "";

        if(d.getFullName() != null){

            String[] parts =
                    d.getFullName().split(" ");

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

<div class="avatar">
<%= initials %>
</div>

<div>

<div>
<%= d.getFullName() %>
</div>

<div class="email">
<%= d.getEmail() %>
</div>

</div>

</div>

</td>

<td>
<%= d.getBloodGroup() %>
</td>

<td>
<%= d.getCity() %>
</td>



<td>
<%= d.getLastDonationDate() %>
</td>

<td class="status
<%= "Blocked".equalsIgnoreCase(d.getStatus())
? "inactive-status"
: "active-status" %>">

<%= d.getStatus() %>

</td>

<td>

<div class="action-buttons">

<button class="btn view-btn">
View
</button>

<%
if("Blocked".equalsIgnoreCase(d.getStatus())){
%>

<button class="btn approve-btn">
Unblock
</button>

<%
}else{
%>

<button class="btn reject-btn">
Block
</button>

<%
}
%>

</div>

</td>

</tr>

<%
    }

}else{
%>

<tr>

<td colspan="7"
style="text-align:center;">

No Donors Found

</td>

</tr>

<%
}
%>

</tbody>
                
            </table>

        </div>

    </div>

</div>

</body>
</html>