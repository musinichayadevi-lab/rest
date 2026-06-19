package com.example.project1.rest.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.example.project1.Entity.ContactUsEntity;
import com.example.project1.service.ContactUsService;

@RestController
public class ContactUsRestController {

    @Autowired
    private ContactUsService contactUsService;

    @GetMapping("/api/contactus")
    public ResponseEntity<List<ContactUsEntity>>
            getAllMessages() {

        List<ContactUsEntity> messages =
                contactUsService.getAllMessages();

        return ResponseEntity.ok(messages);
    }

    @PostMapping("/api/contactus")
    public ResponseEntity<ContactUsEntity>
            saveMessage(
            @RequestBody ContactUsEntity contactUsEntity) {

        ContactUsEntity savedMessage =
                contactUsService.saveMessage(
                        contactUsEntity);

        return ResponseEntity.ok(savedMessage);
    }
}