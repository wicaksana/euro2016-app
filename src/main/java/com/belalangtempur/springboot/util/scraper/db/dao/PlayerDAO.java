package com.belalangtempur.springboot.util.scraper.db.dao;

import com.belalangtempur.springboot.util.scraper.db.dto.Player;
import com.belalangtempur.springboot.util.scraper.db.factory.ConnectionFactory;
import com.belalangtempur.springboot.util.scraper.db.util.CloseHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by arif on 16-12-16.
 */
public class PlayerDAO implements GenericDAO<Player>{

    private static final Logger logger = LoggerFactory.getLogger(PlayerDAO.class);

    private Connection connection;
    private PreparedStatement ps;

    private static final String TABLE_NAME = "euro2016app.player";

    private static final String ID = "id";
    private static final String NAME = "name";
    private static final String TEAM_ID = "team_id";
    private static final String DOB = "dob";
    private static final String HEIGHT = "height";
    private static final String WEIGHT = "weight";
    private static final String PLAY_POSITION = "play_position";
    private static final String CLUB_ID = "club_id";
    private static final String SENIOR_DEBUT = "senior_debut";

    /**
     * Adds a player
     * @param player
     * @throws SQLException
     */
    public void add(Player player) throws SQLException {

        String query = "INSERT INTO " + TABLE_NAME + " " +
                "(" + NAME + ", " + TEAM_ID + ", " + DOB + ", " + HEIGHT + ", " + WEIGHT + ", " + PLAY_POSITION + ", " + CLUB_ID + ", " + SENIOR_DEBUT + ") VALUES " +
                "(?,?,?,?,?,?,?,?)";

        try {
            connection = ConnectionFactory.getConnection();
            ps = connection.prepareStatement(query);

            ps.setString(1, player.getName());
            ps.setInt(2, player.getTeamId());
            ps.setDate(3, player.getDob());
            ps.setInt(4, player.getHeight());
            ps.setInt(5, player.getWeight());
            ps.setString(6, player.getPlayingPosition());
            ps.setInt(7, player.getClubId());
            ps.setDate(8, player.getSeniorDebut());

            ps.executeUpdate();
            logger.info("Add a player: " + ps.toString());

        } catch (SQLException e) {
            logger.error("Error on adding a player(" + player + "): " + e.getMessage());
        } finally {
            CloseHelper.closeAll(connection, ps);
        }
    }

    public void add(List<Player> items) throws SQLException {

    }

    public Player find(Integer id) throws SQLException {
        return null;
    }

    public void update(Player item) throws SQLException {

    }

    public void delete(Integer id) throws SQLException {

    }

    public void deleteAll() throws SQLException {

    }

}
