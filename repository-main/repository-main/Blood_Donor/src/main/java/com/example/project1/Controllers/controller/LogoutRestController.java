package com.example.project1.rest.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.project1.service.LogoutService;

import jakarta.servlet.http.HttpSession;

@RestController
public class LogoutRestController {

    @Autowired
    private LogoutService logoutService;

    @PostMapping("/api/logout")
    public ResponseEntity<?> logout(
            HttpSession session) {

        logoutService.logout(session);

        return ResponseEntity.ok(
                Map.of(
                        "success", true,
                        "message", "Logged out successfully"));
    }
}