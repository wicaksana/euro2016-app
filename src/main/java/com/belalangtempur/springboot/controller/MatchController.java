package com.belalangtempur.springboot.controller;

import com.belalangtempur.springboot.domain.Goal;
import com.belalangtempur.springboot.domain.Match;
import com.belalangtempur.springboot.repository.MatchRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by arif on 11-8-16.
 */
@Controller
public class MatchController {
    @Autowired
    private MatchRepository repo;

    /**
     * Get all matches in the tournament
     * @return list of all matches
     */
    @RequestMapping(value = "/matches", method = RequestMethod.GET)
    public @ResponseBody List<Match> getAllMatches() {
        return repo.findAll();
    }


    @RequestMapping(value = "/match/{matchId}", method = RequestMethod.GET)
    public @ResponseBody Match getMatch(@PathVariable Long matchId) {
        return repo.findById(matchId);
    }

    /**
     * Get all goals from a match
     * @param matchId
     * @return
     */
    @RequestMapping(value = "/match/{matchId}/goals", method = RequestMethod.GET)
    public @ResponseBody List<Goal> getGoals(@PathVariable Long matchId) {
        return repo.findGoals(matchId);
    }
}
