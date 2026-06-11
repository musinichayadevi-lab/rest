package com.example.project1.Controllers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.project1.Entity.ManageDonor;

@Controller
public class ManageDonorController {

    private final String url = "jdbc:mysql://localhost:3306/blood_donation";
    private final String dbUser = "root";
    private final String dbPassword = "root";

    @GetMapping("/manageDonors")
    public String manageDonors(Model model) {

        List<ManageDonor> donors = getAllDonors();

        model.addAttribute("donors", donors);

        return "manage_donors";
    }

    private List<ManageDonor> getAllDonors() {

        List<ManageDonor> donors = new ArrayList<>();

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn =
                    DriverManager.getConnection(
                            url,
                            dbUser,
                            dbPassword);

            String sql =
                    "SELECT d.id, u.name, u.email, d.blood_group, " +
                    "d.city, d.last_donation_date, d.availability " +
                    "FROM donors d " +
                    "JOIN users u ON d.user_id = u.id";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                ManageDonor donor = new ManageDonor();

                donor.setId(rs.getInt("id"));
                donor.setFullName(rs.getString("name"));
                donor.setEmail(rs.getString("email"));
                donor.setBloodGroup(rs.getString("blood_group"));
                donor.setCity(rs.getString("city"));
                donor.setLastDonationDate(
                        rs.getDate("last_donation_date"));

                boolean available =
                        rs.getBoolean("availability");

                donor.setStatus(
                        available ? "Active" : "Blocked");

                donors.add(donor);
            }

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return donors;
    }
}