package com.shikshasetu.helper;
import java.sql.*;
import java.io.*;


public class ConnectionProvider {
    
    static Connection con;
    static String url="jdbc:mysql://localhost:3306/shikshasetu";
//    static String url="jdbc:mysql://http://3.143.199.107:3306/shikshasetu";
    public static Connection getConnect()
    {
        try{
            if(con==null)
            {
           Class.forName("com.mysql.jdbc.Driver");
//           con=DriverManager.getConnection(url,"root","12345");
           con=DriverManager.getConnection(url,"santosh","santosh123");
            }
        }catch(Exception ex)
        {
           ex.printStackTrace(); 
        }
        
    return con;
    }
    
    public static void closeConnection(Connection con)
    {
        try{
            con.close();
//             System.out.println("connection closed");
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
    }
    
    public static void closeStatement(PreparedStatement pmst)
    {
        try{
            pmst.close();
//            System.out.println("PreparesStatement closed");
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
    }

    public static void closeResultSet(ResultSet  rs)
    {
        try{
            rs.close();
//             System.out.println("ResultSet closed");
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
    }
  
    
}
