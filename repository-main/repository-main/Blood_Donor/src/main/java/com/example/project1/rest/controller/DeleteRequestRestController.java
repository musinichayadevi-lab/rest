package com.example.project1.rest.controller;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.example.project1.service.BloodRequestService;

@RestController
public class DeleteRequestRestController {

    private final BloodRequestService bloodRequestService;

    public DeleteRequestRestController(
            BloodRequestService bloodRequestService) {

        this.bloodRequestService = bloodRequestService;
    }

    @DeleteMapping("/api/deleteRequest/{id}")
    public ResponseEntity<?> deleteRequest(
            @PathVariable("id") int id) {

        if (!bloodRequestService.existsById(id)) {

            return ResponseEntity.status(404)
                    .body(Map.of(
                            "success", false,
                            "message", "Blood Request Not Found"));
        }

        bloodRequestService.deleteRequest(id);

        return ResponseEntity.ok(
                Map.of(
                        "success", true,
                        "message", "Blood Request Deleted Successfully"));
    }
}