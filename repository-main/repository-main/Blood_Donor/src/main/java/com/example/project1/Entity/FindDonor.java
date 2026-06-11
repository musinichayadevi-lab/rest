package com.example.project1.Entity;

import java.sql.Date;

public class FindDonor {

    private int id;
    private String bloodGroup;
    private String city;
    private String phone;
    private boolean availability;
    private Date lastDonationDate;

    public FindDonor() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isAvailability() {
        return availability;
    }

    public void setAvailability(boolean availability) {
        this.availability = availability;
    }

    public Date getLastDonationDate() {
        return lastDonationDate;
    }

    public void setLastDonationDate(Date lastDonationDate) {
        this.lastDonationDate = lastDonationDate;
    }
}