/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shikshasetu.dao;

import com.shikshasetu.entities.CourseEntity;
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
public class CourseDao {

    private Connection con;

    public CourseDao(Connection con) {
        this.con = con;
    }

    public Boolean saveNewCourse(CourseEntity ce) {
        Boolean r = false;
        String q = "insert into course(CourseName,shortName,Description,userid)values(?,?,?,?)";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setString(1, ce.getCoursename());
            pmst.setString(2, ce.getShortname());
            pmst.setString(3, ce.getPuporse());
            pmst.setInt(4, ce.getUserid());
            pmst.executeUpdate();
            r = true;
            ConnectionProvider.closeStatement(pmst);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return r;
    }

    public List<CourseEntity> getAllCourse() {
        List<CourseEntity> cl = new ArrayList();

        String q = "select * from course";

        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            ResultSet rs = pmst.executeQuery();
            while (rs.next()) {
                CourseEntity ce = new CourseEntity(rs.getString("CourseName"), rs.getString("shortName"), rs.getString("Description"), rs.getInt("userid"));
                cl.add(ce);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cl;
    }

}
