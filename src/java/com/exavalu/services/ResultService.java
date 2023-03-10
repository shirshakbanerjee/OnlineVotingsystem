/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Result;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Iterator;
import org.apache.log4j.Logger;

/**
 *
 * @author Admin
 */
public class ResultService {
    
    static Logger log = Logger.getLogger(ResultService.class.getName());
    
    public static ArrayList calculateResult() {
        ArrayList resultList = new ArrayList();
        String sql = "SELECT V.candidateId,C.firstName,C.lastName,C.partyName,C.image,count(*) as votes FROM onlinevotingdb.votes as V,onlinevotingdb.candidates as C "
                + "where V.candidateId=C.candidateId group by V.candidateId order by C.candidateId";
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Result result = new Result();

                result.setCandidateId(String.valueOf(rs.getInt("candidateId")));
                String firstName = rs.getString("firstName");
                result.setFirstName(firstName);
                String lastName = rs.getString("lastName");
                result.setLastName(lastName);
                result.setCandidateName(firstName+" "+lastName);
                result.setVotes(String.valueOf(rs.getInt("votes")));
                result.setPartyName(rs.getString("partyName"));
                
                Blob imageBlob = rs.getBlob("image");
                if (imageBlob != null) {
                    byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                    String imageString = Base64.getEncoder().encodeToString(imageBytes);
                    result.setImageData(imageString);
                }
                

                resultList.add(result);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
            log.error("Error in calculateResult sql statement "+ex);
        }
        System.err.println("Total rows:" + resultList.size());
        return resultList;
    }

    public static ArrayList calculateState() {
        ArrayList stateList = new ArrayList();
        String sql = "SELECT V.state,count(*) as count FROM votes as V, candidates as C "
                + "where V.candidateId=C.candidateId and state in (SELECT stateName FROM states) group by V.state";
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Result result = new Result();

                result.setStates(rs.getString("state"));
                result.setCount(rs.getString("count"));

                stateList.add(result);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
            log.error("Error in calculateState sql statement "+ex);
        }
        System.err.println("Total rows:" + stateList.size());
        return stateList;
    }
    
    public static ArrayList calculateParty() {
        ArrayList partyList = new ArrayList();
        String sql = "SELECT partyName,count(*) as count FROM votes as V,candidates as C "
                + "where V.candidateId=C.candidateId group by partyName";
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Result result = new Result();

                result.setPartyName(rs.getString("partyName"));
                result.setCount(rs.getString("count"));

                partyList.add(result);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
            log.error("Error in calculateParty sql statement "+ex);
        }
        System.err.println("Total rows:" + partyList.size());
        return partyList;
    }

    public static Result candidateResult(String canName) {
        Result candidateResult = new Result();
        ArrayList state = new ArrayList();
        ArrayList vote = new ArrayList();
        String sql = "SELECT V.state,count(*) as count FROM votes as V,candidates as C "
                + "where V.candidateId=C.candidateId and firstName= ? and state in (SELECT stateName FROM states) group by V.state";
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, canName);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                state.add(rs.getString("state"));
                vote.add(rs.getString("count"));

            }
            candidateResult.setStateNames(state);
            candidateResult.setStateVote(vote);

        } catch (SQLException ex) {
            ex.printStackTrace();
            log.error("Error in candidateResult sql statement "+ex);
        }
        Iterator itr = candidateResult.getStateNames().iterator();
        System.out.println();
        while(itr.hasNext())
        {
            System.out.print(itr.next()+" ");
        }
        System.out.println();
        return candidateResult;
    }

    public static boolean setAdminStatus() {
        boolean result = false;
        Connection con = JDBCConnectionManager.getConnection();

        String sql = "UPDATE voters SET adminStatus = 0";

        try {

            PreparedStatement preparedStatement = con.prepareStatement(sql);

            int rs = preparedStatement.executeUpdate();

            if (rs != 0) {
                result = true;
            }

        } catch (SQLException ex) {

            ex.printStackTrace();
            log.error("Error in setAdminStatus sql statement "+ex);

        }

        return result;
    }

    public static boolean setAdminResultStatus(int i) {
        boolean result = false;
        Connection con = JDBCConnectionManager.getConnection();

        String sql = "UPDATE admins SET adminResultStatus = ?";

        try {

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setInt(1, i);
            int rs = preparedStatement.executeUpdate();

            if (rs != 0) {
                result = true;
            }

        } catch (SQLException ex) {

            ex.printStackTrace();
            log.error("Error in setAdminResultStatus sql statement "+ex);

        }

        return result;
    }
    
    public static int getAdminResultStatus() {
        int result=999;

        String sql = "SELECT adminResultStatus from admins";

        try {

            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                result = rs.getInt("adminResultStatus");
                
            }

        } catch (SQLException ex) {

            ex.printStackTrace();
            log.error("Error in getAdminResultStatus sql statement "+ex);

        }

        return result;
    }

    public static int calculateTime(String start, String end) {
        int time = 999;
        String sql = "SELECT count(*) as count FROM votes where time between ? and ?";
                
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, start);
            ps.setString(2, end);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                time = rs.getInt("count");
                
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
            log.error("Error in calculateTime sql statement "+ex);
        }
        System.err.println("Total rows:" + time);
        return time;
    }
    
}
