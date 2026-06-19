<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BloodConnect - Contact Us</title>

<link rel="stylesheet" href="contact.css">

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

/* Layout */

.container{
    display:flex;
    min-height:100vh;
}

/* Sidebar */

.sidebar{
    width:230px;
    background:#12152f;
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
    background:#d44b37;
    display:flex;
    align-items:center;
    justify-content:center;
}

.logo span{
    font-size:12px;
    color:#b6b8c8;
}

.menu{
    padding:15px 10px;
}

.menu h5{
    color:#7f829a;
    margin:18px 10px;
    font-size:11px;
}

.menu a{
    display:flex;
    align-items:center;
    gap:12px;
    text-decoration:none;
    color:#e7e8ef;
    padding:12px 14px;
    border-radius:10px;
    margin-bottom:5px;
}

.menu a:hover{
    background:#1f2140;
}

.active{
    background:#d44b37;
}

.badge{
    margin-left:auto;
    background:#d44b37;
    width:18px;
    height:18px;
    border-radius:50%;
    font-size:11px;
    display:flex;
    align-items:center;
    justify-content:center;
}

/* Footer */

.sidebar-footer{
    padding:15px;
    border-top:1px solid rgba(255,255,255,.08);
}

.user-card{
    background:#222542;
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
    background:#d44b37;
    display:flex;
    align-items:center;
    justify-content:center;
    font-weight:bold;
}

.user-card p{
    color:#b6b8c8;
    font-size:13px;
}

.logout{
    display:flex;
    gap:10px;
    align-items:center;
    color:#ff8b7b;
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
    padding:0 25px;
}

.top-right{
    display:flex;
    align-items:center;
    gap:15px;
}

.notification{
    width:38px;
    height:38px;
    background:#f3f4f6;
    border-radius:12px;
    display:flex;
    align-items:center;
    justify-content:center;
    position:relative;
}

.notification span{
    position:absolute;
    top:-4px;
    right:-4px;
    width:18px;
    height:18px;
    border-radius:50%;
    background:#d44b37;
    color:white;
    font-size:11px;
    display:flex;
    align-items:center;
    justify-content:center;
}

.profile{
    width:38px;
    height:38px;
    border-radius:50%;
    background:#d44b37;
    color:white;
    display:flex;
    align-items:center;
    justify-content:center;
    font-weight:600;
}

.page-header{
    padding:30px 25px;
}

.page-header h1{
    color:#232738;
    margin-bottom:8px;
}

.page-header p{
    color:#6b7280;
}

/* Content */

.content-grid{
    display:grid;
    grid-template-columns:1.1fr .8fr;
    gap:20px;
    padding:0 25px 25px;
}

.contact-card,
.faq-card{
    background:white;
    border-radius:16px;
    border:1px solid #e5e7eb;
    padding:20px;
}

.contact-card h3,
.faq-card h3{
    margin-bottom:20px;
    color:#232738;
}

.row{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:15px;
}

.field{
    margin-bottom:18px;
}

.field label{
    display:block;
    margin-bottom:8px;
    color:#374151;
    font-size:14px;
}

input,
textarea{
    width:100%;
    border:1px solid #e5e7eb;
    border-radius:10px;
    padding:14px;
    font-size:14px;
    outline:none;
}

textarea{
    height:120px;
    resize:none;
}

button{
    background:#d44b37;
    color:white;
    border:none;
    padding:13px 22px;
    border-radius:8px;
    cursor:pointer;
    font-weight:600;
}

/* Emergency */

.right-section{
    display:flex;
    flex-direction:column;
    gap:16px;
}

.emergency-card{
    background:#fff5f3;
    border:1px solid #f2a094;
    border-radius:16px;
    padding:22px;
    display:flex;
    gap:15px;
    align-items:center;
}

.phone-icon{
    width:44px;
    height:44px;
    border-radius:12px;
    background:#d44b37;
    color:white;
    display:flex;
    align-items:center;
    justify-content:center;
}

.help-title{
    color:#d44b37;
    font-weight:600;
}

.emergency-card h2{
    margin:5px 0;
    color:#232738;
}

.emergency-card p{
    color:#6b7280;
}

/* FAQ */

.faq-item{
    padding:15px 0;
    border-bottom:1px solid #ececec;
}

.faq-item:last-child{
    border-bottom:none;
}

