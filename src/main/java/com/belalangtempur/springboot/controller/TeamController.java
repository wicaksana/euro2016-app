package com.belalangtempur.springboot.controller;

import com.belalangtempur.springboot.domain.Player;
import com.belalangtempur.springboot.domain.Team;
import com.belalangtempur.springboot.repository.TeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by arif on 9-8-16.
 */
@Controller
public class TeamController {
    @Autowired
    private TeamRepository repo;

    /**
     * Return all teams
     * @return
     */
    @RequestMapping(value = "/teams", method = RequestMethod.GET)
    public @ResponseBody List<Team> getTeams() {
        return repo.findAll();
    }

    @RequestMapping(value = "/team/{teamId}", method = RequestMethod.GET)
    public @ResponseBody Team getTeam(@PathVariable Long teamId) {
        return repo.findById(teamId);
    }

    @RequestMapping(value = "/team/{teamId}/players", method = RequestMethod.GET)
    public @ResponseBody List<Player> getPlayersOfATeam(@PathVariable Long teamId) {
        return repo.findPlayers(teamId);
    }

}
