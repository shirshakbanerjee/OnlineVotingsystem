/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.User;
import com.exavalu.utils.JDBCConnectionManager;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import org.apache.log4j.Logger;

/**
 *
 * This is Candidate Service
 */
public class UserService {

    private static final Logger log = Logger.getLogger(AdminService.class.getName());

    public static int doLogin(User user) {

        int success = 100;

        String sql = "Select * from users where emailAddress=? and password=?";

        try(Connection con = JDBCConnectionManager.getConnection()) {
            MessageDigest md = MessageDigest.getInstance("MD5");

            // digest() method is called to calculate message digest
            // of an input digest() return array of byte
            byte[] messageDigest = md.digest(user.getPassword().getBytes());

            // Convert byte array into signum representation
            BigInteger no = new BigInteger(1, messageDigest);

            // Convert message digest into hex value
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, user.getEmailAddress());
                ps.setString(2, hashtext);

                System.out.println("LoginService :: " + ps);

                try (ResultSet rs = ps.executeQuery()) {

                    if (rs.next()) {
                        success = rs.getInt("roleId");
                    }
                }
            }

        } catch (SQLException ex) {
            if (log.isEnabledFor(org.apache.log4j.Level.ERROR)) {
                log.error("Error in doLogin sql statement", ex);
            }
//            ex.printStackTrace();
//            log.error("Error in doLogin sql statement "+ex);
        } catch (NoSuchAlgorithmException ex) {
            java.util.logging.Logger.getLogger(UserService.class.getName()).log(Level.SEVERE, null, ex);
        }

        return success;
    }

    public static User getUser(int voterId) {
        String sql = "Select * from users where voterId=? ";
        User user = new User();
        try(Connection con = JDBCConnectionManager.getConnection()) {
         
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, voterId);

                System.out.println("LoginService :: " + ps);

                try (ResultSet rs = ps.executeQuery()) {

                    if (rs.next()) {

                        user.setEmailAddress(rs.getString("emailAddress"));

                    }
                }
            }

        } catch (SQLException ex) {
            if (log.isEnabledFor(org.apache.log4j.Level.ERROR)) {
                log.error("Error in getUser sql statement", ex);
            }
//            ex.printStackTrace();
//            log.error("Error in getUser sql statement "+ex);
        }

        return user;
    }

    public static int doLogin2(User user) {

        int success = 0;

        String sql = "Select * from users where emailAddress=?";

        try(Connection con = JDBCConnectionManager.getConnection()) {
            
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, user.getEmailAddress());

                System.out.println("LoginService :: " + ps);

                try (ResultSet rs = ps.executeQuery()) {

                    if (rs.next()) {
                        success = rs.getInt("roleId");
                    }
                }
            }

        } catch (SQLException ex) {
            if (log.isEnabledFor(org.apache.log4j.Level.ERROR)) {
                log.error("Error in doLogin2 sql statement", ex);
            }
//            ex.printStackTrace();
//            log.error("Error in doLogin2 sql statement "+ex);
        }

        return success;
    }

}
