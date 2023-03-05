/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Party;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author SHIRSHAK
 */
public class PartyService {
    
    public static ArrayList getAllParty() {
        ArrayList partyList = new ArrayList();
        try (Connection con = JDBCConnectionManager.getConnection()){
            String sql = "Select * from party";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println("RS:" + rs);
            while (rs.next()) {
                Party party = new Party();
                party.setPartyId(rs.getInt("partyId"));
                party.setPartyName(rs.getString("partyName"));
                partyList.add(party);
            }
        } catch (SQLException ex) {
        }
        
            System.out.println("Party List:" + partyList.size());
            
            return partyList;
    }
    
}
