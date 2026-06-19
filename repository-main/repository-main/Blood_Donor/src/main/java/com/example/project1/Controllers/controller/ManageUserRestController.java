package com.example.project1.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.project1.Entity.ManageUser;
import com.example.project1.service.ManageUserService;

@RestController
public class ManageUserRestController {

    @Autowired
    private ManageUserService manageUserService;

    @GetMapping("/api/manageUsers")
    public ResponseEntity<List<ManageUser>> getAllUsers() {

        List<ManageUser> users =
                manageUserService.getAllUsers();

        return ResponseEntity.ok(users);
    }
}
