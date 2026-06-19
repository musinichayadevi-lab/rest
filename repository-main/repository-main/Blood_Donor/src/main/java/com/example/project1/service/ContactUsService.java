package com.example.project1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project1.Entity.ContactUsEntity;
import com.example.project1.repository.ContactUsRepository;

@Service
public class ContactUsService {

    @Autowired
    private ContactUsRepository contactUsRepository;

    public List<ContactUsEntity> getAllMessages() {
        return contactUsRepository.findAll();
    }

    public ContactUsEntity saveMessage(
            ContactUsEntity contactUsEntity) {

        return contactUsRepository.save(contactUsEntity);
    }
}
