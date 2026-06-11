package com.example.project1.Controllers;



import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.project1.Entity.UserEntity;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

    private final String url = "jdbc:mysql://localhost:3306/blood_donation";
    private final String dbUser = "root";
    private final String dbPassword = "root";
    @GetMapping("/userlogin")
    public String showLoginPage() {
        return "userlogin";
    }
    @PostMapping("/userlogin")
    public String loginUser(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            @RequestParam("role") String role,
            HttpSession session) {

        UserEntity user = isValidUser(email, password, role);

        if (user != null) {

            session.setAttribute("name", user.getFullName());
            session.setAttribute("bloodGroup", user.getBloodGroup());
            session.setAttribute("email", user.getEmail());
            session.setAttribute("role", user.getRole());
            session.setAttribute("loggedInUser", user);

            if ("ADMIN".equalsIgnoreCase(user.getRole())) {
                return "redirect:/admin_dashboard";
            } else {
                return "redirect:/userdashboard";
            }
        }

        return "redirect:/login?error=true";
    }

    private UserEntity isValidUser(String email, String password, String role) {

        UserEntity user = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(
                    url,
                    dbUser,
                    dbPassword);

            String sql =
                    "SELECT * FROM users WHERE email=? AND password=? AND role=?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);
            ps.setString(3, role);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                user = new UserEntity();

                user.setId(rs.getInt("id"));
                user.setFullName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setBloodGroup(rs.getString("blood_group"));
                user.setCity(rs.getString("city"));
                user.setPhone(rs.getString("phone"));

                Date lastDonationDate =
                        rs.getDate("last_donation_date");

                user.setLastDonationDate(lastDonationDate);
                user.setRole(rs.getString("role"));
            }

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}
