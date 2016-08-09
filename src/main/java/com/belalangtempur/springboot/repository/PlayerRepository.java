package com.belalangtempur.springboot.repository;

import com.belalangtempur.springboot.domain.Player;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by arif on 3-8-16.
 */
public interface PlayerRepository extends JpaRepository<Player, Long> {
    Player findById(Long id);
}
