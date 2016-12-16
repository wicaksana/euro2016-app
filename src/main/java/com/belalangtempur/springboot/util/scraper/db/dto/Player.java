package com.belalangtempur.springboot.util.scraper.db.dto;

import java.sql.Date;

/**
 * Created by arif on 16-12-16.
 */
public class Player {
    private Integer id;
    private String name;
    private Integer teamId;
    private Date dob;
    private Integer height;
    private Integer weight;
    private String playingPosition;
    private Integer clubId;
    private Date seniorDebut;

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getTeamId() {
        return teamId;
    }

    public void setTeamId(Integer teamId) {
        this.teamId = teamId;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public Integer getHeight() {
        return height;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }

    public Integer getWeight() {
        return weight;
    }

    public void setWeight(Integer weight) {
        this.weight = weight;
    }

    public String getPlayingPosition() {
        return playingPosition;
    }

    public void setPlayingPosition(String playingPosition) {
        this.playingPosition = playingPosition;
    }

    public Integer getClubId() {
        return clubId;
    }

    public void setClubId(Integer clubId) {
        this.clubId = clubId;
    }

    public Date getSeniorDebut() {
        return seniorDebut;
    }

    public void setSeniorDebut(Date seniorDebut) {
        this.seniorDebut = seniorDebut;
    }

    @Override
    public String toString() {
        return "Player{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", teamId=" + teamId +
                ", dob=" + dob +
                ", height=" + height +
                ", weight=" + weight +
                ", playingPosition='" + playingPosition + '\'' +
                ", clubId=" + clubId +
                ", seniorDebut=" + seniorDebut +
                '}';
    }
}
