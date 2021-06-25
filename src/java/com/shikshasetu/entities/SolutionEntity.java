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
public class SolutionEntity {

    private int SolutionID;
    private String Stitle;
    private String preview;
    private String fileName;
    private String manuallytext;
    private int price;
    private int uid;
    private int qid;

    public SolutionEntity(String Stitle, String preview, String fileName, String manuallytext, int price, int uid, int qid) {
        this.Stitle = Stitle;
        this.preview = preview;
        this.fileName = fileName;
        this.manuallytext = manuallytext;
        this.price = price;
        this.uid = uid;
        this.qid = qid;
    }

    public SolutionEntity(int SolutionID, String Stitle, String preview, String fileName, String manuallytext, int price, int uid, int qid) {
        this.SolutionID = SolutionID;
        this.Stitle = Stitle;
        this.preview = preview;
        this.fileName = fileName;
        this.manuallytext = manuallytext;
        this.price = price;
        this.uid = uid;
        this.qid = qid;
    }

    public String getStitle() {
        return Stitle;
    }

    public void setStitle(String Stitle) {
        this.Stitle = Stitle;
    }

    public int getPrice() {
        return price;
    }

    public int getSolutionID() {
        return SolutionID;
    }

    public void setSolutionID(int SolutionID) {
        this.SolutionID = SolutionID;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getPreview() {
        return preview;
    }

    public void setPreview(String preview) {
        this.preview = preview;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getManuallytext() {
        return manuallytext;
    }

    public void setManuallytext(String manuallytext) {
        this.manuallytext = manuallytext;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getQid() {
        return qid;
    }

    public void setQid(int qid) {
        this.qid = qid;
    }

}
