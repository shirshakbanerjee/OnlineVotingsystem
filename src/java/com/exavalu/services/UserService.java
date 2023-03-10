/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;

/**
 *
 * @author SHIRSHAK
 */

import com.exavalu.models.User;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.apache.log4j.Logger;

/**
 *
 * @author Admin
 */
public class UserService {
    
    static Logger log = Logger.getLogger(AdminService.class.getName());

    public static int doLogin(User user) {
        
        int success = 100;
        
        String sql = "Select * from users where emailAddress=? and password=?";
        
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getEmailAddress());
            ps.setString(2, user.getPassword());
            
            System.out.println("LoginService :: "+ps);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next())
            {
                success = rs.getInt("roleId");
            }
            
        } catch (SQLException ex) {
            ex.printStackTrace();
            log.error("Error in doLogin sql statement "+ex);
        }
        
        
        return success;
    }

    public static User getUser(int voterId) {
         String sql = "Select * from users where voterId=? ";
        User user = new User();
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, voterId);
            
            
            System.out.println("LoginService :: "+ps);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next())
            {
                
                user.setEmailAddress(rs.getString("emailAddress"));
                
            }
            
        } catch (SQLException ex) {
            ex.printStackTrace();
            log.error("Error in getUser sql statement "+ex);
        }
        
        
        return user;
    }
    
    public static int doLogin2(User user) {
        
        int success = 0;
        
        String sql = "Select * from users where emailAddress=?";
        
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getEmailAddress());
           
            
            System.out.println("LoginService :: "+ps);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next())
            {
                success = rs.getInt("roleId");
            }
            
        } catch (SQLException ex) {
            ex.printStackTrace();
            log.error("Error in doLogin2 sql statement "+ex);
        }
        
        
        return success;
    }
    
}