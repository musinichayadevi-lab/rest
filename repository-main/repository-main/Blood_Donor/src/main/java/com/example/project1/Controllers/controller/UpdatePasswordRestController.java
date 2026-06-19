package com.example.project1.rest.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.project1.service.UpdatePasswordService;

@RestController
public class UpdatePasswordRestController {

    @Autowired
    private UpdatePasswordService updatePasswordService;

    @PostMapping("/api/updatePassword")
    public ResponseEntity<?> updatePassword(
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam String confirmPassword) {

        if (!password.equals(confirmPassword)) {

            return ResponseEntity.badRequest()
                    .body(Map.of(
                            "success", false,
                            "message", "Passwords do not match"));
        }

        boolean updated =
                updatePasswordService.updatePassword(
                        email,
                        password);

        if (!updated) {

            return ResponseEntity.badRequest()
                    .body(Map.of(
                            "success", false,
                            "message", "User not found"));
        }

        return ResponseEntity.ok(
                Map.of(
                        "success", true,
                        "message", "Password updated successfully"));
    }
}