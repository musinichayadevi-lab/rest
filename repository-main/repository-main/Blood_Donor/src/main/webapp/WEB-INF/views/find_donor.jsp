<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.example.project1.Entity.FindDonor"%>

<%
List<FindDonor> donors =
    (List<FindDonor>) request.getAttribute("donors");

String name = (String) session.getAttribute("name");
if (name == null) {
    name = "User";
}

String initials = "";
String[] words = name.split(" ");
for (String w : words) {
    if (w.length() > 0) {
        initials += Character.toUpperCase(w.charAt(0));
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find Donors</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
/* ===== YOUR EXISTING CSS (unchanged for UI) ===== */
body { margin:0; font-family:Segoe UI; background:#f5f7fb; display:flex; }

.sidebar {
    width:320px; min-height:100vh; background:#11152f; color:white;
    position:fixed; left:0; top:0;
}

.logo { padding:30px; display:flex; gap:15px; border-bottom:1px solid #333; }

.logo-icon {
    width:55px;height:55px;border-radius:16px;background:#cf3b2d;
    display:flex;align-items:center;justify-content:center;
}

.menu { padding:20px; }

.nav-item {
    display:block; padding:14px; color:#ddd;
    text-decoration:none; border-radius:10px; margin-bottom:10px;
}

.nav-item:hover { background:#1b2148; }

.active { background:#cf3b2d; color:white; }

.main { margin-left:320px; width:100%; }

.header {
    background:white; padding:20px 30px;
    display:flex; justify-content:space-between;
    border-bottom:1px solid #ddd;
}

.content { padding:30px; }

.search-card {
    background:white; padding:20px; border-radius:15px;
}

.filters {
    display:flex; gap:15px;
}

select, input {
    padding:12px; border:1px solid #ddd;
    border-radius:10px; width:200px;
}

button {
    padding:12px 20px;
    background:#cf3b2d; color:white;
    border:none; border-radius:10px;
}

.donor-grid {
    margin-top:30px;
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:20px;
}

.donor-card {
    background:white; padding:20px;
    border-radius:15px;
}
.blood {
    font-size:22px; font-weight:bold;
    color:#cf3b2d;
}
.status { color:green; margin-top:5px; }
</style>
</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar">

    <div class="logo">
        <div class="logo-icon"><i class="fa fa-heart"></i></div>
        <div>
            <h3>BloodConnect</h3>
            <p>Save Lives</p>
        </div>
    </div>

    <div class="menu">

        <!-- IMPORTANT: USE CONTROLLER URLS -->
        <a class="nav-item" href="userdashboard">
            <i class="fa fa-home"></i> Dashboard
        </a>

        <a class="nav-item active" href="findDonors">
            <i class="fa fa-search"></i> Find Donors
        </a>

        <a class="nav-item" href="emergency_request">
            Emergency Request
        </a>

    </div>
</div>

<!-- MAIN -->
<div class="main">

    <div class="header">
        <h2>Find Donors</h2>

        <div>
            <div style="background:#cf3b2d;color:white;
                        width:40px;height:40px;border-radius:50%;
                        display:flex;align-items:center;justify-content:center;">
                <%= initials %>
            </div>
        </div>
    </div>

    <div class="content">

        <!-- SEARCH FORM -->
        <div class="search-card">

            <form action="findDonors" method="get" class="filters">

                <select name="bloodGroup">
                    <option value="">All Groups</option>
                    <option>O+</option>
                    <option>O-</option>
                    <option>A+</option>
                    <option>A-</option>
                    <option>B+</option>
                    <option>B-</option>
                    <option>AB+</option>
                    <option>AB-</option>
                </select>

                <input type="text" name="city" placeholder="Enter city">

                <button type="submit">Search</button>

            </form>

        </div>

        <!-- DONOR LIST -->
        <div class="donor-grid">

            <%
            if (donors != null && !donors.isEmpty()) {
                for (FindDonor d : donors) {
            %>

            <div class="donor-card">

                <div class="blood">
                    <%= d.getBloodGroup() %>
                </div>

                <p><b>City:</b> <%= d.getCity() %></p>
                <p><b>Phone:</b> <%= d.getPhone() %></p>
                <p><b>Available:</b>
                    <%= d.isAvailability() ? "Yes" : "No" %>
                </p>

                <p><b>Last Donation:</b>
                    <%= d.getLastDonationDate() %>
                </p>

            </div>

            <%
                }
            } else {
            %>

            <h3>No donors found</h3>

            <%
            }
            %>

        </div>

    </div>
</div>

</body>
</html>