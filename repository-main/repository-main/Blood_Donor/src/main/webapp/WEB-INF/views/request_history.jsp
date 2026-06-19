<%@ page import="java.util.List" %>
<%@ page import="com.example.project1.Entity.BloodRequest" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Blood Request History</title>

<link rel="stylesheet" href="request-history.css">

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
    background:#f4f5f7;
}

.container{
    display:flex;
    min-height:100vh;
}

/* Sidebar */

.sidebar{
    width:230px;
    background:#13152f;
    color:white;
    display:flex;
    flex-direction:column;
    justify-content:space-between;
}

.logo{
    display:flex;
    align-items:center;
    gap:12px;
    padding:24px 18px;
    border-bottom:1px solid rgba(255,255,255,.08);
}

.logo-icon{
    width:42px;
    height:42px;
    border-radius:12px;
    background:#d74a36;
    display:flex;
    justify-content:center;
    align-items:center;
}

.logo span{
    color:#b8bbcb;
    font-size:12px;
}

.menu{
    padding:15px 10px;
}

.menu h5{
    color:#7d8096;
    font-size:11px;
    margin:18px 10px;
}

.menu a{
    display:flex;
    align-items:center;
    gap:12px;
    text-decoration:none;
    color:#e9e9ef;
    padding:12px 14px;
    border-radius:10px;
    margin-bottom:5px;
}

.menu a:hover{
    background:#21234a;
}

.active{
    background:#d74a36;
}

.badge{
    margin-left:auto;
    width:18px;
    height:18px;
    border-radius:50%;
    background:#d74a36;
    display:flex;
    justify-content:center;
    align-items:center;
    font-size:11px;
}

.sidebar-footer{
    padding:15px;
    border-top:1px solid rgba(255,255,255,.08);
}

.user-card{
    background:#212340;
    border-radius:10px;
    padding:12px;
    display:flex;
    gap:12px;
    align-items:center;
}

.avatar{
    width:38px;
    height:38px;
    border-radius:50%;
    background:#d74a36;
    display:flex;
    align-items:center;
    justify-content:center;
    font-weight:600;
}

.user-card p{
    color:#b8bbcb;
    font-size:13px;
}

.logout{
    display:flex;
    gap:10px;
    color:#ff8c7c;
    text-decoration:none;
    margin-top:20px;
}

/* Main */

.main-content{
    flex:1;
}

.topbar{
    height:60px;
    background:white;
    border-bottom:1px solid #e5e7eb;
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:0 28px;
}

.top-right{
    display:flex;
    gap:15px;
    align-items:center;
}

.notification{
    width:38px;
    height:38px;
    border-radius:12px;
    background:#f2f3f5;
    position:relative;
    display:flex;
    justify-content:center;
    align-items:center;
}

.notification span{
    position:absolute;
    top:-4px;
    right:-4px;
    width:18px;
    height:18px;
    background:#d74a36;
    color:white;
    border-radius:50%;
    font-size:11px;
    display:flex;
    align-items:center;
    justify-content:center;
}

.profile{
    width:38px;
    height:38px;
    border-radius:50%;
    background:#d74a36;
    color:white;
    display:flex;
    align-items:center;
    justify-content:center;
    font-weight:600;
}

/* Header */

.page-header{
    padding:30px 28px;
}

.page-header h1{
    margin-bottom:8px;
    color:#222738;
}

.page-header p{
    color:#6b7280;
}

/* Card */

.table-card{
    background:white;
    margin:0 28px;
    border-radius:16px;
    border:1px solid #e5e7eb;
    padding:20px;
}

.table-header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:15px;
}

.filters{
    display:flex;
    gap:8px;
}

.filters button{
    border:1px solid #e5e7eb;
    background:white;
    padding:10px 16px;
    border-radius:8px;
    cursor:pointer;
}

.active-btn{
    background:#d74a36 !important;
    color:white;
    border:none !important;
}

.export-btn{
    border:1px solid #e5e7eb;
    background:white;
    padding:10px 16px;
    border-radius:8px;
    cursor:pointer;
}

/* Table */

table{
    width:100%;
    border-collapse:collapse;
}

thead{
    background:#f8f9fb;
}

th{
    text-align:left;
    padding:16px 14px;
    font-size:12px;
    color:#6b7280;
}

td{
    padding:18px 14px;
    border-top:1px solid #edf0f2;
}

.blood{
    background:#fceaea;
    color:#d74a36;
    padding:8px 10px;
    border-radius:8px;
    font-weight:600;
}

.high,
.medium,
.critical,
.low,
.pending,
.accepted,
.completed{
    padding:6px 10px;
    border-radius:20px;
    font-size:12px;
    font-weight:600;
}

.high{
    background:#fff4df;
    color:#f59e0b;
}

