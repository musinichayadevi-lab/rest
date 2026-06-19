package com.example.project1.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project1.Entity.DonorEntity;
import com.example.project1.Entity.ManageDonor;
import com.example.project1.repository.DonorRepository;

@Service
public class ManageDonorService {

    @Autowired
    private DonorRepository donorRepository;

    public List<ManageDonor> getAllDonors() {

        List<ManageDonor> donors = new ArrayList<>();

        List<DonorEntity> donorList =
                donorRepository.findAll();

        for (DonorEntity donor : donorList) {

            ManageDonor manageDonor =
                    new ManageDonor();

            manageDonor.setId(donor.getId());

            if (donor.getUser() != null) {

                manageDonor.setFullName(
                        donor.getUser().getFullName());

                manageDonor.setEmail(
                        donor.getUser().getEmail());
            }

            manageDonor.setBloodGroup(
                    donor.getBloodGroup());

            manageDonor.setCity(
                    donor.getCity());

            manageDonor.setLastDonationDate(
                    donor.getLastDonationDate());

            manageDonor.setStatus(
                    donor.isAvailability()
                    ? "Active"
                    : "Blocked");

            donors.add(manageDonor);
        }

        return donors;
    }
}