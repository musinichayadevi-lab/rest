package com.example.project1.rest.controller;


import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.HashMap;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class RegisterRestController {

    private final String url = "jdbc:mysql://localhost:3306/blood_donation";
    private final String dbUser = "root";
    private final String dbPassword = "root";

    @PostMapping("/register")
    public ResponseEntity<?> registerUser(
            @RequestParam String fullname,
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam String bloodgroup,
            @RequestParam String city,
            @RequestParam(required = false) String lastDonationDate,
            @RequestParam String phone) {

        Map<String, Object> response = new HashMap<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn =
                    DriverManager.getConnection(
                            url,
                            dbUser,
                            dbPassword);

            String sql =
                    "INSERT INTO users " +
                    "(name,email,password,blood_group,city,phone,last_donation_date,role) " +
                    "VALUES (?,?,?,?,?,?,?,?)";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, bloodgroup);
            ps.setString(5, city);
            ps.setString(6, phone);

            if (lastDonationDate != null &&
                    !lastDonationDate.isEmpty()) {
                ps.setDate(7, Date.valueOf(lastDonationDate));
            } else {
                ps.setDate(7, null);
            }

            ps.setString(8, "USER");

            int rows = ps.executeUpdate();

            conn.close();

            if (rows > 0) {

                response.put("success", true);
                response.put("message",
                        "Registration Successful");

                return ResponseEntity.ok(response);
            }

        } catch (Exception e) {

            response.put("success", false);
            response.put("message", e.getMessage());

            return ResponseEntity
                    .internalServerError()
                    .body(response);
        }

        response.put("success", false);
        response.put("message", "Registration Failed");

        return ResponseEntity.badRequest().body(response);
    }
}