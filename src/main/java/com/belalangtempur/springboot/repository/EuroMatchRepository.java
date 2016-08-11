package com.belalangtempur.springboot.repository;

import com.belalangtempur.springboot.domain.EuroMatch;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by arif on 11-8-16.
 */
public interface EuroMatchRepository extends JpaRepository<EuroMatch, Long> {
    EuroMatch findById(Long id);
}
