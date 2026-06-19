package com.example.project1.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.project1.Entity.ManageDonor;
import com.example.project1.service.ManageDonorService;

@RestController
public class ManageDonorRestController {

    @Autowired
    private ManageDonorService manageDonorService;

    @GetMapping("/api/manageDonors")
    public ResponseEntity<List<ManageDonor>> getAllDonors() {

        return ResponseEntity.ok(
                manageDonorService.getAllDonors());
    }
}