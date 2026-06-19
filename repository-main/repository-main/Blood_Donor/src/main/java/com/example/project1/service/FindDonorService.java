package com.example.project1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project1.Entity.FindDonor;
import com.example.project1.repository.FindDonorRepository;

@Service
public class FindDonorService {

    @Autowired
    private FindDonorRepository findDonorRepository;

    public List<FindDonor> findDonors(
            String bloodGroup,
            String city) {

        if (bloodGroup != null && !bloodGroup.isBlank()
                && city != null && !city.isBlank()) {

            return findDonorRepository
                    .findByBloodGroupAndCityContaining(
                            bloodGroup,
                            city);
        }

        if (bloodGroup != null && !bloodGroup.isBlank()) {
            return findDonorRepository
                    .findByBloodGroup(bloodGroup);
        }

        if (city != null && !city.isBlank()) {
            return findDonorRepository
                    .findByCityContaining(city);
        }

        return findDonorRepository.findAll();
    }

	public List<FindDonor> findDonors1(String bloodGroup, String city) {
		// TODO Auto-generated method stub
		return null;
	}
}