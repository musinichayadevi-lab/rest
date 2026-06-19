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

<h2>Manage User</h2>

<!-- ================= ADD / UPDATE FORM ================= -->
<h3>Add / Update User</h3>

<form action="saveUser" method="post">

    <input type="hidden" name="id" value="${user.id}" />

    Full Name: <br>
    <input type="text" name="fullName" value="${user.fullName}" required />
    <br><br>

    Email: <br>
    <input type="email" name="email" value="${user.email}" required />
    <br><br>

    Blood Group: <br>
    <input type="text" name="bloodGroup" value="${user.bloodGroup}" />
    <br><br>

    City: <br>
    <input type="text" name="city" value="${user.city}" />
    <br><br>

    Status: <br>
    <input type="text" name="status" value="${user.status}" />
    <br><br>

    <button type="submit">Save User</button>

</form>

<hr>

<!-- ================= USER LIST ================= -->
<h3>User List</h3>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Full Name</th>
        <th>Email</th>
        <th>Blood Group</th>
        <th>City</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

    <%
        List<ManageUser> userList = (List<ManageUser>) request.getAttribute("userList");

        if (userList != null) {
            for (ManageUser u : userList) {
    %>

    <tr>
        <td><%= u.getId() %></td>
        <td><%= u.getFullName() %></td>
        <td><%= u.getEmail() %></td>
        <td><%= u.getBloodGroup() %></td>
        <td><%= u.getCity() %></td>
        <td><%= u.getStatus() %></td>
        <td>
            <a href="editUser?id=<%= u.getId() %>">Edit</a>
            |
            <a href="deleteUser?id=<%= u.getId() %>">Delete</a>
        </td>
    </tr>

    <%
            }
        }
    %>

</table>

</body>
</html>