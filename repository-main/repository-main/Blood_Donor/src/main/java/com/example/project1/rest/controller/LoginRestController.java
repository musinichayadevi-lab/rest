package com.example.project1.rest.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.example.project1.Entity.UserEntity;
import com.example.project1.service.UserService;

import jakarta.servlet.http.HttpSession;


@RestController
@RequestMapping("/api")
public class LoginRestController {


    @Autowired
    private UserService userService;


    @PostMapping("/login")
    public ResponseEntity<?> loginUser(

            @RequestParam String email,
            @RequestParam String password,
            @RequestParam String role,
            HttpSession session) {


        Optional<UserEntity> userOptional =
                userService.loginUser(email, password, role);


        if (userOptional.isPresent()) {


            UserEntity user = userOptional.get();


            session.setAttribute("name",
                    user.getFullName());

            session.setAttribute("bloodGroup",
                    user.getBloodGroup());

            session.setAttribute("email",
                    user.getEmail());

            session.setAttribute("role",
                    user.getRole());

            session.setAttribute("loggedInUser",
                    user);



            Map<String, Object> response =
                    new HashMap<>();

            response.put("success", true);
            response.put("message", "Login Successful");
            response.put("user", user);


            if ("ADMIN".equalsIgnoreCase(user.getRole())) {

                response.put("redirect",
                        "/admin_dashboard");

            } else {

                response.put("redirect",
                        "/userdashboard");
            }


            return ResponseEntity.ok(response);
        }



        return ResponseEntity
                .status(401)
                .body(
                    Map.of(
                    "success", false,
                    "message",
                    "Invalid Email, Password or Role"
                    )
                );
    }




    @GetMapping("/me")
    public ResponseEntity<?> getCurrentUser(
            HttpSession session) {


        UserEntity user =
                (UserEntity)
                session.getAttribute("loggedInUser");


        if(user != null) {

            return ResponseEntity.ok(user);

        }


        return ResponseEntity
                .status(401)
                .body(
                    Map.of(
                    "message",
                    "User not logged in"
                    )
                );
    }

}