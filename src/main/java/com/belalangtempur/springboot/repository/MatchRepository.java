package com.belalangtempur.springboot.repository;

import com.belalangtempur.springboot.domain.Goal;
import com.belalangtempur.springboot.domain.Match;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Created by arif on 11-8-16.
 */
public interface MatchRepository extends JpaRepository<Match, Long> {
    Match findById(Long id);

    List<Match> findByPhase(String phase);

    @Query("SELECT g FROM Goal g WHERE g.match.id = :matchId")
    List<Goal> findGoals(@Param("matchId") Long matchId);
}
