package com.finance.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import io.github.cdimascio.dotenv.Dotenv;

public class DBConnection {

//    private static final Dotenv dotenv = Dotenv.load();
//
//    private static final String URL = dotenv.get("DB_URL");
//    private static final String USERNAME = dotenv.get("DB_USERNAME");
//    private static final String PASSWORD = dotenv.get("DB_PASSWORD");
//    private static final String CLASSNAME = dotenv.get("DB_CLASSNAME");
    
    private static final String URL =
            "jdbc:mysql://localhost:3306/personal_finance_tracker?useSSL=false";

    private static final String USERNAME = "root";

    private static final String PASSWORD = "gaurav@123";

    private static final String CLASSNAME =
            "com.mysql.cj.jdbc.Driver";

    static {
        try {
            Class.forName(CLASSNAME);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(
                URL,
                USERNAME,
                PASSWORD
        );
    }

    public static void closeConnection(Connection con , PreparedStatement psmtnt) {
        if (con != null) {
            try {
                con.close();
                psmtnt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}