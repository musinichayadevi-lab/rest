package com.example.project1.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.project1.Entity.FindDonor;
import com.example.project1.service.FindDonorService;

@RestController
public class FindDonorRestController {

    @Autowired
    private FindDonorService findDonorService;

    @GetMapping("/api/findDonors")
    public ResponseEntity<List<FindDonor>> findDonors(
            @RequestParam(required = false) String bloodGroup,
            @RequestParam(required = false) String city) {

        List<FindDonor> donors =
                findDonorService.findDonors(
                        bloodGroup,
                        city);

        return ResponseEntity.ok(donors);
    }
}
