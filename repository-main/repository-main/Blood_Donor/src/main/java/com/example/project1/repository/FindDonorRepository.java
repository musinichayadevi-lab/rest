package com.example.project1.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.project1.Entity.FindDonor;

@Repository
public interface FindDonorRepository
        extends JpaRepository<FindDonor, Integer> {

    List<FindDonor> findByBloodGroup(String bloodGroup);

    List<FindDonor> findByCityContaining(String city);

    List<FindDonor> findByBloodGroupAndCityContaining(
            String bloodGroup,
            String city);
}