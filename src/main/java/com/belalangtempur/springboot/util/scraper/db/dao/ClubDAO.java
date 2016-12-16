package com.belalangtempur.springboot.util.scraper.db.dao;

import com.belalangtempur.springboot.util.scraper.db.dto.Club;
import com.belalangtempur.springboot.util.scraper.db.factory.ConnectionFactory;
import com.belalangtempur.springboot.util.scraper.db.util.CloseHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by arif on 16-12-16.
 */
public class ClubDAO implements GenericDAO<Club> {

    private static Logger logger = LoggerFactory.getLogger(ClubDAO.class);

    private Connection connection;
    private PreparedStatement ps;

    private static final String TABLE_NAME = "euro2016app.club";

    private static final String ID = "id";
    private static final String NAME = "name";


    /**
     * Adds a club
     * @param club
     * @throws SQLException
     */
    public void add(final Club club) throws SQLException {

        String query = "INSERT INTO " + TABLE_NAME + " " +
                "(" + NAME + ") VALUES " +
                "(?)";

        try {
            connection = ConnectionFactory.getConnection();
            ps = connection.prepareStatement(query);

            ps.setString(1, club.getName());

            ps.executeUpdate();
            logger.info("Insert new team: " + ps.toString());

        } finally {
            CloseHelper.closeAll(connection, ps);
        }
    }

    /**
     * Adds a bulk of clubs
     * @param clubs
     * @throws SQLException
     */
    public void add(final List<Club> clubs) throws SQLException {
        for (Club club : clubs) {
            add(club);
        }
    }

    /**
     * Finds a club based on its ID
     * @param id
     * @return
     * @throws SQLException
     */
    public Club find(final Integer id) throws SQLException {
        String query = "SELECT * FROM " + TABLE_NAME + " " +
                "WHERE " + NAME + "=?";

        ResultSet rs = null;
        Club result = new Club();

        try {
            connection = ConnectionFactory.getConnection();
            ps = connection.prepareStatement(query);

            ps.setInt(1, id);

            rs = ps.executeQuery();
            logger.info("Query a team: " + ps.toString());

            while (rs.next()) {
                result.setId(rs.getInt(ID));
                result.setName(rs.getString(NAME));
            }

        } finally {
            CloseHelper.close(rs);
            CloseHelper.close(ps);
            CloseHelper.close(connection);
        }

        return result;
    }

    /**
     * Finds a club based on its name
     * @param name
     * @return
     * @throws SQLException
     */
    public Club find(final String name) throws SQLException {
        String query = "SELECT * FROM " + TABLE_NAME + " " +
                "WHERE " + NAME + "=?";

        ResultSet rs = null;
        Club result = new Club();

        try {
            connection = ConnectionFactory.getConnection();
            ps = connection.prepareStatement(query);

            ps.setString(1, name);

            rs = ps.executeQuery();
            logger.info("Find a Team: " + ps.toString());

            while (rs.next()) {
                result.setId(rs.getInt(ID));
                result.setName(rs.getString(NAME));
            }
        } finally {
            CloseHelper.closeAll(connection, ps, rs);
        }

        return result;
    }

    /**
     * updates a club record
     * @param club
     * @throws SQLException
     */
    public void update(Club club) throws SQLException {

        String query = "UPDATE " + TABLE_NAME + " " +
                "SET " + NAME + "=?" +
                "WHERE ID=?";

        try {
            connection = ConnectionFactory.getConnection();
            ps = connection.prepareStatement(query);

            ps.setString(1, club.getName());
            ps.setInt(2, club.getId());

            ps.executeUpdate();
            logger.info("Update a team: " + ps.toString());
        } finally {
            CloseHelper.close(ps);
            CloseHelper.close(connection);
        }
    }

    /**
     * Deletes a club record using its ID as reference
     * @param id
     * @throws SQLException
     */
    public void delete(Integer id) throws SQLException {
        String query = "DELETE FROM " + TABLE_NAME + " WHERE " + ID + "=?";

        try {
            connection = ConnectionFactory.getConnection();
            ps = connection.prepareStatement(query);

            ps.setInt(1, id);

            ps.executeUpdate();
            logger.info("Delete team: " + ps.toString());

        } finally {
            CloseHelper.close(ps);
            CloseHelper.close(connection);
        }
    }

    /**
     * Deletes all club records
     * @throws SQLException
     */
    public void deleteAll() throws SQLException {
        String query = "DELETE FROM " + TABLE_NAME;

        try {
            connection = ConnectionFactory.getConnection();
            ps = connection.prepareStatement(query);

            ps.executeUpdate();
            logger.info("Delete team(s): " + ps.toString());
        } finally {
            CloseHelper.close(ps);
            CloseHelper.close(connection);
        }
    }
}
