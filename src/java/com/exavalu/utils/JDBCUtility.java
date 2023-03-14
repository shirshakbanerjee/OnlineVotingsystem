/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.utils;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;
import org.apache.log4j.Logger;

/**
 * This class reads the property file for database name, passwords driverNames etc.
 *
 */
public class JDBCUtility {
    
    static Logger log = Logger.getLogger(JDBCUtility.class.getName());

    public static JDBCUtility jdbcUtility = null;

    // in this class we will have static methods to get the connection params
    public String getPropertyValue(String param) {

        String value = null;

        //input = getClass().getResourceAsStream("settings.properties"); // Property file path in classpath
        try {

            String path = JDBCUtility.class.getClassLoader().getResource("settings.properties").getPath();

            BufferedReader input = new BufferedReader(new FileReader(path));

            Properties prop = new Properties();

            prop.load(input);

            value = prop.getProperty(param);

        } catch (IOException e) {
            // TODO Auto-generated catch block
            log.error("Faulty in getPropertyValue contents "+e);
        }

        return value;
    }

    private JDBCUtility() {
        // Private constructor
    }

    public static JDBCUtility getInstanceOfJDBCUtility() {
        if (jdbcUtility == null) {
            jdbcUtility = new JDBCUtility();
        }
        return jdbcUtility;
    }


}
