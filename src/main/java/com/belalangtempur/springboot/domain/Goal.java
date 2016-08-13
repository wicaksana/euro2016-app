package com.belalangtempur.springboot.domain;

import javax.persistence.*;

/**
 * Created by arif on 3-8-16.
 */
@Entity
public class Goal {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    Long id;
    @OneToOne
    Player scorer;
    @OneToOne
    @JoinColumn(name = "\"match\"")
    Match match;
    Integer minute;

    public Goal(Player scorer, Match match, Integer min) {
        this.scorer = scorer;
        this.match = match;
        this.minute = min;
    }

    public Goal() {}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Player getScorer() {
        return scorer;
    }

    public void setScorer(Player scorer) {
        this.scorer = scorer;
    }

    public Match getMatch() {
        return match;
    }

    public void setMatch(Match match) {
        this.match = match;
    }

    public Integer getMinute() {
        return minute;
    }

    public void setMinute(Integer minute) {
        this.minute = minute;
    }
}
