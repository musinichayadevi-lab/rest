package com.example.project1.Entity;

import java.sql.Date;
import java.sql.Timestamp;

public class BloodRequest {

    private int id;
    private String patientName;
    private String bloodGroup;
    private String hospital;
    private String city;
    private String contact;
    private int unitsRequired;
    private String urgency;
    private String notes;
    private String status;
    private Timestamp createdAt;

    // getters & setters

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getPatientName() { return patientName; }
    public void setPatientName(String patientName) { this.patientName = patientName; }

    public String getBloodGroup() { return bloodGroup; }
    public void setBloodGroup(String bloodGroup) { this.bloodGroup = bloodGroup; }

    public String getHospital() { return hospital; }
    public void setHospital(String hospital) { this.hospital = hospital; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getContact() { return contact; }
    public void setContact(String contact) { this.contact = contact; }

    public int getUnitsRequired() { return unitsRequired; }
    public void setUnitsRequired(int unitsRequired) { this.unitsRequired = unitsRequired; }

    public String getUrgency() { return urgency; }
    public void setUrgency(String urgency) { this.urgency = urgency; }

    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
	public void setRequestDate(Date date) {
		// TODO Auto-generated method stub
		
	}
}