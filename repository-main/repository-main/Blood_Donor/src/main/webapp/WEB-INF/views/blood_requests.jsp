	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	
	<%@ page import="java.util.List" %>
	<%@ page import="com.example.project1.Entity.BloodRequest" %>
	<!DOCTYPE html>
	<html lang="en">
	
	<head>
	
	<meta charset="UTF-8">
	<meta name="viewport"
	      content="width=device-width, initial-scale=1.0">
	
	<title>Blood Requests - BloodConnect</title>
	
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
	
	/* LAYOUT */
	
	.app{
	    display:flex;
	    min-height:100vh;
	}
	
	/* SIDEBAR */
	
	.sidebar{
	    width:260px;
	    background:#111827;
	    color:white;
	    padding:20px 15px;
	    display:flex;
	    flex-direction:column;
	    justify-content:space-between;
	}
	
	.logo{
	    display:flex;
	    align-items:center;
	    gap:12px;
	    margin-bottom:35px;
	}
	
	.logo-icon{
	    width:45px;
	    height:45px;
	    border-radius:12px;
	    background:#ef4444;
	    display:flex;
	    align-items:center;
	    justify-content:center;
	    font-size:20px;
	}
	
	.logo h2{
	    font-size:20px;
	}
	
	.logo p{
	    font-size:12px;
	    color:#aaa;
	}
	
	/* MENU */
	
	.menu-title{
	    color:#8e8e8e;
	    font-size:12px;
	    margin:20px 0 10px;
	    text-transform:uppercase;
	}
	
	.menu a{
	    display:flex;
	    align-items:center;
	    gap:12px;
	    text-decoration:none;
	    color:#d1d5db;
	    padding:13px 15px;
	    border-radius:10px;
	    margin-bottom:8px;
	    transition:0.3s;
	    font-size:15px;
	}
	
	.menu a:hover{
	    background:#1f2937;
	}
	
	.menu a.active{
	    background:#ef4444;
	    color:white;
	}
	
	.menu a i{
	    width:20px;
	}
	
	/* USER */
	
	.user-box{
	    border-top:1px solid #2a3342;
	    padding-top:20px;
	}
	
	.user-info{
	    display:flex;
	    align-items:center;
	    gap:12px;
	    margin-bottom:20px;
	}
	
	.avatar{
	    width:45px;
	    height:45px;
	    border-radius:50%;
	    background:#ef4444;
	    display:flex;
	    align-items:center;
	    justify-content:center;
	    font-weight:bold;
	}
	
	.user-name{
	    font-weight:bold;
	}
	
	.user-role{
	    color:#aaa;
	    font-size:13px;
	}
	
	.logout{
	    color:#ef4444;
	    text-decoration:none;
	    display:flex;
	    align-items:center;
	    gap:10px;
	}
	
	/* CONTENT */
	
	.content{
	    flex:1;
	    padding:25px;
	}
	
	/* TOPBAR */
	
	.topbar{
	    display:flex;
	    justify-content:space-between;
	    align-items:center;
	    margin-bottom:30px;
	}
	
	.topbar h1{
	    font-size:26px;
	    color:#111827;
	}
	
	.top-icons{
	    display:flex;
	    align-items:center;
	    gap:20px;
	}
	
	.notify{
	    position:relative;
	    font-size:20px;
	    color:#444;
	}
	
	.notify span{
	    position:absolute;
	    top:-8px;
	    right:-10px;
	    width:18px;
	    height:18px;
	    border-radius:50%;
	    background:red;
	    color:white;
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
	
	/* CARD */
	
	.card{
	    background:white;
	    padding:25px;
	    border-radius:18px;
	    box-shadow:0 2px 10px rgba(0,0,0,0.06);
	}
	
	.card-header{
	    display:flex;
	    justify-content:space-between;
	    align-items:center;
	    margin-bottom:25px;
	}
	
	.card-header h2{
	    color:#111827;
	}
	
	.stats{
	    display:flex;
	    gap:20px;
	    font-size:14px;
	}
	
	.pending{
	    color:#f59e0b;
	    font-weight:bold;
	}
	
	.completed{
	    color:#22c55e;
	    font-weight:bold;
	}
	
	/* TABLE */
	
	table{
	    width:100%;
	    border-collapse:collapse;
	}
	
	table th{
	    text-align:left;
	    padding:14px 10px;
	    color:#6b7280;
	    font-size:13px;
	    border-bottom:1px solid #eee;
	}
	
	table td{
	    padding:18px 10px;
	    border-bottom:1px solid #f1f1f1;
	    font-size:14px;
	    color:#374151;
	}
	
	/* STATUS */
	
	.status{
	    padding:6px 12px;
	    border-radius:20px;
	    font-size:12px;
	    font-weight:bold;
	}
	
	.status.pending{
	    background:#fff7ed;
	    color:#f59e0b;
	}
	
	.status.completed{
	    background:#dcfce7;
	    color:#22c55e;
	}
	
	/* RESPONSIVE */
	
	@media(max-width:768px){
	
	    .content{
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
	
	<div class="app">
	
	    <!-- SIDEBAR -->
	
	    <div class="sidebar">
	
	        <div>
	
	            <div class="logo">
	
	                <div class="logo-icon">
	                    ❤️
	                </div>
	
	                <div>
	                    <h2>BloodConnect</h2>
	                    <p>Save Lives Together</p>
	                </div>
	
	            </div>
	
	            <div class="menu">
	
	                <div class="menu-title">
	                    Overview
	                </div>
	
	                <a href="${pageContext.request.contextPath}/adminDashboard">
	                    <i class="fa-solid fa-chart-column"></i>
	                    Dashboard
	                </a>
	
	                <div class="menu-title">
	                    Management
	                </div>
	
	                <a href="${pageContext.request.contextPath}/manageUsers">
	                    <i class="fa-solid fa-users"></i>
	                    Manage Users
	                </a>
	
	                <a href="${pageContext.request.contextPath}/manageDonors">
	                    <i class="fa-solid fa-heart"></i>
	                    Manage Donors
	                </a>
	
	                <a href="${pageContext.request.contextPath}/bloodRequests"
	                   class="active">
	
	                    <i class="fa-solid fa-triangle-exclamation"></i>
	                    Blood Requests
	
	                </a>
	
	            </div>
	
	        </div>
	
	        <!-- USER -->
	
	        <div class="user-box">
	
	            <div class="user-info">
	
	                <div class="avatar">
	                    RS
	                </div>
	
	                <div>
	
	                    <div class="user-name">
	                        Rahul
	                    </div>
	
	                    <div class="user-role">
	                        Administrator
	                    </div>
	
	                </div>
	
	            </div>
	
	            <a href="adminlogin.jsp" class="logout">
	
	                <i class="fa-solid fa-right-from-bracket"></i>
	                Sign Out
	
	            </a>
	
	        </div>
	
	    </div>
	
	    <!-- CONTENT -->
	
	    <div class="content">
	
	        <div class="topbar">
	
	            <h1>
	                Blood Requests
	            </h1>
	
	            <div class="top-icons">
	
	                <div class="notify">
	
	                    <i class="fa-regular fa-bell"></i>
	
	                    <span>
	                        2
	                    </span>
	
	                </div>
	
	                <div class="profile"> RS</div>
	
	            </div>
	
	        </div>
	
	        <!-- CARD -->
	
	        <div class="card">
	
	            <div class="card-header">
	
	                <div>
	
	                    <h2>
	                        Manage Blood Requests
	                    </h2>
	
	                    <p style="color:#6b7280;
	                              margin-top:6px;">
	
	                        Review and manage blood requests
	
	                    </p>
	
	                </div>
	
	<%
	
	int pendingCount = 0;
	int completedCount = 0;
	
	List<BloodRequest> requests =
	(List<BloodRequest>) request.getAttribute("requests");
	
	if(requests != null){
	
	    for(BloodRequest br : requests){
	
	        if("Completed".equalsIgnoreCase(br.getStatus())){
	
	            completedCount++;
	
	        }else{
	
	            pendingCount++;
	        }
	    }
	}
	%>
 <div class="stats">
 <div class="pending">
 <%= pendingCount %> Pending
</div>
	
 <div class="completed">
	
  <%= completedCount %> Completed
	
</div>
	
 </div>
</div> 
  <table>
  <thead>
		  <tr>
		                        <th>PATIENT</th>
		                        <th>BLOOD GROUP</th>
		                        <th>HOSPITAL</th>
		                        <th>UNITS</th>
		                        <th>CITY</th>
		                        <th>CONTACT</th>
		                        <th>DATE</th>
		                        <th>STATUS</th>
	  </tr>
</thead>
   <tbody>
	<%
	if(requests != null && !requests.isEmpty()){
	
	    for(BloodRequest br : requests){
	%>
	<tr>
	    <td>
	        <%= br.getPatientName() %>
	    </td>
	    <td>
	        <%= br.getBloodGroup() %>
	    </td>
	    <td>
	        <%= br.getHospital() %>
	    </td>
	    <td>
	        <%= br.getUnitsRequired() %>
	    </td>
	    <td>
	        <%= br.getCity() %>
	    </td>
	    <td>
	        <%= br.getContactNumber() %>
	    </td>
	    
	    <td>
	<%
	if("Completed".equalsIgnoreCase(br.getStatus())){
	%>
	<span class="status completed">Completed</span>
	<%
	}else{
	%>
	<span class="status pending"> Pending</span>
	<%
	}
	%>
  </td>
	</tr>
	<%
	    }
	}else{
	%>
	<tr>
	<td colspan="8" style="text-align:center;"> No Blood Requests Found
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