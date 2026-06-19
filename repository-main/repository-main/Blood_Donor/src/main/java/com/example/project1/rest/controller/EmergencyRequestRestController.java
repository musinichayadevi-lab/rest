package com.example.project1.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.example.project1.Entity.BloodRequest;
import com.example.project1.service.BloodRequestService;

@RestController
public class EmergencyRequestRestController {

    @Autowired
    private BloodRequestService bloodRequestService;

    @GetMapping("/api/emergency_request")
    public ResponseEntity<List<BloodRequest>> getEmergencyRequests() {

        List<BloodRequest> requests =
                bloodRequestService.getAllRequests();

        return ResponseEntity.ok(requests);
    }

    @PostMapping("/api/emergency_request")
    public ResponseEntity<BloodRequest> saveEmergencyRequest(
            @RequestBody BloodRequest request) {

        BloodRequest savedRequest =
                bloodRequestService.saveRequest(request);

        return ResponseEntity.ok(savedRequest);
    }
}