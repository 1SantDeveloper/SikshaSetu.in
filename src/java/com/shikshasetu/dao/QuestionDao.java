/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shikshasetu.dao;

import com.shikshasetu.entities.QuestionEntity;
import com.shikshasetu.helper.ConnectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author SantDeveloper
 */
public class QuestionDao {

    private Connection con;

    public QuestionDao(Connection con) {
        this.con = con;
    }

    public Boolean saveQuestion(QuestionEntity QE) {
        Boolean r = false;
        String q = "insert into questionpaper (subject,university,course,semester,year,filename,userid,category)values (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);

            pmst.setString(1, QE.getSubject());
            pmst.setString(2, QE.getUniversity());
            pmst.setString(3, QE.getCourse());
            pmst.setInt(4, QE.getSemester());
            pmst.setInt(5, QE.getYear());
            pmst.setString(6, QE.getFileName());
            pmst.setInt(7, QE.getUserid());
            pmst.setString(8, QE.getCategory());
            pmst.executeUpdate();
            r = true;
            ConnectionProvider.closeStatement(pmst);
//            ConnectionProvider.closeResultSet(RS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return r;
    }
    
    
//    save question paper with ink new overwrite funtction
public Boolean saveQuestion(QuestionEntity QE,int a) {
        Boolean r = false;
        String q = "insert into questionpaper (subject,university,course,semester,year,filename,userid,category,link)values (?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);

            pmst.setString(1, QE.getSubject());
            pmst.setString(2, QE.getUniversity());
            pmst.setString(3, QE.getCourse());
            pmst.setInt(4, QE.getSemester());
            pmst.setInt(5, QE.getYear());
            pmst.setString(6, QE.getFileName());
            pmst.setInt(7, QE.getUserid());
            pmst.setString(8, QE.getCategory());
            pmst.setString(9,QE.getLink());
            pmst.executeUpdate();
            r = true;
            ConnectionProvider.closeStatement(pmst);
//            ConnectionProvider.closeResultSet(RS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return r;
    }

    
    
    
    
//    end here ink paper fucntin
    public List<QuestionEntity> getQuestionDetailByUserID(int userid) {
        List<QuestionEntity> QEL = new ArrayList<QuestionEntity>();
        String q = "select * from  questionpaper where userid=?";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setInt(1, userid);
            ResultSet rs = pmst.executeQuery();
            while (rs.next()) {
                QuestionEntity QE = new QuestionEntity(rs.getInt("QuestionID"), rs.getString("subject"), rs.getString("university"), rs.getString("course"), rs.getInt("semester"), rs.getInt("year"), rs.getString("filename"), rs.getInt("userid"));
                QEL.add(QE);

            }
            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(rs);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return QEL;
    }

    public QuestionEntity getQuestionDetailByQuestionID(int id) {
        QuestionEntity Qe = null;
        String q = "select * from  questionpaper where QuestionID=?";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setInt(1, id);
            ResultSet rs = pmst.executeQuery();
            if (rs.next()) {
                Qe = new QuestionEntity(rs.getInt("QuestionID"), rs.getString("subject"), rs.getString("university"), rs.getString("course"), rs.getInt("semester"), rs.getInt("year"), rs.getString("filename"), rs.getInt("userid"));

            }
            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(rs);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Qe;
    }

