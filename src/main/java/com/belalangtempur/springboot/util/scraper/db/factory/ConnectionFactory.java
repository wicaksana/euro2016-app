package com.belalangtempur.springboot.util.scraper.db.factory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by arif on 16-12-16.
 */
public class ConnectionFactory {

    private static Logger logger = LoggerFactory.getLogger(ConnectionFactory.class);

    private static ConnectionFactory instance = new ConnectionFactory();

    private static final String URL = "jdbc:postgresql://localhost:5432/euro2016app";
    private static final String USER = "postgres";
    private static final String PASSWORD = "postgres";
    private static final String DRIVER = "org.postgresql.Driver";

    private ConnectionFactory() {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            logger.error("cannot found driver class: " + e.getMessage());
        }
    }

    private Connection createConnection() {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            logger.error("cannot connect to database: " + e.getMessage());
        }
        return connection;
    }

    public static Connection getConnection() {
        return instance.createConnection();
    }
}
