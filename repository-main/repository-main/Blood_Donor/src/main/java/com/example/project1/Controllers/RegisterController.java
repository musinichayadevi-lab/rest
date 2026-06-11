package com.example.project1.Controllers;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RegisterController {

    private final String url = "jdbc:mysql://localhost:3306/blood_donation";
    private final String dbUser = "root";
    private final String dbPassword = "root";
   
    @GetMapping("/register")
    public String showRegisterPage() {
        return "register";
    }
    @PostMapping("/register")
    public String registerUser(
            @RequestParam("fullname") String fullname,
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            @RequestParam("bloodgroup") String bloodgroup,
            @RequestParam("city") String city,
            @RequestParam(value = "lastDonationDate", required = false) String lastDonationDate,
            @RequestParam("phone") String phone) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(url, dbUser, dbPassword);

            String sql = "INSERT INTO users "
                    + "(name, email, password, blood_group, city, phone, last_donation_date, role) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, bloodgroup);
            ps.setString(5, city);
            ps.setString(6, phone);

            if (lastDonationDate != null && !lastDonationDate.isEmpty()) {
                ps.setDate(7, Date.valueOf(lastDonationDate));
            } else {
                ps.setDate(7, null);
            }

            ps.setString(8, "USER");

            int rows = ps.executeUpdate();

            conn.close();

            if (rows > 0) {
                return "redirect:/userlogin";
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/register?error=true";
    }
}