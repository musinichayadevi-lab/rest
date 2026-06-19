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
public class UserDashboardController {

    private final String url =
            "jdbc:mysql://localhost:3306/blooddonation";

    private final String dbUser = "root";

    private final String dbPassword =
            "Lambodhara@999";

    @GetMapping("/userdashboard")
    public String showUserDashboard(Model model) {

        model.addAttribute(
                "bloodRequests",
                getBloodRequests());

        return "userdashboard";
    }

    private List<BloodRequest> getBloodRequests() {

        List<BloodRequest> requests =
                new ArrayList<>();

        try {

            Class.forName(
                    "com.mysql.cj.jdbc.Driver");

            Connection conn =
                    DriverManager.getConnection(
                            url,
                            dbUser,
                            dbPassword);

            String sql =
                    "SELECT * FROM blood_requests ORDER BY id DESC LIMIT 5";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                BloodRequest br =
                        new BloodRequest();

                br.setId(
                        rs.getInt("id"));

                br.setPatientName(
                        rs.getString("patient_name"));

                br.setBloodGroup(
                        rs.getString("blood_group"));

                br.setHospital(
                        rs.getString("hospital"));

                br.setCity(
                        rs.getString("city"));

                br.setContactNumber(
                        rs.getString("contact_number"));

                

                requests.add(br);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return requests;
    }
}