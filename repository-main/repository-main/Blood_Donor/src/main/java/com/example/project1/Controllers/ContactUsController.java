package com.example.project1.Controllers;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ContactUsController {

    @GetMapping("/contactUs")
    public String contactUsPage() {
        return "contact";
    }

    @PostMapping("/contactUs")
    public String submitContactForm(
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam String subject,
            @RequestParam String message) {

        System.out.println("Name: " + name);
        System.out.println("Email: " + email);
        System.out.println("Subject: " + subject);
        System.out.println("Message: " + message);

        return "contact_success";
    }
}
