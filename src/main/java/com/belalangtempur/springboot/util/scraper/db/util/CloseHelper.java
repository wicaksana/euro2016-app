package com.belalangtempur.springboot.util.scraper.db.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by arif on 16-12-16.
 */
public class CloseHelper {

    private static Logger logger = LoggerFactory.getLogger(CloseHelper.class);

    /**
     * Closes connection
     * @param connection
     */
    public static void close(final Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                logger.error("Cannot close SQL connection: " + e.getMessage());
            }
        }
    }

    /**
     * Closes statement
     * @param statement
     */
    public static void close(final Statement statement) {
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                logger.error("Cannot close Statement: " + e.getMessage());
            }
        }
    }

    /**
     * Closes resultset
     * @param resultSet
     */
    public static void close(final ResultSet resultSet) {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                logger.error("Cannot close ResultSet: " + e.getMessage());
            }
        }
    }

    /**
     * Closes connection, statement, and resultset altogether
     * @param connection
     * @param statement
     * @param resultSet
     */
    public static void closeAll(final Connection connection, final Statement statement, final ResultSet resultSet) {
        close(resultSet);
        close(statement);
        close(connection);
    }

    /**
     * Closes connection and statement
     * @param connection
     * @param statement
     */
    public static void closeAll(final Connection connection, final Statement statement) {
        close(statement);
        close(connection);
    }
}
