/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shikshasetu.dao;

import com.shikshasetu.entities.NotificationEntity;
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
public class NotificaionDao {

    private Connection con;

    public NotificaionDao(Connection con) {
        this.con = con;
    }

    public Boolean saveNotificaion(NotificationEntity NE) {
        Boolean r = false;
        String q = "insert into notificationtable (Ntitle,Ndescription,Nfor,Nfrom,Nattach,Nuserid,category) values(?,?,?,?,?,?,?)";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setString(1, NE.getNtitle());
            pmst.setString(2, NE.getNdesc());
            pmst.setString(3, NE.getNfor());
            pmst.setString(4, NE.getNfrom());
            pmst.setString(5, NE.getAttachname());
            pmst.setInt(6, NE.getUserid());
            pmst.setString(7,NE.getCategory());
            pmst.executeUpdate();
            r = true;

            ConnectionProvider.closeStatement(pmst);
//            ConnectionProvider.closeResultSet(RS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return r;
    }

    public List<NotificationEntity> getAllNotificatinByuserid(int id) {
        List<NotificationEntity> NEL = new ArrayList();
        String q = "select * from notificationtable where Nuserid=? order by Nid desc";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setInt(1, id);
            ResultSet RS = pmst.executeQuery();
            while (RS.next()) {
                NotificationEntity NE = new NotificationEntity(RS.getInt("Nid"), RS.getString("Ntitle"), RS.getString("Ndescription"), RS.getString("NFor"), RS.getString("Nfrom"), RS.getString("Nattach"), RS.getInt("Nuserid"));
                NEL.add(NE);
            }

            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(RS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return NEL;
    }
//     fucntion for geting notification for notification panel

    public List<NotificationEntity> getAllNotification() {
        List<NotificationEntity> NEL = new ArrayList();
        String q = "select * from notificationtable order by Nid desc";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);

            ResultSet RS = pmst.executeQuery();
            while (RS.next()) {
                NotificationEntity NE = new NotificationEntity(RS.getInt("Nid"), RS.getString("Ntitle"), RS.getString("Ndescription"), RS.getString("NFor"), RS.getString("Nfrom"), RS.getString("Nattach"), RS.getInt("Nuserid"),RS.getTimestamp("NDate"),RS.getString("category"));
                NEL.add(NE);
            }

            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(RS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return NEL;
    }

    
//    notification by category start here
 public List<NotificationEntity> getAllNotificationByCategory(String c) {
        String search = "%" + c + "%";
        List<NotificationEntity> NEL = new ArrayList();
        String q = "select * from notificationtable where category like ?";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setString(1, search);
           
            ResultSet RS = pmst.executeQuery();
            while (RS.next()) {
                NotificationEntity NE = new NotificationEntity(RS.getInt("Nid"), RS.getString("Ntitle"), RS.getString("Ndescription"), RS.getString("NFor"), RS.getString("Nfrom"), RS.getString("Nattach"), RS.getInt("Nuserid"),RS.getTimestamp("NDate"),RS.getString("category"));
                NEL.add(NE);
            }

            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(RS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return NEL;
    }

//    notification by category end  here
    
    
    public int deleteNotification(int nid) {
        int r = 0;
        String q = "delete from notificationtable where Nid=?";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setInt(1, nid);
            r = pmst.executeUpdate();
            ConnectionProvider.closeStatement(pmst);
//            ConnectionProvider.closeResultSet(RS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return r;
    }

//    fetching notification from notification id 
    public NotificationEntity getAllNotificatinByID(int id) {
        NotificationEntity NE = null;
        String q = "select * from notificationtable where Nid=?";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setInt(1, id);
            ResultSet RS = pmst.executeQuery();
            if (RS.next()) {
                NE = new NotificationEntity(RS.getInt("Nid"), RS.getString("Ntitle"), RS.getString("Ndescription"), RS.getString("NFor"), RS.getString("Nfrom"), RS.getString("Nattach"), RS.getInt("Nuserid"),RS.getTimestamp("NDate"));

            }

            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(RS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return NE;
    }

//    notification for searching technique 
    public List<NotificationEntity> getAllNotificationBySearch(String s) {
        String search = "%" + s + "%";
        List<NotificationEntity> NEL = new ArrayList();
        String q = "select * from notificationtable where Ntitle like ? or Ndescription like ? or Nfor like ?";
        try {
            PreparedStatement pmst = this.con.prepareStatement(q);
            pmst.setString(1, search);
            pmst.setString(2, search);
            pmst.setString(3, search);
            ResultSet RS = pmst.executeQuery();
            while (RS.next()) {
                NotificationEntity NE = new NotificationEntity(RS.getInt("Nid"), RS.getString("Ntitle"), RS.getString("Ndescription"), RS.getString("NFor"), RS.getString("Nfrom"), RS.getString("Nattach"), RS.getInt("Nuserid"));
                NEL.add(NE);
            }

            ConnectionProvider.closeStatement(pmst);
            ConnectionProvider.closeResultSet(RS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return NEL;
    }

}
