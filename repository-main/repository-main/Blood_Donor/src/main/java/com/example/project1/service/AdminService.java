package com.example.project1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project1.Entity.AdminEntity;
import com.example.project1.repository.AdminRepository;

@Service
public class AdminService {

    @Autowired
    private AdminRepository adminRepository;

    public List<AdminEntity> getAllAdmins() {
        return adminRepository.findAll();
    }
}