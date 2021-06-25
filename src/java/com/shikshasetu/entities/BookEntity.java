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
public class BookEntity {
    private int id;
    private String title;
    private String desc;
    private String fileName;
    private int  userid;

    public BookEntity(int id, String title, String desc, String fileName, int userid) {
        this.id = id;
        this.title = title;
        this.desc = desc;
        this.fileName = fileName;
        this.userid = userid;
    }

    public BookEntity(String title, String desc, String fileName, int userid) {
        this.title = title;
        this.desc = desc;
        this.fileName = fileName;
        this.userid = userid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }
    
    
   
    
}
