package com.example.project1.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class LogoutController {

    @GetMapping("/logout")
    public String logout() {
        return "logout";
    }

@PostMapping("/logout")
public String logout(HttpSession session) {
    session.invalidate();
    return "redirect:/userlogin";
}
}