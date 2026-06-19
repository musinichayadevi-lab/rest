package com.example.project1.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project1.Entity.BloodRequest;
import com.example.project1.repository.BloodRequestRepository;

@Service
public class BloodRequestService {

    @Autowired
    private BloodRequestRepository bloodRequestRepository;

    public List<BloodRequest> getAllRequests() {
        return bloodRequestRepository.findAll();
    }

    public BloodRequest saveRequest(BloodRequest request) {
        return bloodRequestRepository.save(request);
    }

    public void deleteRequest(int id) {
        bloodRequestRepository.deleteById(id);
    }

    public boolean existsById(int id) {
        return bloodRequestRepository.existsById(id);
    }

    public BloodRequest updateRequest(BloodRequest request) {
        return bloodRequestRepository.save(request);
    }

	public Optional<BloodRequest> getRequestById(int id) {
		// TODO Auto-generated method stub
		return null;
	}
}