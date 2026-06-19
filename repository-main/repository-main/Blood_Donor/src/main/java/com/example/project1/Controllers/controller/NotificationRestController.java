package com.example.project1.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.project1.Entity.NotificationEntity;
import com.example.project1.service.NotificationService;

@RestController
public class NotificationRestController {

    @Autowired
    private NotificationService notificationService;

    @GetMapping("/api/notifications")
    public ResponseEntity<List<NotificationEntity>> getNotifications() {

        return ResponseEntity.ok(
                notificationService.getAllNotifications());
    }
}