package com.belalangtempur.springboot.util.scraper.db.dto;

import java.sql.Date;

/**
 * Created by arif on 16-12-16.
 */
public class Match {

    private Integer id;
    private Integer team1Id;
    private Integer team2Id;
    private Date playingDate;
    private String phase;
    private String stadium;

    public Integer getId() {
        return id;
    }

    public Integer getTeam1Id() {
        return team1Id;
    }

    public void setTeam1Id(Integer team1Id) {
        this.team1Id = team1Id;
    }

    public Integer getTeam2Id() {
        return team2Id;
    }

    public void setTeam2Id(Integer team2Id) {
        this.team2Id = team2Id;
    }

    public Date getPlayingDate() {
        return playingDate;
    }

    public void setPlayingDate(Date playingDate) {
        this.playingDate = playingDate;
    }

    public String getPhase() {
        return phase;
    }

    public void setPhase(String phase) {
        this.phase = phase;
    }

    public String getStadium() {
        return stadium;
    }

    public void setStadium(String stadium) {
        this.stadium = stadium;
    }
}
