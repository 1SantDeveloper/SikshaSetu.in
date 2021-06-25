/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shikshasetu.dao;

import com.shikshasetu.entities.SourceCodeEntity;
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
public class SourceCodeDao {

    private Connection con;

    public SourceCodeDao(Connection con) {
        this.con = con;
    }

    public Boolean saveSourceCode(SourceCodeEntity SCE) {
        Boolean r = false;
        String q = "insert into sourcecodetable(Stitle,Sprice,Sfile,Smanually,SAppid,Suid) values(?,?,?,?,?,?)";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setString(1, SCE.getStitle());
            pmst.setInt(2, SCE.getSprice());
            pmst.setString(3, SCE.getSfile());
            pmst.setString(4, SCE.getStitle());
            pmst.setInt(5, SCE.getSappid());
            pmst.setInt(6, SCE.getSuid());
            pmst.executeUpdate();
            r = true;
            ConnectionProvider.closeStatement(pmst);
//            ConnectionProvider.closeResultSet(RS);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return r;
    }

    public List<SourceCodeEntity> getProjectByAppID(int appId) {
        List<SourceCodeEntity> SCEL = new ArrayList();
        try {

            String q = "select * from sourcecodetable where SAppid=? order by Sid desc;";
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setInt(1, appId);
            ResultSet RS = pmst.executeQuery();
            while (RS.next()) {
                SourceCodeEntity SCE = new SourceCodeEntity(RS.getInt("Sid"), RS.getString("Stitle"), RS.getInt("Sprice"), RS.getString("Sfile"), RS.getString("Smanually"), RS.getInt("SAppid"), RS.getInt("Suid"));
                SCEL.add(SCE);
            }
            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(RS);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return SCEL;
    }
}
