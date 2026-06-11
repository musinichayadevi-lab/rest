package com.example.project1.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Notifications {

@GetMapping("/notifications")
public String notifications() {
    return "notifications"; // notifications.jsp
}
}