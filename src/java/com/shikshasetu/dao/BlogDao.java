package com.shikshasetu.dao;

import com.shikshasetu.entities.BlogEntity;
import com.shikshasetu.helper.ConnectionProvider;
import java.sql.*;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author SantDeveloper
 */
public class BlogDao {

    private Connection con;

    public BlogDao(Connection con) {
        this.con = con;
    }

    public Boolean saveBlog(BlogEntity BE) {
        String q = "insert into blogtable (UID,PTitle,PDescription,PImage,PDetailDescription,category) values(?,?,?,?,?,?)";
        Boolean r = false;
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);

            pmst.setInt(1, BE.getUserId());
//            pmst.setString(1,BE.getUserName());
//            pmst.setString(2,BE.getUseremail());
//            pmst.setInt(1,BE.getBlogId());
            pmst.setString(2, BE.getTitle());
            pmst.setString(3, BE.getDiscription());
            pmst.setString(4, BE.getImg());
            pmst.setString(5, BE.getDetailDescription());
            pmst.setString(6,BE.getCategory());
            pmst.executeUpdate();
            r = true;

//            ConnectionProvider.closeConnection(this.con);
            ConnectionProvider.closeStatement(pmst);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return r;
    }

    public Boolean deleteBlog(int pid) {
        Boolean r = false;
        try {

            String q = "delete from blogtable where PID =?";
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setInt(1, pid);
            int rr = pmst.executeUpdate();
            if (rr > 0) {
                r = true;
            }
            ConnectionProvider.closeStatement(pmst);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return r;
    }

    public Boolean editBlog(BlogEntity BE, int pid) {

        String q = "update blogtable set PTitle =?,PDescription=?,Pimage=?,PDetailDescription=? WHERE PID = ?";
        Boolean r = false;
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);

//            pmst.setString(1,BE.getUserName());
//            pmst.setString(2,BE.getUseremail());
//            pmst.setInt(1,BE.getBlogId());
            pmst.setString(1, BE.getTitle());
            pmst.setString(2, BE.getDiscription());
            pmst.setString(3, BE.getImg());
            pmst.setString(4, BE.getDetailDescription());
            pmst.setInt(5, pid);
            int rr = pmst.executeUpdate();
            if (rr >0) {
//            pmst.executeUpdate();
            r = true;
            }
            ConnectionProvider.closeStatement(pmst);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return r;
    }

    public BlogEntity getBlogByID(String pid) {
        BlogEntity BlogObject = null;
        String q = "select * from blogtable where PTitle=?";
        try {
            PreparedStatement pmst = con.prepareStatement(q);
            pmst.setString(1, pid);
            ResultSet RS = pmst.executeQuery();
            if (RS.next()) {
                BlogObject = new BlogEntity(RS.getInt("UID"), RS.getInt("PID"), RS.getString("PTitle"), RS.getString("PDescription"), RS.getString("PImage"), RS.getString("PDetailDescription"), RS.getTimestamp("PDate"));
            }
            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(RS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return BlogObject;
    }

    public List<BlogEntity> getAllBlogPost() {
        List<BlogEntity> bloglist = new ArrayList<BlogEntity>();
        String q = "select * from blogtable order by PID desc";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            ResultSet RS = pmst.executeQuery();
            while (RS.next()) {

                BlogEntity BlogObject = new BlogEntity(RS.getInt("UID"), RS.getInt("PID"), RS.getString("PTitle"), RS.getString("PDescription"), RS.getString("PImage"), RS.getString("PDetailDescription"), RS.getTimestamp("PDate"));
                bloglist.add(BlogObject);
            }
            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(RS);
//            this.con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return bloglist;
    }

    public List<BlogEntity> getSearchBlogPost(String s) {
        String search = "%" + s + "%";
        List<BlogEntity> bloglist = new ArrayList<BlogEntity>();
        String q = "select * from blogtable where PTitle like ? or PDescription like ? or PDetailDescription like ?";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setString(1, search);
            pmst.setString(2, search);
            pmst.setString(3, search);
            ResultSet RS = pmst.executeQuery();
            while (RS.next()) {

                BlogEntity BlogObject = new BlogEntity(RS.getInt("UID"), RS.getInt("PID"), RS.getString("PTitle"), RS.getString("PDescription"), RS.getString("PImage"), RS.getString("PDetailDescription"), RS.getTimestamp("PDate"));
                bloglist.add(BlogObject);
            }
            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(RS);
//            this.con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return bloglist;
    }
    
    public List<BlogEntity> getBlogByCategory(String c) {
        String search = "%" + c + "%";
        List<BlogEntity> bloglist = new ArrayList<BlogEntity>();
        String q = "select * from blogtable where category like ? order by PID desc";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setString(1, search);
            ResultSet RS = pmst.executeQuery();
            while (RS.next()) {

                BlogEntity BlogObject = new BlogEntity(RS.getInt("UID"), RS.getInt("PID"), RS.getString("PTitle"), RS.getString("PDescription"), RS.getString("PImage"), RS.getString("PDetailDescription"), RS.getTimestamp("PDate"),RS.getString("category"));
                bloglist.add(BlogObject);
            }
            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(RS);
//            this.con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return bloglist;
    }
    
    
    public BlogEntity getBlogByID(int pid) {
        BlogEntity BlogObject = null;
        String q = "select * from blogtable where PID=?";
        try {
            PreparedStatement pmst = con.prepareStatement(q);
            pmst.setInt(1, pid);
            ResultSet RS = pmst.executeQuery();
            if (RS.next()) {
                BlogObject = new BlogEntity(RS.getInt("UID"), RS.getInt("PID"), RS.getString("PTitle"), RS.getString("PDescription"), RS.getString("PImage"), RS.getString("PDetailDescription"), RS.getTimestamp("PDate"));
            }
            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(RS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return BlogObject;
    }

    
     public List<BlogEntity> getAllBlogPostbyUserID(int uid) {
        List<BlogEntity> bloglist = new ArrayList<BlogEntity>();
           String q = "select * from blogtable where UID=?";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
             pmst.setInt(1, uid);
            ResultSet RS = pmst.executeQuery();
            while (RS.next()) {

                BlogEntity BlogObject = new BlogEntity(RS.getInt("UID"), RS.getInt("PID"), RS.getString("PTitle"), RS.getString("PDescription"), RS.getString("PImage"), RS.getString("PDetailDescription"), RS.getTimestamp("PDate"));
                bloglist.add(BlogObject);
            }
            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(RS);
//            this.con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return bloglist;
    }


}
