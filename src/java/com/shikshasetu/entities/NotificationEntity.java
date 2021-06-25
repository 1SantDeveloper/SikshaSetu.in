/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shikshasetu.entities;

import java.sql.SQLXML;
import java.sql.Timestamp;

/**
 *
 * @author SantDeveloper
 */
public class NotificationEntity {
    private int nid;
    private String ntitle;
    private String ndesc;
    private String nfor;
    private String nfrom;
    private String attachname;
    private int userid;
    private Timestamp date;
    private String category;

    public NotificationEntity(int nid, String ntitle, String ndesc, String nfor, String nfrom, String attachname, int userid) {
        this.nid = nid;
        this.ntitle = ntitle;
        this.ndesc = ndesc;
        this.nfor = nfor;
        this.nfrom = nfrom;
        this.attachname = attachname;
        this.userid = userid;
    }

    public NotificationEntity(String ntitle, String ndesc, String nfor, String nfrom, String attachname, int userid) {
        this.ntitle = ntitle;
        this.ndesc = ndesc;
        this.nfor = nfor;
        this.nfrom = nfrom;
        this.attachname = attachname;
        this.userid = userid;
        
    }
    public NotificationEntity(String ntitle, String ndesc, String nfor, String nfrom, String attachname, int userid,String category) {
        this.ntitle = ntitle;
        this.ndesc = ndesc;
        this.nfor = nfor;
        this.nfrom = nfrom;
        this.attachname = attachname;
        this.userid = userid;
        this.category=category;
    }

    public NotificationEntity(int nid, String ntitle, String ndesc, String nfor, String nfrom, String attachname, int userid, Timestamp date) {
        this.nid = nid;
        this.ntitle = ntitle;
        this.ndesc = ndesc;
        this.nfor = nfor;
        this.nfrom = nfrom;
        this.attachname = attachname;
        this.userid = userid;
        this.date = date;
    }
    public NotificationEntity(int nid, String ntitle, String ndesc, String nfor, String nfrom, String attachname, int userid, Timestamp date,String category) {
        this.nid = nid;
        this.ntitle = ntitle;
        this.ndesc = ndesc;
        this.nfor = nfor;
        this.nfrom = nfrom;
        this.attachname = attachname;
        this.userid = userid;
        this.date = date;
        this.category=category;
    }

   

    
    public int getNid() {
        return nid;
    }

    public void setNid(int nid) {
        this.nid = nid;
    }

    public String getNtitle() {
        return ntitle;
    }

    public void setNtitle(String ntitle) {
        this.ntitle = ntitle;
    }

    public String getNdesc() {
        return ndesc;
    }

    public void setNdesc(String ndesc) {
        this.ndesc = ndesc;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public String getNfor() {
        return nfor;
    }

    public void setNfor(String nfor) {
        this.nfor = nfor;
    }

    public String getNfrom() {
        return nfrom;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setNfrom(String nfrom) {
        this.nfrom = nfrom;
    }

    public String getAttachname() {
        return attachname;
    }

    public void setAttachname(String attachname) {
        this.attachname = attachname;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }
    
    
    
    
}
