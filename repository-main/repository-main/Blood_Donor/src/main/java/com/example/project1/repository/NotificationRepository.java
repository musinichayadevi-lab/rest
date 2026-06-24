package com.example.project1.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.project1.Entity.Notification;

public interface NotificationRepository
        extends JpaRepository<Notification, Integer> {

}
