package com.example.project1.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminDashboardController {

    @GetMapping("/admin_dashboard")
    public String showAdminDashboard() {
        return "admin_dashboard";
    }

}