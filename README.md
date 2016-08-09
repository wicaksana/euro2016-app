# Euro 2016 Statistics Application

## Introduction

This is a Euro 2016 app, inspired by [UEFA Euro 2016](http://www.uefa.com/uefaeuro/index.html)


## Requirements

- It should provide some statistics data about this event
- It persists data to postgresql using Hibernate
- It should use REST API
- It should be properly tested
    - unit test
    - robot framework


## Todo

1. Populate database
- scrape data from UEFA Euro
- use MySQL, or PostgreSQL
- Rough table design:
    - Players
        - id
        - name
        - country
        - dob
        - height
        - weight
        - position
        - club
        - senior_debut
        - player_id
        - conceded
        - saves
        - clearance
        - assists
        - goals
    
    - Teams
        - id
        - name
    - Matches
        - id
        - team_1
        - team_2
        - winner
        - score
    - Goals
        - id
        - scorer
        - 
        
