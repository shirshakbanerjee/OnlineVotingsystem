package com.exavalu.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import org.apache.log4j.Logger;

/**
 * The Connection Manager (CM), which pools and manages connections within an application server.
 *
 */
public class JDBCConnectionManager {
    
    static Logger log = Logger.getLogger(JDBCConnectionManager.class.getName());

    public static Connection connection = null;

    public static Connection getConnection() {

        JDBCUtility jdbcUtility = JDBCUtility.getInstanceOfJDBCUtility();

        String user = jdbcUtility.getPropertyValue("user");
        String password = jdbcUtility.getPropertyValue("pass");
        String dbNname = jdbcUtility.getPropertyValue("dbName");
        String url = jdbcUtility.getPropertyValue("url");
        

        try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(url + dbNname, user, password);

        } catch (ClassNotFoundException | SQLException ex) {
            log.error("Faulty in JDBCConnectionManager contents "+ex);
        }

        return connection;
    }

}
