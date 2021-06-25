/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shikshasetu.dao;

import com.shikshasetu.entities.AppSourceEntity;
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
public class AppSourceDao {

    private Connection con;

    public AppSourceDao(Connection con) {
        this.con = con;
    }

    public Boolean saveAppSource(AppSourceEntity ASE) {
        Boolean r = false;
        String q = "insert into appsourcetable(Atitle,Aimage,AfileName,Adetail,Asource,ASdetail,Userid) values(?,?,?,?,?,?,?)";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setString(1, ASE.getTitle());
            pmst.setString(2, ASE.getFimage());
            pmst.setString(3, ASE.getFileName());
            pmst.setString(4, ASE.getAppdetai());
            pmst.setString(5, ASE.getAppsourceName());
            pmst.setString(6, ASE.getAppsourcedetail());
            pmst.setInt(7, ASE.getUid());
            pmst.executeUpdate();
            r = true;
            ConnectionProvider.closeStatement(pmst);
//            ConnectionProvider.closeResultSet(RS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return r;
    }

    public List<AppSourceEntity> getAppDetailByUserId(int id) {
        List<AppSourceEntity> AppList = new ArrayList();
        String q = "select * from appsourcetable where Userid=? order by AppId Desc";

        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setInt(1, id);
            ResultSet RS = pmst.executeQuery();
            while (RS.next()) {
                AppSourceEntity ASE = new AppSourceEntity(RS.getInt("AppId"), RS.getString("Atitle"), RS.getString("Aimage"), RS.getString("AfileName"), RS.getString("Adetail"), RS.getString("Asource"), RS.getString("ASdetail"), RS.getInt("Userid"));
                AppList.add(ASE);
            }

            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(RS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return AppList;
    }

    public AppSourceEntity getAppDetailByAppid(int id) {
        AppSourceEntity ASE = null;
        String q = "select * from appsourcetable where AppId=? order by AppId Desc";

        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setInt(1, id);
            ResultSet RS = pmst.executeQuery();
            if (RS.next()) {
                ASE = new AppSourceEntity(RS.getInt("AppId"), RS.getString("Atitle"), RS.getString("Aimage"), RS.getString("AfileName"), RS.getString("Adetail"), RS.getString("Asource"), RS.getString("ASdetail"), RS.getInt("Userid"));

            }
            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(RS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return ASE;
    }

    public List<AppSourceEntity> getAllAppDetail() {
        List<AppSourceEntity> AppList = new ArrayList();
        String q = "select * from appsourcetable order by AppId Desc";

        try {
            PreparedStatement pmst = this.con.prepareStatement(q);

            ResultSet RS = pmst.executeQuery();
            while (RS.next()) {
                AppSourceEntity ASE = new AppSourceEntity(RS.getInt("AppId"), RS.getString("Atitle"), RS.getString("Aimage"), RS.getString("AfileName"), RS.getString("Adetail"), RS.getString("Asource"), RS.getString("ASdetail"), RS.getInt("Userid"));
                AppList.add(ASE);
            }

            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(RS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return AppList;
    }

    public List<AppSourceEntity> getSearchApp(String s) {
        String search = "%" + s + "%";

        List<AppSourceEntity> AppList = new ArrayList();

        String q = "select * from appsourcetable where Atitle like ? or Adetail like ? or Asource like ?";

        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setString(1, search);
            pmst.setString(2, search);
            pmst.setString(3, search);
            ResultSet RS = pmst.executeQuery();

            while (RS.next()) {
                AppSourceEntity ASE = new AppSourceEntity(RS.getInt("AppId"), RS.getString("Atitle"), RS.getString("Aimage"), RS.getString("AfileName"), RS.getString("Adetail"), RS.getString("Asource"), RS.getString("ASdetail"), RS.getInt("Userid"));
                AppList.add(ASE);
            }
            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(RS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return AppList;
    }

    public Boolean updateAppSource(AppSourceEntity ASE, int appid) {
       Boolean r=false;
        
      String q = "update appsourcetable set Atitle=?,Aimage=?,AfileName=?,Adetail=?,Asource=?,ASdetail=? where AppId=?";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setString(1, ASE.getTitle());
            pmst.setString(2, ASE.getFimage());
            pmst.setString(3, ASE.getFileName());
            pmst.setString(4, ASE.getAppdetai());
            pmst.setString(5, ASE.getAppsourceName());
            pmst.setString(6, ASE.getAppsourcedetail());
            pmst.setInt(7, appid);
            pmst.executeUpdate();
            r = true;
            ConnectionProvider.closeStatement(pmst);
//            ConnectionProvider.closeResultSet(RS);
//              System.out.println("last line value is r :"+r);
           
       }catch(Exception e){
           e.printStackTrace();
       }
       
       
       
        return r;
    }

}
