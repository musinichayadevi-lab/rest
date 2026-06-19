package com.example.project1.rest.controller;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.project1.Entity.UserEntity;

import jakarta.servlet.http.HttpSession;

@RestController
public class UserDashboardRestController {

    @GetMapping("/api/userdashboard")
    public ResponseEntity<?> getDashboard(HttpSession session) {

        UserEntity user =
                (UserEntity) session.getAttribute("loggedInUser");

        if (user == null) {
            return ResponseEntity.status(401)
                    .body(Map.of(
                            "success", false,
                            "message", "User not logged in"));
        }

        return ResponseEntity.ok(user);
    }
}