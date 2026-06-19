package com.example.project1.service;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;

@Service
public class LogoutService {

    public void logout(HttpSession session) {
        session.invalidate();
    }
}