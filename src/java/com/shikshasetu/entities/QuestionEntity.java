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
public class QuestionEntity {

    private int questionid;
    private String subject;
    private String university;
    private String category;
    private String course;
    private int semester;
    private int year;
    private String fileName;
    private int userid;
    private String  link;

    public QuestionEntity(String subject, String university, String course, int semester, int year, String fileName, int userid) {
        this.subject = subject;
        this.university = university;
        this.course = course;
        this.semester = semester;
        this.year = year;
        this.fileName = fileName;
        this.userid = userid;
    }

    public QuestionEntity(int questionid, String subject, String university, String course, int semester, int year, String fileName, int userid) {
        this.questionid = questionid;
        this.subject = subject;
        this.university = university;
        this.course = course;
        this.semester = semester;
        this.year = year;
        this.fileName = fileName;
        this.userid = userid;
    }

    public QuestionEntity(int questionid) {
        this.questionid = questionid;
    }

    public QuestionEntity(String subject, String university, String course, int semester, int year, String fileName) {

        this.subject = subject;
        this.university = university;
        this.course = course;
        this.semester = semester;
        this.year = year;
        this.fileName = fileName;

    }

    public QuestionEntity(String subject, String university, String category, String course, int semester, int year, String fileName, int userid) {
        this.subject = subject;
        this.university = university;
        this.category = category;
        this.course = course;
        this.semester = semester;
        this.year = year;
        this.fileName = fileName;
        this.userid = userid;
    }

    public QuestionEntity(String subject, String university, String category, String course, int semester, int year, int userid, String link) {

        
            this.subject = subject;
            this.university = university;
            this.category = category;
            this.course = course;
            this.semester = semester;
            this.year = year;
//        this.fileName = fileName;
            this.userid = userid;
            this.link = link;
            
        }
    
//    new constructor for fetching all quetionpaper with link as welll
 public QuestionEntity(int questionid, String subject, String university, String course, int semester, int year, String fileName, int userid,String link) {
        this.questionid = questionid;
        this.subject = subject;
        this.university = university;
        this.course = course;
        this.semester = semester;
        this.year = year;
        this.fileName = fileName;
        this.userid = userid;
        this.link=link;
    }


//    end here 
    

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }



    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university = university;
    }

    public String getCourse() {
        return course;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public int getSemester() {
        return semester;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }

    public int getYear() {
        return year;
    }

    public int getQuestionid() {
        return questionid;
    }

    public void setQuestionid(int questionid) {
        this.questionid = questionid;
    }

    public void setYear(int year) {
        this.year = year;
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
