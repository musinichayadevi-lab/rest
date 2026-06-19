package com.example.project1.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.project1.Entity.BloodRequest;
import com.example.project1.service.BloodRequestService;

@RestController
public class RequestHistoryRestController {

    @Autowired
    private BloodRequestService bloodRequestService;

    @GetMapping("/api/requestHistory")
    public ResponseEntity<List<BloodRequest>> getRequestHistory() {

        List<BloodRequest> requests =
                bloodRequestService.getAllRequests();

        return ResponseEntity.ok(requests);
    }
}
