package com.example.project1.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.project1.Entity.BloodRequest;

@Repository
public interface BloodRequestRepository
        extends JpaRepository<BloodRequest, Integer> {

    List<BloodRequest> findTop5ByOrderByIdDesc();
}