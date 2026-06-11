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

        <div class="menu-title">MAIN</div>

        <ul class="menu">
            <li><i class="fa-regular fa-square"></i> Dashboard</li>
            <li><i class="fas fa-search"></i> Find Donors</li>
            <li class="active"><i class="fas fa-triangle-exclamation"></i> Emergency Request</li>
        </ul>

        <div class="menu-title">MY ACCOUNT</div>

        <ul class="menu">
            <li><i class="fas fa-history"></i> Request History</li>
            <li>
                <i class="far fa-bell"></i> Notifications
                <span class="badge">2</span>
            </li>
            <li><i class="far fa-user"></i> My Profile</li>
        </ul>

        <div class="menu-title">SUPPORT</div>

        <ul class="menu">
            <li><i class="far fa-envelope"></i> Contact Us</li>
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

                <div class="form-grid">

                    <div class="form-group">
                        <label>Patient Name *</label>
                        <input type="text" placeholder="Full name">
                    </div>

                    <div class="form-group">
                        <label>Blood Group Required *</label>
                        <select>
                            <option>O+</option>
                            <option>A+</option>
                            <option>B+</option>
                            <option>AB+</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Hospital Name *</label>
                        <input type="text" placeholder="Hospital">
                    </div>

                    <div class="form-group">
                        <label>City</label>
                        <input type="text" value="Hyderabad">
                    </div>

                    <div class="form-group">
                        <label>Urgency Level</label>
                        <select>
                            <option>High</option>
                            <option>Medium</option>
                            <option>Critical</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Units Required</label>
                        <input type="number" value="1">
                    </div>

                </div>

                <div class="form-group">
                    <label>Contact Number</label>
                    <input type="text" placeholder="10-digit number">
                </div>

                <div class="form-group">
                    <label>Additional Notes</label>
                    <textarea rows="4"
                        placeholder="Any additional information..."></textarea>
                </div>

                <button class="submit-btn">
                    <i class="fas fa-triangle-exclamation"></i>
                    Submit Emergency Request
                </button>

            </div>

            <!-- Right Sidebar -->
            <div class="right-panel">

                <div class="card">
                    <h3>Active Requests</h3>

                    <div class="request-item">
                        <span class="blood">O+</span>
                        <div>
                            <h4>Ramesh K</h4>
                            <p>Apollo Hospital, Hyderabad</p>
                            <span class="tag high">High</span>
                        </div>
                    </div>

                    <div class="request-item">
                        <span class="blood">A+</span>
                        <div>
                            <h4>Sita Devi</h4>
                            <p>NIMS, Hyderabad</p>
                            <span class="tag medium">Medium</span>
                        </div>
                    </div>

                    <div class="request-item">
                        <span class="blood">B+</span>
                        <div>
                            <h4>James Paul</h4>
                            <p>Yashoda, Hyderabad</p>
                            <span class="tag critical">Critical</span>
                        </div>
                    </div>

                </div>

                <div class="helpline-card">
                    <h3>Emergency Helpline</h3>
                    <p><i class="fas fa-phone"></i> 1800-BLOOD-HELP</p>
                    <small>Available 24/7 for critical emergencies</small>
                </div>

            </div>

        </div>

    </main>

</div>

</body>
</html>
