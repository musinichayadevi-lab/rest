<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Blood Donation Management</title>

  <style>

    *{
      margin:0;
      padding:0;
      box-sizing:border-box;
      font-family:Arial, Helvetica, sans-serif;
    }

    body{
      background:linear-gradient(to right,#ffdde1,#ee9ca7);
      min-height:100vh;
    }

    /* NAVBAR */

    nav{
      width:100%;
      background:white;
      display:flex;
      justify-content:space-between;
      align-items:center;
      padding:18px 60px;
      box-shadow:0 3px 10px rgba(0,0,0,0.1);
      position:sticky;
      top:0;
    }

    nav h1{
      color:#e63946;
      font-size:30px;
    }

    nav ul{
      list-style:none;
      display:flex;
      gap:25px;
    }

    nav ul li a{
      text-decoration:none;
      color:#333;
      font-size:18px;
      font-weight:bold;
      transition:0.3s;
    }

    nav ul li a:hover{
      color:#e63946;
    }

    /* HERO SECTION */

    .hero{
      display:flex;
      flex-direction:column;
      justify-content:center;
      align-items:center;
      text-align:center;
      height:85vh;
      padding:20px;
      color:white;
    }

    .hero h2{
      font-size:60px;
      margin-bottom:20px;
      text-shadow:2px 2px 10px rgba(0,0,0,0.2);
    }

    .hero p{
      width:70%;
      font-size:22px;
      line-height:1.6;
      margin-bottom:30px;
    }

    /* BUTTON */

    .btn{
      padding:15px 40px;
      border:none;
      border-radius:50px;
      background:#e63946;
      color:white;
      font-size:20px;
      cursor:pointer;
      transition:0.3s;
      box-shadow:0 5px 15px rgba(0,0,0,0.2);
    }

    .btn:hover{
      background:#c1121f;
      transform:translateY(-5px);
    }

    /* FEATURES */

    .features{
      display:grid;
      grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
      gap:20px;
      padding:50px;
    }

    .card{
      background:white;
      padding:30px;
      border-radius:20px;
      text-align:center;
      box-shadow:0 5px 15px rgba(0,0,0,0.1);
      transition:0.3s;
    }

    .card:hover{
      transform:translateY(-10px);
    }

    .card h3{
      color:#e63946;
      margin-bottom:15px;
    }

    .card p{
      color:#555;
      line-height:1.5;
    }

    /* FOOTER */

    footer{
      background:#e63946;
      color:white;
      text-align:center;
      padding:20px;
      margin-top:40px;
    }

    /* MOBILE RESPONSIVE */

    @media(max-width:768px){

      nav{
        flex-direction:column;
        gap:15px;
        padding:20px;
      }

      nav ul{
        flex-wrap:wrap;
        justify-content:center;
      }

      .hero h2{
        font-size:38px;
      }

      .hero p{
        width:100%;
        font-size:18px;
      }

    }

  </style>
</head>

<body>

  <!-- NAVBAR -->

  <nav>

    <h1>❤️ Blood Donation</h1>

    <ul>
      <li><a href="index.html">Home</a></li>
      <li><a href="about.html">About</a></li>
      <li><a href="search.html">Search Donor</a></li>
      <li><a href="login.html">Login</a></li>
      <li><a href="contact.html">Contact</a></li>
    </ul>

  </nav>

  <!-- HERO -->

  <section class="hero">

    <h2>Donate Blood, Save Lives ❤️</h2>

    <p>
      Your small donation can save someone's life.
      Join our blood donation community and help patients in emergency situations.
    </p>

    <button class="btn" onclick="searchDonor()">
      Search Donor
    </button>

  </section>

  <!-- FEATURES -->

  <section class="features">

    <div class="card">
      <h3>🩸 Easy Donor Search</h3>
      <p>Find blood donors instantly by blood group and city.</p>
    </div>

    <div class="card">
      <h3>⚡ Emergency Support</h3>
      <p>Quick blood request system for emergency situations.</p>
    </div>

    <div class="card">
      <h3>❤️ Save Lives</h3>
      <p>Your donation can help patients and hospitals anytime.</p>
    </div>

  </section>

  <!-- FOOTER -->

  <footer>
    <p>© 2026 Blood Donation Management System | Made with ❤️</p>
  </footer>

  <!-- JAVASCRIPT -->

  <script>

    function searchDonor(){
      window.location.href="search.html";
    }

  </script>

</body>
</html>