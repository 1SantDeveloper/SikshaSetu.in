/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shikshasetu.dao;

import com.shikshasetu.entities.BookEntity;
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
public class BookDao {

    private Connection con;

    public BookDao(Connection con) {
        this.con = con;
    }

    public Boolean saveBook(BookEntity BE) {
        Boolean r = false;
        String q = "insert into booktable (Btitle,Bdesc,Bname,Buser) values (?,?,?,?)";
        try {

            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setString(1, BE.getTitle());
            pmst.setString(2, BE.getDesc());
            pmst.setString(3, BE.getFileName());
            pmst.setInt(4, BE.getUserid());
            pmst.executeUpdate();
            r = true;
            ConnectionProvider.closeStatement(pmst);
//            ConnectionProvider.closeResultSet(RS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return r;
    }

    public List<BookEntity> getBookDetailByUserID(int id) {
        List<BookEntity> BEL = new ArrayList();
        String q = "select * from booktable where Buser=?";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setInt(1, id);

            ResultSet rs = pmst.executeQuery();
            while (rs.next()) {
                BookEntity BE = new BookEntity(rs.getInt("Bid"), rs.getString("Btitle"), rs.getString("Bdesc"), rs.getString("Bname"), rs.getInt("Buser"));
                BEL.add(BE);
            }

            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(rs);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return BEL;
    }

    public List<BookEntity> getBookDetailBySearch(String search) {
        String s = "%" + search + "%";
        List<BookEntity> BEL = new ArrayList();
        String q = "select * from booktable where Btitle like ? or Bdesc like ? or Bname like ?";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setString(1, s);
            pmst.setString(2, s);
            pmst.setString(3, s);

            ResultSet rs = pmst.executeQuery();
            while (rs.next()) {
                BookEntity BE = new BookEntity(rs.getInt("Bid"), rs.getString("Btitle"), rs.getString("Bdesc"), rs.getString("Bname"), rs.getInt("Buser"));
                BEL.add(BE);
            }

            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return BEL;
    }

    public List<BookEntity> getAllBookDetail() {
        List<BookEntity> BEL = new ArrayList();
        String q = "select * from booktable order by Bid desc";
        try {

            PreparedStatement pmst = this.con.prepareStatement(q);

            ResultSet rs = pmst.executeQuery();
            while (rs.next()) {
                BookEntity BE = new BookEntity(rs.getInt("Bid"), rs.getString("Btitle"), rs.getString("Bdesc"), rs.getString("Bname"), rs.getInt("Buser"));
                BEL.add(BE);
            }

            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return BEL;
    }

    //fetch book detail from Book Id code start here
    public BookEntity getBookDetailByBookId(int id) {
        BookEntity BE = null;
        String q = "select * from booktable where Bid=?";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setInt(1, id);

            ResultSet rs = pmst.executeQuery();
            if (rs.next()) {
                BE = new BookEntity(rs.getInt("Bid"), rs.getString("Btitle"), rs.getString("Bdesc"), rs.getString("Bname"), rs.getInt("Buser"));

            }

            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(rs);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return BE;
    }

    public Boolean updateBook(BookEntity BE, int Bookid) {
        Boolean r = false;
        String q = "update booktable set Btitle=?,Bdesc=?,Bname=? where Bid=?";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setString(1, BE.getTitle());
            pmst.setString(2, BE.getDesc());
            pmst.setString(3, BE.getFileName());
            pmst.setInt(4,Bookid);
            int result = pmst.executeUpdate();
            if (result > 0) {
                r = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
//         System.out.println("executtion of last line of successfull.");
        return r;
    }

}
