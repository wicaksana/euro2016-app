package com.belalangtempur.springboot.controller;

import com.belalangtempur.springboot.domain.Player;
import com.belalangtempur.springboot.repository.PlayerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by arif on 3-8-16.
 */
@Controller
public class PlayerController {
    @Autowired
    private PlayerRepository repo;

    /**
     * Get all players
     * @return
     */
    @RequestMapping(value = "/players", method = RequestMethod.GET)
    public String getAllPlayers(Model model) {

        List<Player> playerList = repo.findAll();
        if(playerList != null) {
            model.addAttribute("players", playerList);
        }
        return "players";
    }

    /**
     * get player based on his ID
     * @param playerId
     * @return
     */
    @RequestMapping(value = "/player/{playerId}", method = RequestMethod.GET)
    public String getPlayer(@PathVariable Long playerId, Model model) {
        Player player = repo.findById(playerId);
        if(player != null) {
            model.addAttribute("player", player);
        }
        return "player";
    }

}
