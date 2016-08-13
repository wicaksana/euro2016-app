package com.belalangtempur.springboot.repository;

import com.belalangtempur.springboot.domain.Player;
import com.belalangtempur.springboot.domain.Team;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Created by arif on 5-8-16.
 */
public interface TeamRepository extends JpaRepository<Team, Long> {
    Team findByName(String name);

    Team findById(Long id);

    @Query("SELECT p FROM Player p WHERE p.team.id = :teamId")
    List<Player> findPlayers(@Param("teamId") Long teamId);
}
