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

import com.example.project1.Entity.BloodRequest;

@Controller
public class BloodRequestController {

    private final String url = "jdbc:mysql://localhost:3306/blood_donation";
    private final String dbUser = "root";
    private final String dbPassword = "root";

    @GetMapping("/bloodRequests")
    public String getBloodRequests(Model model) {

        List<BloodRequest> requests = getAllBloodRequests();

        model.addAttribute("requests", requests);

        return "blood_requests";
    }

    private List<BloodRequest> getAllBloodRequests() {

        List<BloodRequest> requests = new ArrayList<>();

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(
                    url,
                    dbUser,
                    dbPassword);

            String sql = "SELECT * FROM blood_requests";

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                BloodRequest request = new BloodRequest();

                request.setId(rs.getInt("id"));
                request.setPatientName(rs.getString("patient_name"));
                request.setBloodGroup(rs.getString("blood_group"));
                request.setHospital(rs.getString("hospital"));
                request.setUnitsRequired(rs.getInt("units_required"));
                request.setCity(rs.getString("city"));
                request.setContact(rs.getString("contact_number"));
                request.setStatus(rs.getString("status"));

                requests.add(request);
            }

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return requests;
    }
}