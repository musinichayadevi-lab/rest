package com.example.project1.rest.controller;

import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.example.project1.Entity.UserEntity;
import com.example.project1.service.UserService;

@RestController
public class ForgotPasswordRestController {

    @Autowired
    private UserService userService;

    @PostMapping("/api/verifyEmail")
    public ResponseEntity<?> verifyEmail(
            @RequestParam String email) {

        Optional<UserEntity> user =
                userService.findByEmail(email);

        if (user.isPresent()) {

            return ResponseEntity.ok(
                    Map.of(
                            "success", true,
                            "message", "Email found",
                            "email", email));
        }

        return ResponseEntity.status(404)
                .body(
                        Map.of(
                                "success", false,
                                "message", "Email not found"));
    }
}