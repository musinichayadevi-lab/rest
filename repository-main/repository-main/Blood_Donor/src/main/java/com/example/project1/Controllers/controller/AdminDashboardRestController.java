package com.example.project1.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.project1.Entity.AdminEntity;
import com.example.project1.service.AdminService;

@RestController
public class AdminDashboardRestController {

    @Autowired
    private AdminService adminService;

    @GetMapping("/api/admindashboard")
    public ResponseEntity<List<AdminEntity>> getDashboardData() {

        List<AdminEntity> admins = adminService.getAllAdmins();

        return ResponseEntity.ok(admins);
    }
}