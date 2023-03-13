/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Candidate;
import com.exavalu.utils.JDBCConnectionManager;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import org.apache.log4j.Logger;

/**
 *
 *This is Candidate Service
 */
public class CandidateService {
    
    static Logger log = Logger.getLogger(CandidateService.class.getName());
    
    public static ArrayList getAllCandidates() {
        ArrayList candidateList = new ArrayList();
        String sql = "Select * from candidates where candidateStatus=0";
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Candidate candidate = new Candidate();

                candidate.setCandidateId(rs.getInt("candidateId"));
                candidate.setFirstName(rs.getString("firstName"));
                candidate.setLastName(rs.getString("lastName"));
                candidate.setPartyName(rs.getString("partyName"));
                candidate.setGender(rs.getString("gender"));
                candidate.setAge(rs.getString("age"));
                candidate.setRegion(rs.getString("region"));
                candidate.setCandidateStatus(rs.getInt("candidateStatus"));
                candidate.setCandidateEmail(rs.getString("candidateEmail"));
                // retrieve image data as blob
                Blob imageBlob = rs.getBlob("image");
                if (imageBlob != null) {
                    byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                    String imageString = Base64.getEncoder().encodeToString(imageBytes);
                    candidate.setImageData(imageString);
                }

                candidateList.add(candidate);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
            log.error("Error in getAllCandidates sql statement "+ex);
        }

        System.err.println("Total rows:" + candidateList.size());
        return candidateList;
    }

    public static boolean doSaveCandidate(Candidate candidate) {
        boolean result = false;
        Connection con = JDBCConnectionManager.getConnection();

        String sql = "INSERT INTO candidates(candidateId,firstName,lastName,partyName,age,gender,region,candidateStatus,image,candidateEmail)"
                + "VALUES(? ,? ,? ,? ,? ,?, ?, ?,?,?);";

        try {
            FileInputStream inputStream = new FileInputStream(candidate.getImage());
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setInt(1, candidate.getCandidateId());
            preparedStatement.setString(2, candidate.getFirstName());
            preparedStatement.setString(3, candidate.getLastName());
            preparedStatement.setString(4, candidate.getPartyName());
            preparedStatement.setString(5, candidate.getAge());
            preparedStatement.setString(6, candidate.getGender());
            preparedStatement.setString(7, candidate.getRegion());
            preparedStatement.setInt(8, candidate.getCandidateStatus());
            preparedStatement.setBinaryStream(9, inputStream);
            preparedStatement.setString(10, candidate.getCandidateEmail());
            
            int rs = preparedStatement.executeUpdate();

            if (rs != 0) {
                result = true;
            }

        } catch (SQLException ex) {

            ex.printStackTrace();
            log.error("Error in doSaveCandidate sql statement "+ex);

        } catch (FileNotFoundException ex) {
            //Logger.getLogger(CandidateService.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
            log.error("Error in doSaveCandidate image problem "+ex);
        }

        return result;
    }

    public static Candidate getCandidateById(int candidateId) {
        Candidate candidate = new Candidate();
        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "Select * from candidates where candidateStatus=0 and candidateId=?";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setInt(1, candidateId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {

                candidate.setCandidateId(rs.getInt("candidateId"));
                candidate.setFirstName(rs.getString("firstName"));
                candidate.setLastName(rs.getString("lastName"));
                candidate.setPartyName(rs.getString("partyName"));
                candidate.setGender(rs.getString("gender"));
                candidate.setAge(rs.getString("age"));
                candidate.setRegion(rs.getString("region"));
                candidate.setCandidateEmail(rs.getString("candidateEmail"));

                // retrieve image data as blob
                Blob imageBlob = rs.getBlob("image");
                if (imageBlob != null) {
                    byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                    String imageString = Base64.getEncoder().encodeToString(imageBytes);
                    candidate.setImageData(imageString);
                }
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
            log.error("Error in getCandidateById sql statement "+ex);
        }
        return candidate;
    }

    public static boolean updateCandidate(Candidate candidate, int candidateId) {

        boolean result = false;

        try (Connection con = JDBCConnectionManager.getConnection()) {

            String sql = "UPDATE candidates SET firstName = ? ,lastName=?, partyName = ? ,region = ?, gender = ? ,age = ? ,image= ? WHERE candidateId = ? and candidateStatus=0";

            FileInputStream inputStream = new FileInputStream(candidate.getImage());
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, candidate.getFirstName());
            preparedStatement.setString(2, candidate.getLastName());
            preparedStatement.setString(3, candidate.getPartyName());
            preparedStatement.setString(4, candidate.getRegion());
            preparedStatement.setString(5, candidate.getGender());
            preparedStatement.setString(6, candidate.getAge());
            preparedStatement.setBinaryStream(7, inputStream);

            preparedStatement.setInt(8, candidateId);

            int row = preparedStatement.executeUpdate();

            if (row == 1) {
                result = true;
            }

        } catch (SQLException ex) {
            //logger.error("An error occurred for function updateEmployee: ", ex);
            ex.printStackTrace();
            log.error("Error in updateCandidate sql statement "+ex);
        } catch (FileNotFoundException ex) {
//            Logger.getLogger(CandidateService.class.getName()).log(Level.SEVERE, null, ex);
            log.error("Error in updateCandidate image upload "+ex);
        }
        return result;
    }

    public static boolean updateCandidate2(Candidate candidate, int candidateId) {

        boolean result = false;

        try (Connection con = JDBCConnectionManager.getConnection()) {

            String sql = "UPDATE candidates SET firstName = ? ,lastName=?, partyName = ? ,region = ?, gender = ? ,age = ? WHERE candidateId = ? and candidateStatus=0";

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, candidate.getFirstName());
            preparedStatement.setString(2, candidate.getLastName());
            preparedStatement.setString(3, candidate.getPartyName());
            preparedStatement.setString(4, candidate.getRegion());
            preparedStatement.setString(5, candidate.getGender());
            preparedStatement.setString(6, candidate.getAge());

            preparedStatement.setInt(7, candidateId);

            int row = preparedStatement.executeUpdate();

            if (row == 1) {
                result = true;
            }

        } catch (SQLException ex) {
            log.error("An error occurred for function updateCandidate2: ", ex);
            ex.printStackTrace();
        }

        return result;
    }

    public static boolean deleteCandidate(int candidateId) {
        boolean result = false;
        try (Connection con = JDBCConnectionManager.getConnection()) {

            String sql = "Update candidates set candidateStatus=1 WHERE candidateId = ?";

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            //preparedStatement.setInt(1, 1);
            preparedStatement.setInt(1, candidateId);

            System.out.println("candidate ID: " + candidateId);
            int row = preparedStatement.executeUpdate();
            System.out.println("Rows now: " + row);
            if (row == 1) {
                result = true;
            }

        } catch (SQLException ex) {
            log.error("An error occurred for function deleteCandidate: ", ex);
        }
        return result;
    }

}
