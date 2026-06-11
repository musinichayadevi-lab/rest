package com.example.project1.Controllers;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.project1.Entity.BloodRequest;

@Controller
public class EmergencyRequestController {

    private final String url = "jdbc:mysql://localhost:3306/blood_donation";
    private final String dbUser = "root";
    private final String dbPassword = "root";

    // SHOW PAGE + LIST
    @GetMapping("/emergency_request")
    public String showPage(Model model) {

        List<BloodRequest> list = new ArrayList<>();

        try {
            Connection conn = DriverManager.getConnection(url, dbUser, dbPassword);

            String sql = "SELECT * FROM blood_request ORDER BY id DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                BloodRequest r = new BloodRequest();
                r.setId(rs.getInt("id"));
                r.setPatientName(rs.getString("patient_name"));
                r.setBloodGroup(rs.getString("blood_group"));
                r.setHospital(rs.getString("hospital"));
                r.setCity(rs.getString("city"));
                r.setContact(rs.getString("contact"));
                r.setUnitsRequired(rs.getInt("units_required"));
                r.setUrgency(rs.getString("urgency"));
                r.setNotes(rs.getString("notes"));
                r.setStatus(rs.getString("status"));

                list.add(r);
            }

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("requests", list);

        return "emergency_request";
    }

    // SAVE REQUEST
    @PostMapping("/emergency_request")
    public String saveRequest(
            @RequestParam String patientName,
            @RequestParam String bloodGroup,
            @RequestParam String hospital,
            @RequestParam String city,
            @RequestParam String contact,
            @RequestParam int unitsRequired,
            @RequestParam String urgency,
            @RequestParam(required = false) String notes
    ) {

        try {
            Connection conn = DriverManager.getConnection(url, dbUser, dbPassword);

            String sql = "INSERT INTO blood_request " +
                    "(patient_name, blood_group, hospital, city, contact, units_required, urgency, notes) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, patientName);
            ps.setString(2, bloodGroup);
            ps.setString(3, hospital);
            ps.setString(4, city);
            ps.setString(5, contact);
            ps.setInt(6, unitsRequired);
            ps.setString(7, urgency);
            ps.setString(8, notes);

            ps.executeUpdate();

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/emergency_request";
    }
}