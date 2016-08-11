package com.belalangtempur.springboot.controller;

import com.belalangtempur.springboot.domain.EuroMatch;
import com.belalangtempur.springboot.repository.EuroMatchRepository;
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
public class EuroMatchController {
    @Autowired
    private EuroMatchRepository repo;

    /**
     * Get all matches in the tournament
     * @return list of all matches
     */
    @RequestMapping(value = "/matches", method = RequestMethod.GET)
    public @ResponseBody List<EuroMatch> getAllMatches() {
        return repo.findAll();
    }


    @RequestMapping(value = "/match/{matchId}", method = RequestMethod.GET)
    public @ResponseBody EuroMatch getMatch(@PathVariable Long matchId) {
        return repo.findById(matchId);
    }
}
