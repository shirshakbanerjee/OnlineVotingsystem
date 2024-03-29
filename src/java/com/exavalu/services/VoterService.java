/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Voter;
import com.exavalu.utils.JDBCConnectionManager;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import org.apache.log4j.Logger;

/**
 * This is a Service for voters to get details of voter and cast vote.
 *
 */
public class VoterService {

    private static final Logger log = Logger.getLogger(AdminService.class.getName());

    public static Voter getVoter(String voterId) {
        Voter voter = new Voter();

        try(Connection con = JDBCConnectionManager.getConnection()) {
            
            String sql = "select * from voters "
                    + "where voterId = ?";

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setInt(1, Integer.parseInt(voterId));

                try (ResultSet rs = preparedStatement.executeQuery()) {

                    if (rs.next()) {

                        voter.setVoterId(rs.getInt("voterId"));
                        voter.setFirstName(rs.getString("firstName"));
                        voter.setLastName(rs.getString("lastName"));
                        voter.setPassword(rs.getString("password"));
                        voter.setAge(rs.getString("age"));
                        voter.setGender(rs.getString("gender"));
                        voter.setState(rs.getString("state"));
                        voter.setAdminStatus(rs.getString("adminStatus"));
                        voter.setVotingStatus(rs.getString("votingStatus"));
                        voter.setDob(rs.getString("dob"));
                        voter.setEmailAddress(rs.getString("emailAddress"));
                        System.out.println(voter.getVoterId() + " Found!!!");
                    }
                }
            }
        } catch (SQLException ex) {
//            ex.printStackTrace();
//            log.error("Error in getVoter sql statement " + ex);
            if (log.isEnabledFor(org.apache.log4j.Level.ERROR)) {
                log.error("Error in getVoter sql statement ", ex);
            }
        }
        return voter;
    }

    public static Voter getVoter2(String voterId, String emailAddress) {
        Voter voter = new Voter();

        try(Connection con = JDBCConnectionManager.getConnection()) {
            
            String sql = "select * from voters "
                    + "where voterId = ? and emailAddress = ?";

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setInt(1, Integer.parseInt(voterId));
                preparedStatement.setString(2, emailAddress);
                try (ResultSet rs = preparedStatement.executeQuery()) {

                    if (rs.next()) {

                        voter.setVoterId(rs.getInt("voterId"));
                        voter.setFirstName(rs.getString("firstName"));
                        voter.setLastName(rs.getString("lastName"));
                        voter.setPassword(rs.getString("password"));
                        voter.setAge(rs.getString("age"));
                        voter.setGender(rs.getString("gender"));
                        voter.setState(rs.getString("state"));
                        voter.setAdminStatus(rs.getString("adminStatus"));
                        voter.setVotingStatus(rs.getString("votingStatus"));
                        voter.setDob(rs.getString("dob"));
                        voter.setEmailAddress(rs.getString("emailAddress"));
                        System.out.println(voter.getVoterId() + " Found!!!");
                    }
                }
            }
        } catch (SQLException ex) {
//            ex.printStackTrace();
//            log.error("Error in getVoter2 sql statement " + ex);
            if (log.isEnabledFor(org.apache.log4j.Level.ERROR)) {
                log.error("Error in getVoter2 sql statement ", ex);
            }
        }
        return voter;
    }

    public static List getStates() {
        List<Voter> stateList = new ArrayList<>();
        try(Connection con = JDBCConnectionManager.getConnection()) {

            

            String sql = "Select * from states";

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                try (ResultSet rs = preparedStatement.executeQuery()) {

                    while (rs.next()) {
                        Voter voter = new Voter();

                        voter.setStateCode(rs.getString("stateCode"));
                        voter.setStateName(rs.getString("stateName"));

                        stateList.add(voter);

                    }
                }
            }

        } catch (SQLException ex) {
//            ex.printStackTrace();
//            log.error("Error in getStates sql statement " + ex);
            if (log.isEnabledFor(org.apache.log4j.Level.ERROR)) {
                log.error("Error in getStates sql statement ", ex);
            }

        }

        return stateList;
    }

    public static boolean doSignup1(String emailAddress, String password, String firstName, String lastName, int roleId, int voterId) {
        boolean result = false;
        

        String sql = "INSERT INTO users(emailAddress,firstName,lastName,password,roleId,voterId)"
                + "VALUES(? ,? ,? ,? ,? ,? );";

        try(Connection con = JDBCConnectionManager.getConnection()) {
            MessageDigest md = MessageDigest.getInstance("MD5");

            // digest() method is called to calculate message digest
            // of an input digest() return array of byte
            byte[] messageDigest = md.digest(password.getBytes());

            // Convert byte array into signum representation
            BigInteger no = new BigInteger(1, messageDigest);

            // Convert message digest into hex value
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setString(1, emailAddress);
                preparedStatement.setString(2, firstName);
                preparedStatement.setString(3, lastName);
                preparedStatement.setString(4, hashtext);
                preparedStatement.setInt(5, roleId);
                preparedStatement.setInt(6, voterId);

                int rs = preparedStatement.executeUpdate();

                if (rs != 0) {
                    result = true;
                }
            }

        } catch (SQLException ex) {

//            ex.printStackTrace();
//            log.error("Error in doSignup1 sql statement " + ex);
            if (log.isEnabledFor(org.apache.log4j.Level.ERROR)) {
                log.error("Error in doSignup1 sql statement", ex);
            }
        } catch (NoSuchAlgorithmException ex) {
            java.util.logging.Logger.getLogger(VoterService.class.getName()).log(Level.SEVERE, null, ex);
        }

        return result;
    }

    public static boolean doSignup2(Voter voter) throws NoSuchAlgorithmException {
        boolean result = false;
        

        String sql = "INSERT INTO voters(voterId,firstName,lastName,emailAddress,password,age,dob,gender,state)"
                + "VALUES(? ,? ,? ,? ,? ,?, ?, ?, ?);";

        try(Connection con = JDBCConnectionManager.getConnection()) {
            MessageDigest md = MessageDigest.getInstance("MD5");

            // digest() method is called to calculate message digest
            // of an input digest() return array of byte
            byte[] messageDigest = md.digest(voter.getPassword().getBytes());

            // Convert byte array into signum representation
            BigInteger no = new BigInteger(1, messageDigest);

            // Convert message digest into hex value
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setInt(1, voter.getVoterId());
                preparedStatement.setString(2, voter.getFirstName());
                preparedStatement.setString(3, voter.getLastName());
                preparedStatement.setString(4, voter.getEmailAddress());
                preparedStatement.setString(5, hashtext);
                preparedStatement.setString(6, voter.getAge());
                preparedStatement.setString(7, voter.getDob());
                preparedStatement.setString(8, voter.getGender());
                preparedStatement.setString(9, voter.getState());

                int rs = preparedStatement.executeUpdate();

                if (rs != 0) {
                    result = true;
                }
            }

        } catch (SQLException ex) {

//            ex.printStackTrace();
//            log.error("Error in doSignup2 sql statement " + ex);
            if (log.isEnabledFor(org.apache.log4j.Level.ERROR)) {
                log.error("Error in doSignup2 sql statement", ex);
            }
        }

        return result;
    }

    public static List getAllVoters() {
        List<Voter> voterList = new ArrayList<Voter>();
        String sql = "Select * from voters";
        try(Connection con = JDBCConnectionManager.getConnection()) {
            
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                try (ResultSet rs = ps.executeQuery()) {

                    while (rs.next()) {
                        Voter voter = new Voter();

                        voter.setVoterId(rs.getInt("voterId"));
                        voter.setFirstName(rs.getString("firstName"));
                        voter.setLastName(rs.getString("lastName"));
                        voter.setEmailAddress(rs.getString("emailAddress"));
                        voter.setPassword(rs.getString("password"));
                        voter.setAge(rs.getString("age"));
                        voter.setGender(rs.getString("gender"));
                        voter.setState(rs.getString("state"));
                        voter.setAdminStatus(rs.getString("adminStatus"));
                        voter.setVotingStatus(rs.getString("votingStatus"));
                        voter.setDob(rs.getString("dob"));

                        voterList.add(voter);
                    }
                }
            }

        } catch (SQLException ex) {
//            ex.printStackTrace();
//            log.error("Error in getAllVoters sql statement " + ex);
            if (log.isEnabledFor(org.apache.log4j.Level.ERROR)) {
                log.error("Error in getAllVoters sql statement", ex);
            }
        }
        System.err.println("Total rows:" + voterList.size());
        return voterList;
    }

    public static boolean doVoteService(Voter voter) {
        boolean result = false;
        

        String sql = "INSERT INTO votes(voterId,state,candidateId,time)"
                + "VALUES(? ,? ,?, ? );";

        try(Connection con = JDBCConnectionManager.getConnection()) {

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setInt(1, voter.getVoterId());
                preparedStatement.setString(2, voter.getState());
                preparedStatement.setString(3, voter.getCandidateId());
                preparedStatement.setObject(4, LocalDateTime.now());

                int rs = preparedStatement.executeUpdate();

                if (rs != 0) {
                    result = true;
                }
            }

        } catch (SQLException ex) {

//            ex.printStackTrace();
//            log.error("Error in doVoteService sql statement " + ex);
            if (log.isEnabledFor(org.apache.log4j.Level.ERROR)) {
                log.error("Error in doVoteService sql statement", ex);
            }

        }

        return result;
    }

    public static boolean doVerification(String voterId) {
        boolean result = false;
        try(Connection con = JDBCConnectionManager.getConnection()) {
            
            String sql = "UPDATE voters SET adminStatus = 1 WHERE voterId = ?";

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {

                preparedStatement.setString(1, voterId);

                int row = preparedStatement.executeUpdate();

                if (row == 1) {
                    result = true;
                }
            }

        } catch (SQLException ex) {
//            ex.printStackTrace();
//            log.error("Error in doVerification sql statement " + ex);
            if (log.isEnabledFor(org.apache.log4j.Level.ERROR)) {
                log.error("Error in doVerification sql statement  ", ex);
            }
        }

        return result;
    }

    public static boolean doAdminReject(String voterId) {

        boolean result = false;
        try(Connection con = JDBCConnectionManager.getConnection()) {
            

            String sql = "UPDATE voters SET adminStatus = 2 WHERE voterId = ?";

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {

                preparedStatement.setString(1, voterId);

                int row = preparedStatement.executeUpdate();

                if (row == 1) {
                    result = true;
                }
            }

        } catch (SQLException ex) {
//            ex.printStackTrace();
//            log.error("Error in doAdminReject sql statement " + ex);
            if (log.isEnabledFor(org.apache.log4j.Level.ERROR)) {
                log.error("Error in doAdminReject sql statement ", ex);
            }
        }
        return result;
    }

    public static boolean voted(int voterId) {
        boolean result = false;
        

        String sql = "UPDATE voters SET votingStatus = ? WHERE voterId = ?";

        try(Connection con = JDBCConnectionManager.getConnection()) {

            try(PreparedStatement preparedStatement = con.prepareStatement(sql)){
            preparedStatement.setString(1, "1");
            preparedStatement.setInt(2, voterId);

            int rs = preparedStatement.executeUpdate();

            if (rs != 0) {
                result = true;
            }
            }

        } catch (SQLException ex) {

//            ex.printStackTrace();
//            log.error("Error in voted sql statement " + ex);
            if (log.isEnabledFor(org.apache.log4j.Level.ERROR)) {
                log.error("Error in voted sql statement", ex);
            }
        }

        return result;
    }

    public static int dogetApproveVoter() {
        int count = -500;
        

        String sql = "SELECT COUNT(*) as Count FROM voters WHERE adminStatus = '1'";
        try(Connection con = JDBCConnectionManager.getConnection()) {

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {

                try (ResultSet rs = preparedStatement.executeQuery()) {

                    while (rs.next()) {
                        count = rs.getInt("Count");
                    }
                }
            }

        } catch (SQLException ex) {

//            ex.printStackTrace();
//            log.error("Error in dogetApproveVoter sql statement " + ex);
            if (log.isEnabledFor(org.apache.log4j.Level.ERROR)) {
                log.error("Error in dogetApproveVoter sql statement", ex);
            }

        }
        return count;
    }

    public static int dogetRejectedVoter() {
        int countR = -500;
        

        String sql = "SELECT COUNT(*) as Count FROM voters WHERE adminStatus = '2'";
        try(Connection con = JDBCConnectionManager.getConnection()) {

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {

                try (ResultSet rs = preparedStatement.executeQuery()) {

                    while (rs.next()) {
                        countR = rs.getInt("Count");
                    }
                }
            }

        } catch (SQLException ex) {

//            ex.printStackTrace();
//            log.error("Error in dogetRejectedVoter sql statement " + ex);
            if (log.isEnabledFor(org.apache.log4j.Level.ERROR)) {
                log.error("Error in dogetRejectedVoter sql statement", ex);
            }

        }
        return countR;
    }

    public static int dogetPendingVoter() {
        int countP = -500;
        

        String sql = "SELECT COUNT(*) as Count FROM voters WHERE adminStatus = '0'";
        try(Connection con = JDBCConnectionManager.getConnection()) {

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {

                try (ResultSet rs = preparedStatement.executeQuery()) {

                    while (rs.next()) {
                        countP = rs.getInt("Count");
                    }
                }
            }

        } catch (SQLException ex) {

//            ex.printStackTrace();
//            log.error("Error in dogetPendingVoter sql statement " + ex);
            if (log.isEnabledFor(org.apache.log4j.Level.ERROR)) {
                log.error("Error in dogetPendingVoter sql statement", ex);
            }
        }
        return countP;
    }

    public static int dogetVoted() {
        int countV = -500;
        

        String sql = "SELECT COUNT(*) as count FROM voters WHERE votingStatus = '1'";
        try(Connection con = JDBCConnectionManager.getConnection()) {

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {

                try (ResultSet rs = preparedStatement.executeQuery()) {

                    while (rs.next()) {
                        countV = rs.getInt("Count");
                    }
                }
            }
        } catch (SQLException ex) {

//            ex.printStackTrace();
//            log.error("Error in dogetVoted sql statement " + ex);
            if (log.isEnabledFor(org.apache.log4j.Level.ERROR)) {
                log.error("Error in dogetVoted sql statement ", ex);
            }

        }
        return countV;
    }

    public static int dogetNotVoted() {
        int countN = -500;
       

        String sql = "SELECT COUNT(*) as count FROM voters WHERE votingStatus = '0'";
        try( Connection con = JDBCConnectionManager.getConnection()) {

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {

                try (ResultSet rs = preparedStatement.executeQuery()) {

                    while (rs.next()) {
                        countN = rs.getInt("Count");
                    }
                }
            }

        } catch (SQLException ex) {

//            ex.printStackTrace();
//            log.error("Error in dogetNotVoted sql statement " + ex);
            if (log.isEnabledFor(org.apache.log4j.Level.ERROR)) {
                log.error("Error in dogetNotVoted sql statement ", ex);
            }

        }
        return countN;
    }
}