.faq-item h4{
    margin-bottom:8px;
    color:#232738;
}

.faq-item p{
    color:#6b7280;
    font-size:14px;
}
</style>
</head>

<body>

<div class="container">

    <!-- SIDEBAR -->
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

                <a href="javascript:void(0)"
   onclick="window.location.href='userdashboard'">
    <i class="fa-regular fa-house"></i>
    Dashboard
</a>

<a href="javascript:void(0)"
   onclick="window.location.href='findDonors'">
    <i class="fa-solid fa-magnifying-glass"></i>
    Find Donors
</a>

<a href="javascript:void(0)"
   onclick="window.location.href='emergency_request'">
    <i class="fa-solid fa-triangle-exclamation"></i>
    Emergency Request
</a>

<h5>MY ACCOUNT</h5>

<a href="javascript:void(0)"
   onclick="window.location.href='requestHistory'">
    <i class="fa-solid fa-clock-rotate-left"></i>
    Request History
</a>

<a href="javascript:void(0)"
   onclick="window.location.href='notifications'">
    <i class="fa-regular fa-bell"></i>
    Notifications
    <span class="badge">2</span>
</a>

<a href="javascript:void(0)"
   onclick="window.location.href='profile'">
    <i class="fa-regular fa-user"></i>
    My Profile
</a>

<h5>SUPPORT</h5>

<a href="javascript:void(0)"
   onclick="window.location.href='contactUs'"
   class="active">
    <i class="fa-regular fa-envelope"></i>
    Contact Us
</a>
            </nav>

        </div>

        <div class="sidebar-footer">

            <div class="user-card">
                <div class="avatar">RS</div>

                <div>
                    <h4>Rahul</h4>
                    <p>O+ Donor</p>
                </div>
            </div>

            <a href="#" class="logout">
                <i class="fa-solid fa-arrow-right-from-bracket"></i>
                Sign Out
            </a>

        </div>

    </aside>

    <!-- MAIN CONTENT -->
    <main class="main-content">

        <!-- TOPBAR -->
        <div class="topbar">

            <h2>Contact Us</h2>

            <div class="top-right">

                <div class="notification">
                    <i class="fa-regular fa-bell"></i>
                    <span>2</span>
                </div>

                <div class="profile">RS</div>

            </div>

        </div>

        <!-- PAGE HEADER -->
        <div class="page-header">
            <h1>Contact Us</h1>
            <p>Reach out for support, inquiries, or emergencies</p>
        </div>

        <!-- CONTENT -->
        <div class="content-grid">

            <!-- CONTACT FORM -->
            <div class="contact-card">

                <h3>Send a Message</h3>

                <form>

                    <div class="row">

                        <div class="field">
                            <label>Your Name</label>
                            <input type="text" placeholder="Full name">
                        </div>

                        <div class="field">
                            <label>Email</label>
                            <input type="email" placeholder="you@example.com">
                        </div>

                    </div>

                    <div class="field">
                        <label>Subject</label>
                        <input type="text" placeholder="How can we help?">
                    </div>

                    <div class="field">
                        <label>Message</label>
                        <textarea placeholder="Write your message..."></textarea>
                    </div>

                    <button type="submit">
                        Send Message
                    </button>

                </form>

            </div>

            <!-- RIGHT SIDE -->
            <div class="right-section">

                <!-- EMERGENCY -->
                <div class="emergency-card">

                    <div class="phone-icon">
                        <i class="fa-solid fa-phone"></i>
                    </div>

                    <div>
                        <span class="help-title">
                            Emergency Helpline
                        </span>

                        <h2>1800-BLOOD-HELP</h2>

                        <p>Available 24 hours, 7 days</p>
                    </div>

                </div>

                <!-- FAQ -->
                <div class="faq-card">

                    <h3>Frequently Asked Questions</h3>

                    <div class="faq-item">
                        <h4>How often can I donate blood?</h4>
                        <p>Every 3 months (90 days) for whole blood.</p>
                    </div>

                    <div class="faq-item">
                        <h4>What is the minimum age to donate?</h4>
                        <p>18 years old, with a maximum of 65 years.</p>
                    </div>

                    <div class="faq-item">
                        <h4>How do I become a donor?</h4>
                        <p>Register on our platform and update your availability.</p>
                    </div>

                </div>

            </div>

        </div>

    </main>

</div>

</body>
</html>