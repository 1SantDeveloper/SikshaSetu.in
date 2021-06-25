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
public class CourseEntity {
    private String coursename;
    private String shortname;
    private String puporse;
    private int userid;

    public CourseEntity(String coursename, String shortname, String puporse, int userid) {
        this.coursename = coursename;
        this.shortname = shortname;
        this.puporse = puporse;
        this.userid = userid;
    }

    public String getCoursename() {
        return coursename;
    }

    public void setCoursename(String coursename) {
        this.coursename = coursename;
    }

    public String getShortname() {
        return shortname;
    }

    public void setShortname(String shortname) {
        this.shortname = shortname;
    }

    public String getPuporse() {
        return puporse;
    }

    public void setPuporse(String puporse) {
        this.puporse = puporse;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }
    
    
}
