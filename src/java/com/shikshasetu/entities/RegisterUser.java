package com.shikshasetu.entities;

import java.sql.*;

public class RegisterUser {

    private int userId;
    private String userName;
    private String email;
    private String phoneNo;
    private String password;
    private Timestamp dateTime;
    private String profile;
    public boolean getPassword;

    public RegisterUser(String userName, String email, String phoneNo, String password) {
        this.userName = userName;
        this.email = email;
        this.phoneNo = phoneNo;
        this.password = password;
        // this.dateTime = dateTime;
       
    }

    public RegisterUser(String userName, String email, String phoneNo, String password, String profile) {
        this.userName = userName;
        this.email = email;
        this.phoneNo = phoneNo;
        this.password = password;
        this.profile = profile;
    }

    public RegisterUser() {
    }

    public RegisterUser(int userId, String userName, String email, String phoneNo, String password, Timestamp dateTime) {
        this.userId = userId;
        this.userName = userName;
        this.email = email;
        this.phoneNo = phoneNo;
        this.password = password;
        this.dateTime = dateTime;
    }

    // all getter setter method code
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }

    
}
