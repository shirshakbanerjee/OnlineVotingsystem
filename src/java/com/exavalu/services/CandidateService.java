/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Candidate;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class CandidateService {
    public static ArrayList getAllCandidates()
    {
        ArrayList candidateList = new ArrayList();
        String sql = "Select * from candidates";
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next())
            {
                Candidate candidate = new Candidate();
                
                candidate.setCandidateId(rs.getInt("candidateId"));
                candidate.setFirstName(rs.getString("firstName"));
                candidate.setLastName(rs.getString("lastName"));
                candidate.setPartyName(rs.getString("partyName"));
                candidate.setGender(rs.getString("gender"));
                candidate.setAge(rs.getString("age"));
                candidate.setRegion(rs.getString("region"));
                candidate.setCandidateStatus(rs.getInt("candidateStatus"));
                
                candidateList.add(candidate);
            }
            
            
        }
        catch (SQLException ex) {
            ex.printStackTrace();
        }
        System.err.println("Total rows:"+candidateList.size());
        return candidateList;
    }
    
    public static boolean doSaveCandidate(Candidate candidate) {
        boolean result = false;
        Connection con = JDBCConnectionManager.getConnection();
        
        String sql="INSERT INTO candidates(candidateId,firstName,lastName,partyName,age,gender,region,candidateStatus)"
                + "VALUES(? ,? ,? ,? ,? ,?, ?, ?);";
        
        try {
            
            PreparedStatement preparedStatement=con.prepareStatement(sql);
            preparedStatement.setInt(1, candidate.getCandidateId());
            preparedStatement.setString(2, candidate.getFirstName());
            preparedStatement.setString(3, candidate.getLastName());
            preparedStatement.setString(4, candidate.getPartyName());
            preparedStatement.setString(5, candidate.getAge());
            preparedStatement.setString(6, candidate.getGender());
            preparedStatement.setString(7, candidate.getRegion());
            preparedStatement.setInt(8, candidate.getCandidateStatus());
            
            int rs = preparedStatement.executeUpdate();

            if(rs!=0)
            {
                result=true;
            }
            
            
        } catch (SQLException ex) {
            
            ex.printStackTrace();
            
        }
        
        return result;
    }
}
