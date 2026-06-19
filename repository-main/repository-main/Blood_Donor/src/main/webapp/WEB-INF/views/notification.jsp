<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.project1.Entity.ManageUser" %>

<!DOCTYPE html>
<html>
<head>
    <title>Manage User</title>

<style>
  *{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    background:#f5f6f8;
}

.container{
    display:flex;
    min-height:100vh;
}

/* SIDEBAR */

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
    padding:25px 18px;
    border-bottom:1px solid rgba(255,255,255,.08);
}

.logo-icon{
    width:40px;
    height:40px;
    border-radius:12px;
    background:#e14c38;
    display:flex;
    align-items:center;
    justify-content:center;
}

.logo h3{
    font-size:22px;
}

.logo span{
    font-size:12px;
    color:#b8bbcb;
}

.menu{
    padding:18px 10px;
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
    color:#e8e8ef;
    padding:12px 14px;
    border-radius:10px;
    margin-bottom:4px;
}

.menu a:hover{
    background:#20244d;
}

.active{
    background:#dc4c36;
}

.count{
    margin-left:auto;
    font-size:12px;
    font-weight:600;
}

.bottom-section{
    padding:15px;
    border-top:1px solid rgba(255,255,255,.08);
}

.user-box{
    background:#20233f;
    padding:12px;
    border-radius:10px;
    display:flex;
    gap:12px;
    align-items:center;
}

.avatar{
    width:38px;
    height:38px;
    border-radius:50%;
    background:#dc4c36;
    display:flex;
    align-items:center;
    justify-content:center;
    font-weight:600;
}

.user-box p{
    color:#b8bbcb;
    font-size:13px;
}

.logout{
    display:flex;
    align-items:center;
    gap:10px;
    color:#ff8879;
    text-decoration:none;
    margin-top:18px;
}

/* MAIN */

.main-content{
    flex:1;
}

.topbar{
    height:62px;
    background:white;
    border-bottom:1px solid #e5e7eb;
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:0 25px;
}

.topbar h2{
    font-size:20px;
}

.top-icons{
    display:flex;
    align-items:center;
    gap:15px;
}

.bell-icon{
    position:relative;
    background:#f2f3f5;
    width:38px;
    height:38px;
    border-radius:12px;
    display:flex;
    align-items:center;
    justify-content:center;
}

.bell-icon span{
    position:absolute;
    top:-5px;
    right:-5px;
    width:18px;
    height:18px;
    border-radius:50%;
    background:#dc4c36;
    color:white;
    font-size:11px;
    display:flex;
    align-items:center;
    justify-content:center;
}

.profile-circle{
    width:38px;
    height:38px;
    border-radius:50%;
    background:#dc4c36;
    color:white;
    display:flex;
    align-items:center;
    justify-content:center;
    font-weight:600;
}

/* HEADER */

.page-header{
    padding:30px 25px 20px;
}

.page-header h1{
    font-size:42px;
    color:#232738;
}

.page-header p{
    margin-top:8px;
    color:#6b7280;
}

/* CARD */

.notification-card{
    background:white;
    margin:0 25px 25px;
    border-radius:16px;
    border:1px solid #e5e7eb;
    padding:20px;
}

.card-header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:15px;
}

.card-header h3{
    color:#232738;
}

.card-header button{
    border:none;
    background:none;
    color:#6b7280;
    cursor:pointer;
}

/* ITEM */

.notification-item{
    display:flex;
    align-items:flex-start;
    gap:15px;
    padding:22px 0;
    border-bottom:1px solid #edf0f2;
}

.notification-item.last{
    border-bottom:none;
}

.icon{
    width:36px;
    height:36px;
    border-radius:10px;
    display:flex;
    align-items:center;
    justify-content:center;
    flex-shrink:0;
}

.danger{
    background:#fff0ee;
    color:#e14c38;
}

.success{
    background:#eaf8ef;
    color:#28a745;
}

.primary{
    background:#eaf4ff;
    color:#0d6efd;
}

.content{
    flex:1;
}

.content h4{
    color:#232738;
    margin-bottom:5px;
}

.content p{
    color:#6b7280;
    margin-bottom:8px;
}

.content span{
    color:#9ca3af;
    font-size:13px;
}

.dot{
    width:8px;
    height:8px;
    border-radius:50%;
    background:#dc4c36;
    margin-top:8px;
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