package com.belalangtempur.springboot.util.scraper.db.dao;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by arif on 16-12-16.
 */
public interface GenericDAO<V> {
    /**
     * Adds item
     * @param item
     * @throws SQLException
     */
    public void add(final V item) throws SQLException;

    /**
     * Adds list of items
     * @param items
     * @throws SQLException
     */
    public void add(List<V> items) throws SQLException;

    /**
     * Finds an item based on its ID
     * @param id
     * @throws SQLException
     */
    public V find(final Integer id) throws SQLException;

    /**
     * Updates an item with reference of its ID
     * @param item
     * @throws SQLException
     */
    public void update(final V item) throws SQLException;

    /**
     * Deletes an item with reference to its ID
     * @param id
     * @throws SQLException
     */
    public void delete(final Integer id) throws SQLException;

    /**
     * Deletes all records
     * @throws SQLException
     */
    public void deleteAll() throws SQLException;
}
