package com.example.project1.Entity;

import java.sql.Date;

public class ManageDonor {
	 private int id;
	    private String fullName;
	    private String email;
	    private String bloodGroup;
	    private String city;
	    private int donations;
	    private Date lastDonationDate;
	    private String status;

	    public ManageDonor() {

	    }

	    public int getId() {
	        return id;
	    }

	    public void setId(int id) {
	        this.id = id;
	    }

	    public String getFullName() {
	        return fullName;
	    }

	    public void setFullName(String fullName) {
	        this.fullName = fullName;
	    }

	    public String getEmail() {
	        return email;
	    }

	    public void setEmail(String email) {
	        this.email = email;
	    }

	    public String getBloodGroup() {
	        return bloodGroup;
	    }

	    public void setBloodGroup(String bloodGroup) {
	        this.bloodGroup = bloodGroup;
	    }

	    public String getCity() {
	        return city;
	    }

	    public void setCity(String city) {
	        this.city = city;
	    }

	    public int getDonations() {
	        return donations;
	    }

	    public void setDonations(int donations) {
	        this.donations = donations;
	    }

	    public Date getLastDonationDate() {
	        return lastDonationDate;
	    }

	    public void setLastDonationDate(Date lastDonationDate) {
	        this.lastDonationDate = lastDonationDate;
	    }

	    public String getStatus() {
	        return status;
	    }

	    public void setStatus(String status) {
	        this.status = status;
	    }
}
