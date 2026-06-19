package com.example.project1.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.project1.Entity.NotificationEntity;

@Repository
public interface NotificationRepository
        extends JpaRepository<NotificationEntity, Integer> {

	List<NotificationEntity> findAll();

}
