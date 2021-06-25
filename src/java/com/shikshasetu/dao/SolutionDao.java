/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shikshasetu.dao;

import com.shikshasetu.entities.SolutionEntity;
import com.shikshasetu.helper.ConnectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author SantDeveloper
 */
public class SolutionDao {

    private Connection con;

    public SolutionDao(Connection con) {
        this.con = con;
    }

    public Boolean saveSolution(SolutionEntity SE) {
        Boolean r = false;
        String q = "insert into solutiontable (SolutionTitle,PreviewFile,SolutionFile,ManuallyText,Price,QID,UID) values(?,?,?,?,?,?,?)";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setString(1, SE.getStitle());
            pmst.setString(2, SE.getPreview());
            pmst.setString(3, SE.getFileName());
            pmst.setString(4, SE.getManuallytext());
            pmst.setInt(5, SE.getPrice());
            pmst.setInt(6, SE.getQid());
            pmst.setInt(7, SE.getUid());
            pmst.executeUpdate();
            r = true;
            ConnectionProvider.closeStatement(pmst);
//            ConnectionProvider.closeResultSet(RS);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return r;
    }

    public List<SolutionEntity> getAllSolutionByQuesitonID(int id) {

        List<SolutionEntity> LSE = new ArrayList();
        String q = "select * from solutiontable  where QID=? order by SolutionID desc";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setInt(1, id);
            ResultSet RS = pmst.executeQuery();
            while (RS.next()) {
                SolutionEntity SE = new SolutionEntity(RS.getInt("SolutionID"), RS.getString("SolutionTitle"), RS.getString("PreviewFile"), RS.getString("SolutionFile"), RS.getString("ManuallyText"), RS.getInt("Price"), RS.getInt("UID"), RS.getInt("QID"));
////                SE.setSolutionID();
//                SE.setStitle();
//                SE.setPreview();
//                SE.setFileName();
//                SE.setManuallytext();
//                SE.setPrice();
//                SE.setQid(RS.getInt("QID"));
//                SE.setUid(RS.getInt("UID"));
                LSE.add(SE);
                System.out.println(SE);
            }

            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(RS);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return LSE;
    }

}
