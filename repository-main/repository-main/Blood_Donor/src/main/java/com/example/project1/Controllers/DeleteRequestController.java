package com.example.project1.Controllers;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DeleteRequestController {

    private final String url =
            "jdbc:mysql://localhost:3306/blooddonation";

    private final String dbUser = "root";

    private final String dbPassword = "Lambodhara@999";

    @GetMapping("/deleteRequest")
    public String deleteRequest(
            @RequestParam("id") int id) {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn =
                    DriverManager.getConnection(
                            url,
                            dbUser,
                            dbPassword);

            PreparedStatement ps =
                    conn.prepareStatement(
                            "DELETE FROM blood_requests WHERE id=?");

            ps.setInt(1, id);

            ps.executeUpdate();

            conn.close();

        } catch(Exception e) {
            e.printStackTrace();
        }

        return "redirect:/requestHistory";
    }
}
