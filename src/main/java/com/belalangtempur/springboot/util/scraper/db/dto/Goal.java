package com.belalangtempur.springboot.util.scraper.db.dto;

/**
 * Created by arif on 16-12-16.
 */
public class Goal {
    private Integer id;
    private Integer scorerId;
    private Integer matchId;
    private Integer minute;

    public Integer getId() {
        return id;
    }

    public Integer getScorerId() {
        return scorerId;
    }

    public void setScorerId(Integer scorerId) {
        this.scorerId = scorerId;
    }

    public Integer getMatchId() {
        return matchId;
    }

    public void setMatchId(Integer matchId) {
        this.matchId = matchId;
    }

    public Integer getMinute() {
        return minute;
    }

    public void setMinute(Integer minute) {
        this.minute = minute;
    }
}
