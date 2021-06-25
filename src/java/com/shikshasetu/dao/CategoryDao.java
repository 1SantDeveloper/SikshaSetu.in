/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shikshasetu.dao;

import com.shikshasetu.entities.Category;
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
public class CategoryDao {

    private Connection con;

    public CategoryDao(Connection con) {
        this.con = con;
    }

    public Boolean saveNewCategory(Category ce) {
        Boolean r = false;
        String q = "insert into category (CategoryName,Description,userid) values(?,?,?)";

        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setString(1, ce.getCategory());
            pmst.setString(2, ce.getDesc());
            pmst.setInt(3, ce.getUserid());
            pmst.executeUpdate();
            r = true;

            ConnectionProvider.closeStatement(pmst);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return r;
    }

    public List<Category> GetAllCategory() {
        List<Category> lc = new ArrayList();
        String q = "select * from category";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            ResultSet rs = pmst.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("userid"), rs.getString("CategoryName"), rs.getString("Description"));
                lc.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lc;
    }

}
