package com.example.project1.Controllers;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.project1.Entity.FindDonor;

@Controller
public class FindDonorController {

    private final String url = "jdbc:mysql://localhost:3306/blood_donation";
    private final String dbUser = "root";
    private final String dbPassword = "root";
    
    
    @GetMapping("/findDonors")
    public String findDonors(
            @RequestParam(required = false) String bloodGroup,
            @RequestParam(required = false) String city,
            Model model) {

        List<FindDonor> donors = getDonors(bloodGroup, city);

        model.addAttribute("donors", donors);

        return "find_donor";
    }

    private List<FindDonor> getDonors(String bloodGroup, String city) {

        List<FindDonor> donors = new ArrayList<>();

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(
                    url,
                    dbUser,
                    dbPassword);

            StringBuilder sql = new StringBuilder(
                    "SELECT * FROM donors WHERE 1=1");

            List<Object> params = new ArrayList<>();

            if (bloodGroup != null && !bloodGroup.isBlank()) {
                sql.append(" AND blood_group = ?");
                params.add(bloodGroup);
            }

            if (city != null && !city.isBlank()) {
                sql.append(" AND city LIKE ?");
                params.add("%" + city + "%");
            }

            PreparedStatement ps =
                    conn.prepareStatement(sql.toString());

            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                FindDonor donor = new FindDonor();

                donor.setId(rs.getInt("id"));
                donor.setBloodGroup(rs.getString("blood_group"));
                donor.setCity(rs.getString("city"));
                donor.setPhone(rs.getString("phone"));
                donor.setAvailability(
                        rs.getBoolean("availability"));

                Date lastDonationDate =
                        rs.getDate("last_donation_date");

                donor.setLastDonationDate(lastDonationDate);

                donors.add(donor);
            }

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return donors;
    }
}