/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shikshasetu.entities;

/**
 *
 * @author SantDeveloper
 */
public class UniversityEntity {
    private int userid;
    private String uname;
    private String sname;
    private String desc;
    private String state;
    private String country;

    public UniversityEntity(int userid, String uname, String sname, String desc, String state, String country) {
        this.userid = userid;
        this.uname = uname;
        this.sname = sname;
        this.desc = desc;
        this.state = state;
        this.country = country;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
    
    
}
