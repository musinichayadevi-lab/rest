package com.example.project1.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.example.project1.Entity.BloodRequest;
import com.example.project1.service.BloodRequestService;

@RestController
public class BloodRequestRestController {

    @Autowired
    private BloodRequestService bloodRequestService;

    @GetMapping("/api/bloodrequests")
    public ResponseEntity<List<BloodRequest>> getAllRequests() {

        List<BloodRequest> requests =
                bloodRequestService.getAllRequests();

        return ResponseEntity.ok(requests);
    }

    @PostMapping("/api/saveBloodRequest")
    public ResponseEntity<BloodRequest> saveBloodRequest(
            @RequestBody BloodRequest request) {

        BloodRequest savedRequest =
                bloodRequestService.saveRequest(request);

        return ResponseEntity.ok(savedRequest);
    }
}