/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Result;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

/**
 *
 * @author Admin
 */
public class ResultService {

    public static ArrayList calculateResult() {
        ArrayList resultList = new ArrayList();
        String sql = "SELECT V.candidateId,C.firstName,C.lastName,count(*) as votes FROM onlinevotingdb.votes as V,onlinevotingdb.candidates as C "
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
                

                resultList.add(result);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
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
        }
        System.err.println("Total rows:" + stateList.size());
        return stateList;
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
    
}
