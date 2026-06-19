package com.example.project1.Controllers;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ForgotPasswordController {

    String url="jdbc:mysql://localhost:3306/blooddonation";
    String user="root";
    String password="Lambodhara@999";
    
    @GetMapping("/forgotPassword")
    public String forgotPassword() {
        return "forgot_password";
    }
    @PostMapping("/verifyEmail")
    public String verifyEmail(
            @RequestParam String email,
            Model model) {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con=
                    DriverManager.getConnection(
                            url,user,password);

            PreparedStatement ps=
                    con.prepareStatement(
                            "select * from users where email=?");

            ps.setString(1,email);

            ResultSet rs=ps.executeQuery();

            if(rs.next()) {

                model.addAttribute("email",email);

                return "reset_password";
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return "forgot_password";
    }
}