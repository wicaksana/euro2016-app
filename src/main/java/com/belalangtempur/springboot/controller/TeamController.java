package com.belalangtempur.springboot.controller;

import com.belalangtempur.springboot.domain.Player;
import com.belalangtempur.springboot.domain.Team;
import com.belalangtempur.springboot.repository.TeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    public String getTeams(Model model) {

        List<Team> teamList =  repo.findAll();
        if (teamList != null) {
            model.addAttribute("teams", teamList);
        }
        return "teams";
    }

    /**
     * return data related to a specific team
     * @param teamId
     * @param model
     * @return team information, list of players
     */
    @RequestMapping(value = "/team/{teamId}", method = RequestMethod.GET)
    public String getTeam(@PathVariable Long teamId, Model model) {

        Team team =  repo.findById(teamId);
        if (team != null) {
            model.addAttribute("team", team);
        }

        List<Player> playerList = repo.findPlayers(teamId);
        if(playerList != null) {
            model.addAttribute("players", playerList);
        }

        return "team";
    }
}
