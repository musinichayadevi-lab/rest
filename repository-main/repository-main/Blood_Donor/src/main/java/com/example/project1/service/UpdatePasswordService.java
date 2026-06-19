package com.example.project1.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project1.Entity.UserEntity;
import com.example.project1.repository.UserRepository;

@Service
public class UpdatePasswordService {

    @Autowired
    private UserRepository userRepository;

    public boolean updatePassword(
            String email,
            String password) {

        Optional<UserEntity> user =
                userRepository.findByEmail(email);

        if (user.isPresent()) {

            UserEntity existingUser = user.get();

            existingUser.setPassword(password);

            userRepository.save(existingUser);

            return true;
        }

        return false;
    }
}