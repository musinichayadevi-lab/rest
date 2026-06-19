package com.example.project1.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project1.Entity.UserEntity;
import com.example.project1.repository.UserRepository;

@Service
public class ProfileService {

    @Autowired
    private UserRepository userRepository;

    public Optional<UserEntity> getUserById(int id) {
        return userRepository.findById(id);
    }
}