.medium{
    background:#eaf4ff;
    color:#1d84d8;
}

.critical{
    background:#fde8e8;
    color:#dc2626;
}

.low{
    background:#e7f7ef;
    color:#16a34a;
}

.pending{
    background:#fff7e0;
    color:#f59e0b;
}

.accepted{
    background:#eaf4ff;
    color:#1d84d8;
}

.completed{
    background:#e7f7ef;
    color:#16a34a;
}

.actions{
    display:flex;
    gap:18px;
    cursor:pointer;
}

.delete{
    color:#d74a36;
}
</style>
</head>
<body>

<div class="container">

    <!-- Sidebar -->
    <aside class="sidebar">

        <div>

            <div class="logo">
                <div class="logo-icon">
                    <i class="fa-solid fa-heart"></i>
                </div>

                <div>
                    <h3>BloodConnect</h3>
                    <span>Save Lives Together</span>
                </div>
            </div>

            <nav class="menu">

                <h5>MAIN</h5>

              <h5>MAIN</h5>

<a onclick="window.location.href='userdashboard'" style="cursor:pointer;">
    <i class="fa-regular fa-house"></i> Dashboard
</a>

<a onclick="window.location.href='findDonors'" style="cursor:pointer;">
    <i class="fa-solid fa-magnifying-glass"></i> Find Donors
</a>

<a onclick="window.location.href='emergency_request'" style="cursor:pointer;">
    <i class="fa-solid fa-triangle-exclamation"></i> Emergency Request
</a>

<h5>MY ACCOUNT</h5>

<a onclick="window.location.href='requestHistory'" class="active" style="cursor:pointer;">
    <i class="fa-solid fa-list"></i>
    Request History
</a>

<a onclick="window.location.href='notifications'" style="cursor:pointer;">
    <i class="fa-regular fa-bell"></i>
    Notifications
    <span class="badge">2</span>
</a>

<a onclick="window.location.href='profile'" style="cursor:pointer;">
    <i class="fa-regular fa-user"></i>
    My Profile
</a>

<h5>SUPPORT</h5>

<a onclick="window.location.href='contactUs'" style="cursor:pointer;">
    <i class="fa-regular fa-envelope"></i>
    Contact Us
</a>

            </nav>

        </div>

        <!-- Footer -->
        <div class="sidebar-footer">

            <div class="user-card">
                <div class="avatar">RS</div>

                <div>
                    <h4>Rahul</h4>
                    <p>O+ Donor</p>
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

    <!-- Main Content -->
    <main class="main-content">

        <!-- Topbar -->
        <div class="topbar">

            <h2>Request History</h2>

            <div class="top-right">

                <div class="notification">
                    <i class="fa-regular fa-bell"></i>
                    <span>2</span>
                </div>

                <div class="profile">RS</div>

            </div>

        </div>

        <!-- Page Header -->
        <div class="page-header">
            <h1>Blood Request History</h1>
            <p>Track all your blood requests and their status</p>
        </div>

        <!-- Table Card -->
        <div class="table-card">

            <div class="table-header">

                <div class="filters">
                   <button class="active-btn"
        onclick="window.location.href='requestHistory'">
    All
</button>

<button onclick="window.location.href='requestHistory?status=Pending'">
    Pending
</button>

<button onclick="window.location.href='requestHistory?status=Accepted'">
    Accepted
</button>

<button onclick="window.location.href='requestHistory?status=Completed'">
    Completed
</button>
                </div>

                <button class="export-btn">
                    <i class="fa-solid fa-download"></i>
                    Export
                </button>

            </div>

            <tbody>

<%
List<BloodRequest> requests =
(List<BloodRequest>)request.getAttribute(
        "bloodRequests");

if(requests != null){

for(BloodRequest br : requests){
%>

<tr>

    <td>
        <%= br.getPatientName() %>
    </td>

    <td>
        <span class="blood">
            <%= br.getBloodGroup() %>
        </span>
    </td>

    <td>
        <%= br.getHospital() %>
    </td>

    <td>
        <%= br.getCity() %>
    </td>

    <td>
        Emergency
    </td>

    <td>
        1
    </td>

    

    <td>
        <span class="pending">
            Active
        </span>
    </td>

    <td class="actions">

        <i class="fa-regular fa-pen-to-square"
           onclick="window.location.href='editRequest?id=<%= br.getId() %>'"
           style="cursor:pointer;">
        </i>

        <i class="fa-regular fa-trash-can delete"
           onclick="if(confirm('Delete this request?'))
           window.location.href='deleteRequest?id=<%= br.getId() %>'"
           style="cursor:pointer;">
        </i>

    </td>

</tr>

<%
}
}
%>

</tbody>

        </div>

    </main>

</div>

</body>
</html>