package com.example.project1.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserDashboardController {

    @GetMapping("/userdashboard")
    public String showUserDashboard() {
        return "userdashboard";
    }

}