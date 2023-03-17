/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Admin;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.apache.log4j.Logger;

/**
 *
 * This is admin service
 */
public class AdminService {

    static Logger log = Logger.getLogger(AdminService.class.getName());

    public static Admin getAdmin(String emailAddress) {
        Admin admin = new Admin();

        try (Connection con = JDBCConnectionManager.getConnection()) {

            String sql = "select * from admins "
                    + "where emailAddress = ?";

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setString(1, emailAddress);

                try (ResultSet rs = preparedStatement.executeQuery()) {

                    if (rs.next()) {

                        admin.setAdminId(rs.getInt("adminId"));
                        admin.setEmailAddress(rs.getString("emailAddress"));
                        admin.setFirstName(rs.getString("firstName"));
                        admin.setLastName(rs.getString("lastName"));
                        admin.setPassword(rs.getString("password"));
                    }
                }
            }

        } catch (SQLException ex) {

            if (log.isEnabledFor(org.apache.log4j.Level.ERROR)) {
                log.error("Error in getAdmin sql statement", ex);
            }
            //log.error("Error in getAdmin sql statement "+ex);
        }
        return admin;
    }

    public static boolean approveVoter(String status, String voterId) {
        boolean result = false;
        try (Connection con = JDBCConnectionManager.getConnection()) {

            String sql = "UPDATE voters SET adminStatus = ? WHERE (voterId = ?);";

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setString(1, status);
                preparedStatement.setString(2, voterId);

                int row = preparedStatement.executeUpdate();
                if (row == 1) {
                    result = true;
                }
            }

        } catch (SQLException ex) {
            //ex.printStackTrace();
            if (log.isEnabledFor(org.apache.log4j.Level.ERROR)) {
                log.error("Error in getAdmin sql statement", ex);
            }
            //log.error("Error in getAdmin sql statement "+ex);
        }

        return result;
    }
}
