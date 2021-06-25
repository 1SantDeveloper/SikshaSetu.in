/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shikshasetu.dao;

import com.shikshasetu.entities.UniversityEntity;
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
public class UniversityDao {
   private Connection con;

    public UniversityDao(Connection con) {
        this.con = con;
    }
   
    public Boolean saveNewUniversity(UniversityEntity ue)
            
    {
        
        Boolean r=false;
        String q="insert into boardname(FullName,ShortName,Description,State,Country,userid)values(?,?,?,?,?,?)";
        try{
        PreparedStatement pmst=this.con.prepareStatement(q);
        pmst.setString(1, ue.getUname());
        pmst.setString (2,ue.getSname());
        pmst.setString(3, ue.getDesc());
        pmst.setString(4,ue.getState());
        pmst.setString(5, ue.getCountry());
        pmst.setInt(6,ue.getUserid());
        pmst.executeUpdate();
        r=true;
        ConnectionProvider.closeStatement(pmst);
        
        
        }catch(Exception e)
        {
                e.printStackTrace();
        
        }
                      
        
        return r;
    }
    
    public List<UniversityEntity> getUniversityList()
    {
    List <UniversityEntity> ul= new ArrayList();
    String q="select * from boardname";
    try{
        
        PreparedStatement pmst= this.con.prepareStatement(q);
        ResultSet rs=pmst.executeQuery();
        while(rs.next())
        {
            UniversityEntity ue= new UniversityEntity(rs.getInt("Userid"),rs.getString("FullName"),rs.getString("ShortName"),rs.getString("Description"),rs.getString("State"),rs.getString("Country"));
        
              ul.add(ue);
        }
            
        ConnectionProvider.closeStatement(pmst);
        ConnectionProvider.closeResultSet(rs);
               
    }catch(Exception e){
        e.printStackTrace();
    }
    
    
    
    
    
    return ul;
    }
    
    
}
