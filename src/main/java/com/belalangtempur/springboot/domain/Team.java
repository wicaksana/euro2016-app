package com.belalangtempur.springboot.domain;

import javax.persistence.*;

/**
 * Created by arif on 3-8-16.
 */
@Entity
public class Team {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    Long id;
    @Column(unique = true)
    String name;

    public Team(String name) {
        this.name = name;
    }

    public Team() {}

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
}
