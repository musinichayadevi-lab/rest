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

import com.example.project1.Entity.ManageUser;

@Controller
public class ManageUsersController {

    private final String url = "jdbc:mysql://localhost:3306/blood_donation";
    private final String dbUser = "root";
    private final String dbPassword = "root";

    @GetMapping("/manageUsers")
    public String manageUsers(Model model) {

        List<ManageUser> users = getAllUsers();

        model.addAttribute("users", users);

        return "manage_users";
    }

    private List<ManageUser> getAllUsers() {

        List<ManageUser> users = new ArrayList<>();

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn =
                    DriverManager.getConnection(
                            url,
                            dbUser,
                            dbPassword);

            String sql =
                    "SELECT id, name, email, blood_group, city FROM users";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                ManageUser user = new ManageUser();

                user.setId(rs.getInt("id"));
                user.setFullName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setBloodGroup(rs.getString("blood_group"));
                user.setCity(rs.getString("city"));

                users.add(user);
            }

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }
}