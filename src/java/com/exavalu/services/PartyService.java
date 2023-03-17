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
import java.util.List;
import org.apache.log4j.Logger;

/**
 *
 * This is Party Service
 */
public class PartyService {

    private static final Logger log = Logger.getLogger(PartyService.class.getName());

    public static List getAllParty() {
        List<Party> partyList = new ArrayList<>();
        try (Connection con = JDBCConnectionManager.getConnection()) {
            String sql = "Select * from party";
            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                try (ResultSet rs = preparedStatement.executeQuery()) {
                    System.out.println("RS:" + rs);
                    while (rs.next()) {
                        Party party = new Party();
                        party.setPartyId(rs.getInt("partyId"));
                        party.setPartyName(rs.getString("partyName"));
                        partyList.add(party);
                    }
                }
            }
        } catch (SQLException ex) {
            if (log.isEnabledFor(org.apache.log4j.Level.ERROR)) {
                log.error("Error in getAllParty sql statement ", ex);
            }
        }

        System.out.println("Party List:" + partyList.size());

        return partyList;
    }

}