    public Boolean updateQuestion(QuestionEntity QE, int qid) {
        Boolean r = false;
        String q = "update questionpaper set subject=?,university=?,course=?,semester=?,year=?,filename=? where QuestionID=?";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setString(1, QE.getSubject());
            pmst.setString(2, QE.getUniversity());
            pmst.setString(3, QE.getCourse());
            pmst.setInt(4, QE.getSemester());
            pmst.setInt(5, QE.getYear());
            pmst.setString(6, QE.getFileName());
            pmst.setInt(7, qid);
            pmst.executeUpdate();
            r = true;
            ConnectionProvider.closeStatement(pmst);
//            ConnectionProvider.closeResultSet(RS);
        } catch (Exception e) {

            e.printStackTrace();
        }
        return r;
    }

    public List<QuestionEntity> getAllQuestionDetail() {
        List<QuestionEntity> QEL = new ArrayList<>();
        String q = "select * from  questionpaper order by QuestionID desc";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);

            ResultSet rs = pmst.executeQuery();
            while (rs.next()) {
                QuestionEntity QE = new QuestionEntity(rs.getInt("QuestionID"), rs.getString("subject"), rs.getString("university"), rs.getString("course"), rs.getInt("semester"), rs.getInt("year"), rs.getString("filename"), rs.getInt("userid"),rs.getString("link"));
                QEL.add(QE);
            }
            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(rs);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return QEL;
    }
    
    public List<QuestionEntity> getAllQuestionDetail(String category) {
        String s="%"+category+"%";
        List<QuestionEntity> QEL = new ArrayList<>();
        String q = "select * from  questionpaper  where category=? order by QuestionID desc";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setString(1, category);

            ResultSet rs = pmst.executeQuery();
            while (rs.next()) {
                QuestionEntity QE = new QuestionEntity(rs.getInt("QuestionID"), rs.getString("subject"), rs.getString("university"), rs.getString("course"), rs.getInt("semester"), rs.getInt("year"), rs.getString("filename"), rs.getInt("userid"),rs.getString("link"));
               
                QEL.add(QE);
            }
            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(rs);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return QEL;
    }
    
     public List<QuestionEntity> getAllQuestionDetailWithCategory() {
        List<QuestionEntity> QEL = new ArrayList<>();
        String q = "select * from  questionpaper ";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);

            ResultSet rs = pmst.executeQuery();
            while (rs.next()) {
                QuestionEntity QE = new QuestionEntity(rs.getInt("QuestionID"), rs.getString("subject"), rs.getString("university"), rs.getString("course"), rs.getInt("semester"), rs.getInt("year"), rs.getString("filename"), rs.getInt("userid"),rs.getString("link"));
               
                QEL.add(QE);
            }
            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(rs);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return QEL;
    }

    
    
    
    

    public List<QuestionEntity> getSearchQuestionPaper(String s) {
        String search = "%" + s + "%";
        List<QuestionEntity> QEL = new ArrayList<>();

        String q = "select * from questionpaper where subject like ? or university like ? or course like ?";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setString(1, search);
            pmst.setString(2, search);
            pmst.setString(3, search);
            ResultSet rs = pmst.executeQuery();

            while (rs.next()) {
                 QuestionEntity QE = new QuestionEntity(rs.getInt("QuestionID"), rs.getString("subject"), rs.getString("university"), rs.getString("course"), rs.getInt("semester"), rs.getInt("year"), rs.getString("filename"), rs.getInt("userid"),rs.getString("link"));
               
                QEL.add(QE);
            }
            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(rs);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return QEL;

    }
    public List<QuestionEntity> getSearchQuestionPaperwithCustomQuery(String university,String cource,String category,String subject) {
          
        System.out.println(university+cource+category+subject);
        university="%"+university+"%";
           cource="%"+cource+"%";
           category="%"+category+"%";
           subject="%"+subject+"%";
            System.out.println(university+cource+category+subject);
        List<QuestionEntity> QEL = new ArrayList<>();

         
        String q = "select * from questionpaper where subject like ? and university like ? and course like ? and category like ?";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setString(1, subject);
            pmst.setString(2, university);
            pmst.setString(3, cource);
            pmst.setString(4, category);
            ResultSet rs = pmst.executeQuery();

            while (rs.next()) {
                 QuestionEntity QE = new QuestionEntity(rs.getInt("QuestionID"), rs.getString("subject"), rs.getString("university"), rs.getString("course"), rs.getInt("semester"), rs.getInt("year"), rs.getString("filename"), rs.getInt("userid"),rs.getString("link"));
               
                QEL.add(QE);
            }
            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(rs);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return QEL;

    }

}
