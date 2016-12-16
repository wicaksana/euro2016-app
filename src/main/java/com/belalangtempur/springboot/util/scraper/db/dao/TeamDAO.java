package com.belalangtempur.springboot.util.scraper.db.dao;

import com.belalangtempur.springboot.util.scraper.db.dto.Team;
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
public class TeamDAO implements GenericDAO<Team> {

    private static final Logger logger = LoggerFactory.getLogger(TeamDAO.class);

    private Connection connection;
    private PreparedStatement ps;

    private static final String TABLE_NAME = "euro2016app.team";

    private static final String ID = "id";
    private static final String NAME = "name";

    /**
     * See interface
     * @param team
     * @throws SQLException
     */
    public void add(final Team team) throws SQLException {

        String query = "INSERT INTO " + TABLE_NAME + " " +
                "(" + NAME + ") VALUES " +
                "(?)";

        try {
            connection = ConnectionFactory.getConnection();
            ps = connection.prepareStatement(query);

            ps.setString(1, team.getName());

            ps.executeUpdate();
            logger.info("Insert new team: " + ps.toString());

        } finally {
            CloseHelper.closeAll(connection, ps);
        }
    }

    /**
     * add Teams to database
     * @param teams
     * @throws SQLException
     */
    public void add(final List<Team> teams) throws SQLException {

        for (Team team : teams) {
            add(team);
        }
    }

    /**
     * Find a Team based on the ID
     * @param id
     * @return
     * @throws SQLException
     */
    public Team find(final Integer id) throws SQLException {
        String query = "SELECT * FROM " + TABLE_NAME + " " +
                "WHERE " + ID + "=?";

        ResultSet rs = null;
        Team result = new Team();

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
     * Finds a team based on its name
     * @param name
     * @return
     * @throws SQLException
     */
    public Team find(final String name) throws SQLException {

        String query = "SELECT * FROM " + TABLE_NAME + " " +
                "WHERE " + NAME + "=?";

        ResultSet rs = null;
        Team result = new Team();

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
     * Update a record
     * @param team
     * @throws SQLException
     */
    public void update(final Team team) throws SQLException {

        String query = "UPDATE " + TABLE_NAME + " " +
                "SET " + NAME + "=?" +
                "WHERE ID=?";

        try {
            connection = ConnectionFactory.getConnection();
            ps = connection.prepareStatement(query);

            ps.setString(1, team.getName());
            ps.setInt(2, team.getId());

            ps.executeUpdate();
            logger.info("Update a team: " + ps.toString());
        } finally {
            CloseHelper.close(ps);
            CloseHelper.close(connection);
        }
    }

    /**
     * Deletes a team
     * @param id
     * @throws SQLException
     */
    public void delete(final Integer id) throws SQLException {
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
     * Deletes all team records
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
