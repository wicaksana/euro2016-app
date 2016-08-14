package com.belalangtempur.springboot.controller;

import com.belalangtempur.springboot.domain.Goal;
import com.belalangtempur.springboot.repository.GoalRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by arif on 13-8-16.
 */
@Controller
public class GoalController {
    @Autowired
    GoalRepository repo;

    @RequestMapping(value = "/goals", method = RequestMethod.GET)
    public String getAllGoals(Model model) {
        List<Goal> goalList = repo.findAll();
        if(goalList != null) {
            model.addAttribute("goals", goalList);
        }
        return "goals";
    }

    @RequestMapping(value = "/goal/{goalId}", method = RequestMethod.GET)
    public String getGoalById(@PathVariable Long goalId, Model model) {

        Goal goal = repo.findById(goalId);
        if(goal != null) {
            model.addAttribute("goal", goal);
        }
        return "goal";
    }
}
