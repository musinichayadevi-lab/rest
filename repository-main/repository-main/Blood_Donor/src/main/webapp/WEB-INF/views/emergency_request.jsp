<%@ page import="java.util.List" %>
<%@ page import="com.example.project1.Entity.BloodRequest" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BloodConnect - Emergency Request</title>
    <link rel="stylesheet" href="style.css">
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
    width:260px;
    background:#11152d;
    color:#fff;
    padding:20px;
    display:flex;
    flex-direction:column;
}

.logo{
    display:flex;
    align-items:center;
    gap:12px;
    margin-bottom:30px;
}

.logo .icon{
    width:40px;
    height:40px;
    background:#e74c3c;
    border-radius:10px;
    display:flex;
    align-items:center;
    justify-content:center;
}

.logo p{
    font-size:12px;
    color:#bdbdbd;
}

.menu-title{
    font-size:12px;
    color:#999;
    margin:20px 0 10px;
}

.menu{
    list-style:none;
}

.menu li{
    padding:12px;
    margin-bottom:8px;
    border-radius:10px;
    cursor:pointer;
}

.menu li i{
    margin-right:10px;
}

.active{
    background:#d94b3d;
}

.badge{
    float:right;
    background:#e74c3c;
    padding:2px 8px;
    border-radius:20px;
    font-size:12px;
}

.user-card{
    margin-top:auto;
    display:flex;
    gap:12px;
    background:#1d2140;
    padding:12px;
    border-radius:12px;
}

.avatar{
    width:40px;
    height:40px;
    border-radius:50%;
    background:#d94b3d;
    display:flex;
    align-items:center;
    justify-content:center;
}

.user-card p{
    color:#bbb;
    font-size:12px;
}

.logout{
    margin-top:15px;
    color:#ff8b7d;
    cursor:pointer;
}

/* Main */

.main{
    flex:1;
    padding:25px;
}

.topbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.top-icons{
    display:flex;
    gap:15px;
    align-items:center;
}

.notification{
    position:relative;
}

.notification span{
    position:absolute;
    top:-8px;
    right:-10px;
    background:red;
    color:white;
    font-size:11px;
    padding:2px 6px;
    border-radius:50%;
}

.profile{
    width:40px;
    height:40px;
    background:#d94b3d;
    color:white;
    border-radius:50%;
    display:flex;
    align-items:center;
    justify-content:center;
}

.page-header{
    margin:25px 0;
}

.page-header p{
    color:#777;
}

.content-grid{
    display:grid;
    grid-template-columns:2.5fr 1fr;
    gap:20px;
}

.form-card,
.card{
    background:white;
    padding:20px;
    border-radius:15px;
    box-shadow:0 2px 6px rgba(0,0,0,0.05);
}

.form-grid{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:15px;
}

.form-group{
    margin-top:15px;
}

label{
    display:block;
    margin-bottom:6px;
    font-size:14px;
    color:#555;
}

input,
select,
textarea{
    width:100%;
    padding:12px;
    border:1px solid #ddd;
    border-radius:10px;
    outline:none;
}

.submit-btn{
    margin-top:20px;
    background:#d94b3d;
    color:white;
    border:none;
    padding:14px 20px;
    border-radius:10px;
    cursor:pointer;
}

.submit-btn i{
    margin-right:8px;
}

.request-item{
    display:flex;
    gap:12px;
    padding:15px 0;
    border-bottom:1px solid #eee;
}

.blood{
    background:#ffe8e5;
    color:#d94b3d;
    padding:10px;
    border-radius:10px;
    font-weight:bold;
    height:fit-content;
}

.request-item p{
    color:#777;
    font-size:13px;
}

.tag{
    display:inline-block;
    margin-top:6px;
    padding:4px 10px;
    border-radius:20px;
    font-size:12px;
}
.menu li{
    cursor:pointer;
}

.menu li:hover{
    opacity:0.8;
}
.high{
    background:#fff0b8;
    color:#d48806;
}

.medium{
    background:#e6f7ff;
    color:#1890ff;
}

.critical{
    background:#fff1f0;
    color:#f5222d;
}

.helpline-card{
    margin-top:20px;
    background:#fff5f5;
    border:1px solid #ffb3b3;
    padding:20px;
    border-radius:15px;
}

.helpline-card h3{
    color:#d94b3d;
    margin-bottom:10px;
}

.helpline-card p{
    margin-bottom:10px;
}

