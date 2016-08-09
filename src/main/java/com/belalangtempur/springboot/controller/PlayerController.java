package com.belalangtempur.springboot.controller;

import com.belalangtempur.springboot.domain.Player;
import com.belalangtempur.springboot.repository.PlayerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
    public @ResponseBody List<Player> getAllPlayers() {
        return repo.findAll();
    }

    /**
     * get player based on his ID
     * @param playerId
     * @return
     */
    @RequestMapping(value = "/player/{playerId}", method = RequestMethod.GET)
    public @ResponseBody Player getPlayer(@PathVariable Long playerId) {
        return repo.findById(playerId);
    }

}
