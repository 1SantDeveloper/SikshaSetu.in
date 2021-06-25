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
public class Category {
    private int userid;
    private String category;
    private String desc;

    public Category(int userid, String category, String desc) {
        this.userid = userid;
        this.category = category;
        this.desc = desc;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
    
    
    
    
}
