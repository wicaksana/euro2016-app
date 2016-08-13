package com.belalangtempur.springboot.repository;

import com.belalangtempur.springboot.domain.Goal;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by arif on 13-8-16.
 */
public interface GoalRepository extends JpaRepository<Goal, Long> {
    Goal findById(Long id);
}
