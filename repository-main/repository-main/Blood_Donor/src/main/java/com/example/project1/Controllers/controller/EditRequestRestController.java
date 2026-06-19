package com.example.project1.rest.controller;


import java.util.Map;
import java.util.Optional;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.example.project1.Entity.BloodRequest;
import com.example.project1.service.BloodRequestService;

@RestController
public class EditRequestRestController {

    private final BloodRequestService bloodRequestService;

    public EditRequestRestController(
            BloodRequestService bloodRequestService) {

        this.bloodRequestService = bloodRequestService;
    }

    @GetMapping("/api/editRequest/{id}")
    public ResponseEntity<?> getRequest(
            @PathVariable int id) {

        Optional<BloodRequest> request =
                bloodRequestService.getRequestById(id);

        if (request.isEmpty()) {
            return ResponseEntity.status(404)
                    .body(Map.of(
                            "success", false,
                            "message", "Request Not Found"));
        }

        return ResponseEntity.ok(request.get());
    }

    @PutMapping("/api/editRequest/{id}")
    public ResponseEntity<?> updateRequest(
            @PathVariable int id,
            @RequestBody BloodRequest updatedRequest) {

        Optional<BloodRequest> existing =
                bloodRequestService.getRequestById(id);

        if (existing.isEmpty()) {
            return ResponseEntity.status(404)
                    .body(Map.of(
                            "success", false,
                            "message", "Request Not Found"));
        }

        updatedRequest.setId(id);

        BloodRequest saved =
                bloodRequestService.updateRequest(updatedRequest);

        return ResponseEntity.ok(saved);
    }
}
