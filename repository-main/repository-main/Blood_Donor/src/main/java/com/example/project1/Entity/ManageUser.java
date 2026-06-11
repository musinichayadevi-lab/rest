package com.example.project1.Entity;

public class ManageUser {
	private int id;
    private String fullName;
    private String email;
    private String bloodGroup;
    private String city;
    private String status;

    // Default Constructor
    public ManageUser() {

    }

    // Parameterized Constructor
    public ManageUser(int id,
                      String fullName,
                      String email,
                      String bloodGroup,
                      String city,
                      String status) {

        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.bloodGroup = bloodGroup;
        this.city = city;
        this.status = status;
    }

    // GETTERS AND SETTERS

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


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
