package com.belalangtempur.springboot.util.scraper.db.dto;

/**
 * Created by arif on 16-12-16.
 */
public class Club {
    private Integer id;
    private String name;

    public Club() {}

    public Club(final String name) {
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(final Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
