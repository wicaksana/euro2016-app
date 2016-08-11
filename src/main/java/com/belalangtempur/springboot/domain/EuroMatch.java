package com.belalangtempur.springboot.domain;

import javax.persistence.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by arif on 3-8-16.
 */
@Entity
public class EuroMatch {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    Long id;
    @ManyToOne
    Team team1;
    @ManyToOne
    Team team2;
    Date date;
    String phase;
    String stadium;

    @Transient
    private final SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

    public EuroMatch(Team team1, Team team2, String date, String phase, String stadium) throws ParseException {
        this.team1 = team1;
        this.team2 = team2;
        this.date = format.parse(date);
        this.phase = phase;
        this.stadium = stadium;
    }

    public EuroMatch() {}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Team getTeam1() {
        return team1;
    }

    public void setTeam1(Team team1) {
        this.team1 = team1;
    }

    public Team getTeam2() {
        return team2;
    }

    public void setTeam2(Team team2) {
        this.team2 = team2;
    }

    public String getDate() {
        return format.format(this.date);
    }

    public void setDate(String date) throws ParseException {
        this.date = format.parse(date);
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
