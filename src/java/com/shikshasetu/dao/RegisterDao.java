/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shikshasetu.dao;

import com.shikshasetu.entities.RegisterUser;
import com.shikshasetu.helper.ConnectionProvider;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author SantDeveloper
 */
public class RegisterDao {

    private Connection con;

    public RegisterDao(Connection con) {
        this.con = con;
    }

    // inser data function
    public Boolean saveUser(RegisterUser Ruser) {
        Boolean f = false;
        try {

            String querry = "insert into userdetail (UserName,Email,PhoneNo,Password) values(?,?,?,?)";
            PreparedStatement pmst = this.con.prepareStatement(querry);
            pmst.setString(1, Ruser.getUserName());
            pmst.setString(2, Ruser.getEmail());
            pmst.setString(3, Ruser.getPhoneNo());
            pmst.setString(4, Ruser.getPassword());
            pmst.executeUpdate();
            f = true;
            ConnectionProvider.closeStatement(pmst);
//            ConnectionProvider.closeResultSet(RS);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return f;

    }

    // get email or password for signing validation
    public RegisterUser getUserByEmailAndPassword(String email, String password) {
        RegisterUser user = null;
        try {
            String query = "select * from userdetail where Email=? and Password=?";
            PreparedStatement pmst = this.con.prepareStatement(query);
            pmst.setString(1, email);
            pmst.setString(2, password);
            ResultSet rs = pmst.executeQuery();
            if (rs.next()) {
                user = new RegisterUser();
                user.setUserId(rs.getInt("UserId"));
                user.setUserName(rs.getString("UserName"));
                user.setEmail(rs.getString("Email"));
                user.setPassword(rs.getString("Password"));
                user.setPhoneNo(rs.getString("PhoneNo"));
                user.setProfile(rs.getString("Profile"));
                user.setDateTime(rs.getTimestamp("rdate"));
            }

            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(rs);
        } catch (Exception e) {
            e.printStackTrace();

        }
        return user;

    }

    public RegisterUser getUserDetailbyID(int id) {
        RegisterUser user = null;

        try {
            String query = "select * from userdetail where UserID=?";
            PreparedStatement pmst = this.con.prepareStatement(query);
            pmst.setInt(1, id);

            ResultSet rs = pmst.executeQuery();
            if (rs.next()) {
                user = new RegisterUser();
                user.setUserId(rs.getInt("UserId"));
                user.setUserName(rs.getString("UserName"));
                user.setEmail(rs.getString("Email"));
                user.setPassword(rs.getString("Password"));
                user.setPhoneNo(rs.getString("PhoneNo"));
                user.setProfile(rs.getString("Profile"));
                user.setDateTime(rs.getTimestamp("rdate"));
            }
            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(rs);

        } catch (Exception e) {
            e.printStackTrace();

        }

        return user;
    }

    public Boolean isUserExist(String email, String phone) {
        Boolean f = false;
        try {
            String query = "select * from userdetail where Email=?";
            PreparedStatement pmst = this.con.prepareStatement(query);
            pmst.setString(1, email);
//            pmst.setString(2, phone);
            ResultSet rs = pmst.executeQuery();
            if (rs.next()) {
                f = true;
//                System.out.println("in f value : "+f);

            }
            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(rs);
//            System.out.println(f);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

//    method for fetching userdetaby by email id and return userdetail
    public RegisterUser isUserExist(String email) {
        RegisterUser user = null;
        try {
            String query = "select * from userdetail where Email=?";
            PreparedStatement pmst = this.con.prepareStatement(query);
            pmst.setString(1, email);
//            pmst.setString(2, phone);
            ResultSet rs = pmst.executeQuery();
            if (rs.next()) {

                user = new RegisterUser();
                user.setUserId(rs.getInt("UserId"));
                user.setUserName(rs.getString("UserName"));
                user.setEmail(rs.getString("Email"));
                user.setPassword(rs.getString("Password"));
                user.setPhoneNo(rs.getString("PhoneNo"));
                user.setProfile(rs.getString("Profile"));
                user.setDateTime(rs.getTimestamp("rdate"));
            }
            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(rs);
//            System.out.println(f);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public List<RegisterUser> getAllRegisterUser() {
        RegisterUser user = null;
        List<RegisterUser> RUL = new ArrayList();
        String q = "select * from userdetail";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            ResultSet rs = pmst.executeQuery();
            while (rs.next()) {
                user = new RegisterUser();
                user.setUserId(rs.getInt("UserId"));
                user.setUserName(rs.getString("UserName"));
                user.setEmail(rs.getString("Email"));
                user.setPassword(rs.getString("Password"));
                user.setPhoneNo(rs.getString("PhoneNo"));
                user.setProfile(rs.getString("Profile"));
                user.setDateTime(rs.getTimestamp("rdate"));
                RUL.add(user);

            }
            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(rs);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return RUL;
    }

    public Boolean updateUserDetail(RegisterUser ru, int ID) {
        Boolean r = false;
        String q = "update userdetail set UserName=?,Email=?, PhoneNo=?,Password=?,Profile=? WHERE UserID=?";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setString(1, ru.getUserName());
            pmst.setString(2, ru.getEmail());
            pmst.setString(3, ru.getPhoneNo());
            pmst.setString(4, ru.getPassword());
            pmst.setString(5, ru.getProfile());
            pmst.setInt(6, ID);
            int rr = pmst.executeUpdate();
            if (rr > 0) {
                r = true;
            }
            System.out.println("=====================");
            System.out.println("name :"+ru.getUserName());
            System.out.println("im :"+ru.getProfile());
            System.out.println("pass :"+ru.getPassword());
            System.out.println("phone:"+ru.getPhoneNo());
            System.out.println("eiam:"+ru.getEmail());
            System.out.println("usrid :"+ID);
            ConnectionProvider.closeStatement(pmst);

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return r;
    }

}