@media(max-width:900px){

    .content-grid{
        grid-template-columns:1fr;
    }

    .sidebar{
        display:none;
    }

    .form-grid{
        grid-template-columns:1fr;
    }
}
        </style>
        
</head>
<body>

<div class="container">

    <!-- Sidebar -->
    <aside class="sidebar">
        <div class="logo">
            <div class="icon">
                <i class="fas fa-heart"></i>
            </div>
            <div>
                <h3>BloodConnect</h3>
                <p>Save Lives Together</p>
            </div>
        </div>

        <div class="menu-title">MAIN MENU</div>

<ul class="menu">

    <li onclick="window.location.href='userdashboard'"
        style="cursor:pointer;">
        <i class="fa-regular fa-square"></i>
        Dashboard
    </li>

    <li onclick="window.location.href='findDonors'"
        style="cursor:pointer;">
        <i class="fas fa-search"></i>
        Find Donors
    </li>

    <li class="active"
        onclick="window.location.href='emergency_request'"
        style="cursor:pointer;">
        <i class="fas fa-triangle-exclamation"></i>
        Emergency Request
    </li>

</ul>

<div class="menu-title">MY ACCOUNT</div>

<ul class="menu">

    <li onclick="window.location.href='requestHistory'"
        style="cursor:pointer;">
        <i class="fas fa-history"></i>
        Request History
    </li>

    <li onclick="window.location.href='notifications'"
        style="cursor:pointer;">
        <i class="far fa-bell"></i>
        Notifications
        <span class="badge">2</span>
    </li>

    <li onclick="window.location.href='profile'"
        style="cursor:pointer;">
        <i class="far fa-user"></i>
        My Profile
    </li>

</ul>

<div class="menu-title">SUPPORT</div>

<ul class="menu">

    <li onclick="window.location.href='contactUs'"
        style="cursor:pointer;">
        <i class="far fa-envelope"></i>
        Contact Us
    </li>

</ul>
        <div class="user-card">
            <div class="avatar">RS</div>
            <div>
                <h4>Rahul</h4>
                <p>O+ Donor</p>
            </div>
        </div>

        <div class="logout">
            <i class="fas fa-sign-out-alt"></i> Sign Out
        </div>
    </aside>

    <!-- Main Content -->
    <main class="main">

        <div class="topbar">
            <h2>Emergency Request</h2>

            <div class="top-icons">
                <div class="notification">
                    <i class="far fa-bell"></i>
                    <span>2</span>
                </div>
                <div class="profile">RS</div>
            </div>
        </div>

        <div class="page-header">
            <h1>Emergency Blood Request</h1>
            <p>Post an urgent request — matching donors will be notified immediately</p>
        </div>

        <div class="content-grid">

            <!-- Form Card -->
            <div class="form-card">

                <h3>Request Details</h3>

               <form action="saveBloodRequest" method="post">

    <input type="text"
           name="patientName"
           placeholder="Patient Name"
           required>

    <select name="bloodGroup" required>
        <option value="">Select Blood Group</option>
        <option value="O+">O+</option>
        <option value="O-">O-</option>
        <option value="A+">A+</option>
        <option value="A-">A-</option>
        <option value="B+">B+</option>
        <option value="B-">B-</option>
        <option value="AB+">AB+</option>
        <option value="AB-">AB-</option>
    </select>

    <input type="text"
           name="hospital"
           placeholder="Hospital Name">

    <input type="text"
           name="city"
           placeholder="City">

    <input type="text"
           name="contactNumber"
           placeholder="Contact Number">

    <input type="date"
           name="requestDate"
           required>

    <button type="submit">
        Submit Emergency Request
    </button>

</form>

         <div class="card">
    <h3>Active Requests</h3>

    <%
    List<BloodRequest> bloodRequests =
        (List<BloodRequest>)request.getAttribute("bloodRequests");

    if(bloodRequests != null &&
       !bloodRequests.isEmpty()) {

        for(BloodRequest r : bloodRequests) {
    %>

    <div class="request-item">

        <span class="blood">
            <%= r.getBloodGroup() %>
        </span>

        <div>

            <h4>
                <%= r.getPatientName() %>
            </h4>

            <p>
                <%= r.getHospital() %>,
                <%= r.getCity() %>
            </p>

            <span class="tag high">
                Active
            </span>

        </div>

    </div>

    <%
        }
    } else {
    %>

    <p>No active requests found.</p>

    <%
    }
    %>
</div>
</div>
</main>
</div>
</body>
</html>