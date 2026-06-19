package com.example.project1.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.project1.service.UpdatePasswordService;

@Controller
public class UpdatePasswordController {

    @Autowired
    private UpdatePasswordService updatePasswordService;

    @PostMapping("/updatePassword")
    public String updatePassword(
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam String confirmPassword) {

        if (!password.equals(confirmPassword)) {
            return "reset_password";
        }

        boolean updated =
                updatePasswordService.updatePassword(
                        email,
                        password);

        if (!updated) {
            return "reset_password";
        }

        return "password_success";
    }
}