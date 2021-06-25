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
public class SourceCodeEntity {
    private int sid;
    private String stitle;
    private int sprice;
    private String sfile;
    private String smanually;
    private int sappid;
    private int suid;

    public SourceCodeEntity(int sid, String stitle, int sprice, String sfile, String smanually, int sappid, int suid) {
        this.sid = sid;
        this.stitle = stitle;
        this.sprice = sprice;
        this.sfile = sfile;
        this.smanually = smanually;
        this.sappid = sappid;
        this.suid = suid;
    }

    public SourceCodeEntity(String stitle, int sprice, String sfile, String smanually, int sappid, int suid) {
        this.stitle = stitle;
        this.sprice = sprice;
        this.sfile = sfile;
        this.smanually = smanually;
        this.sappid = sappid;
        this.suid = suid;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getStitle() {
        return stitle;
    }

    public void setStitle(String stitle) {
        this.stitle = stitle;
    }

    public int getSprice() {
        return sprice;
    }

    public void setSprice(int sprice) {
        this.sprice = sprice;
    }

    public String getSfile() {
        return sfile;
    }

    public void setSfile(String sfile) {
        this.sfile = sfile;
    }

    public String getSmanually() {
        return smanually;
    }

    public void setSmanually(String smanually) {
        this.smanually = smanually;
    }

    public int getSappid() {
        return sappid;
    }

    public void setSappid(int sappid) {
        this.sappid = sappid;
    }

    public int getSuid() {
        return suid;
    }

    public void setSuid(int suid) {
        this.suid = suid;
    }
    
    
}
