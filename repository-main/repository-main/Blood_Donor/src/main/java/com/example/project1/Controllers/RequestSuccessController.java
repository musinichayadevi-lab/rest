package com.example.project1.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RequestSuccessController {

    @GetMapping("/request_success")
    public String requestSuccess() {
        return "request_success";
    }
}