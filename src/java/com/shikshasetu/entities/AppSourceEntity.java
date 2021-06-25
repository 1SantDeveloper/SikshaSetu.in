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
public class AppSourceEntity {
    private int appid;
    private String title;
    private String fimage;
    private String fileName;
    private String appdetai;
   private String appsourceName;
   private String appsourcedetail;
   private int uid;

    public AppSourceEntity(String title, String fimage, String fileName, String appdetai, String appsourceName, String appsourcedetail, int uid) {
        this.title = title;
        this.fimage = fimage;
        this.fileName = fileName;
        this.appdetai = appdetai;
        this.appsourceName = appsourceName;
        this.appsourcedetail = appsourcedetail;
        this.uid = uid;
    }

    public AppSourceEntity(int appid, String title, String fimage, String fileName, String appdetai, String appsourceName, String appsourcedetail, int uid) {
        this.appid = appid;
        this.title = title;
        this.fimage = fimage;
        this.fileName = fileName;
        this.appdetai = appdetai;
        this.appsourceName = appsourceName;
        this.appsourcedetail = appsourcedetail;
        this.uid = uid;
    }
    

    public int getAppid() {
        return appid;
    }

    public void setAppid(int appid) {
        this.appid = appid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFimage() {
        return fimage;
    }

    public void setFimage(String fimage) {
        this.fimage = fimage;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getAppdetai() {
        return appdetai;
    }

    public void setAppdetai(String appdetai) {
        this.appdetai = appdetai;
    }

    public String getAppsourceName() {
        return appsourceName;
    }

    public void setAppsourceName(String appsourceName) {
        this.appsourceName = appsourceName;
    }

    public String getAppsourcedetail() {
        return appsourcedetail;
    }

    public void setAppsourcedetail(String appsourcedetail) {
        this.appsourcedetail = appsourcedetail;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }
   
    
}
