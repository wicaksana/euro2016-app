package com.belalangtempur.springboot.domain;

import javax.persistence.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by arif on 3-8-16.
 */
@Entity
public class Player {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    Long id;
    String name;
    @ManyToOne
    Team team;
    Date dob;  // date of birth
    Integer height;
    Integer weight;
    String position;
    String club;
    Date debut;  // senior debut

    @Transient  // use @Transient, so that it is not persisted by JPA
    private final SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

    public Player(String name, Team team, String dob, Integer height, Integer weight, String position, String club, String debut)throws Exception {
        this.name = name;
        this.team = team;
        this.dob = format.parse(dob);
        this.height = height;
        this.weight = weight;
        this.position = position;
        this.club = club;
        this.debut = format.parse(debut);
    }

    Player() {}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Team getTeam() {
        return team;
    }

    public void setTeam(Team team) {
        this.team = team;
    }

    public String getDob() {
        return format.format(this.dob);
    }

    public void setDob(String dob) throws ParseException {
        this.dob = format.parse(dob);
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

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getClub() {
        return club;
    }

    public void setClub(String club) {
        this.club = club;
    }

    public String getDebut() {
        return format.format(this.debut);
    }

    public void setDebut(String debut) throws ParseException {
        this.debut = format.parse(debut);
    }
}
