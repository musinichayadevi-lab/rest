package com.example.project1.rest.controller;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RequestSuccessRestController {

    @GetMapping("/api/requestSuccess")
    public ResponseEntity<?> requestSuccess() {

        return ResponseEntity.ok(
                Map.of(
                        "success", true,
                        "message", "Blood request submitted successfully"));
    }
}