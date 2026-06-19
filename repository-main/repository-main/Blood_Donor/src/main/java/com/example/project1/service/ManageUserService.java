package com.example.project1.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project1.Entity.ManageUser;
import com.example.project1.Entity.UserEntity;
import com.example.project1.repository.UserRepository;

@Service
public class ManageUserService {

    @Autowired
    private UserRepository userRepository;

    public List<ManageUser> getAllUsers() {

        List<ManageUser> users = new ArrayList<>();

        List<UserEntity> userList =
                userRepository.findAll();

        for (UserEntity user : userList) {

            ManageUser manageUser =
                    new ManageUser();

            manageUser.setId(user.getId());
            manageUser.setFullName(user.getFullName());
            manageUser.setEmail(user.getEmail());
            manageUser.setBloodGroup(user.getBloodGroup());
            manageUser.setCity(user.getCity());

            users.add(manageUser);
        }

        return users;
    }
}
