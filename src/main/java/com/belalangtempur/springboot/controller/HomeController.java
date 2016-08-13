package com.belalangtempur.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by arif on 13-8-16.
 */
@Controller
public class HomeController {
    @RequestMapping("/")
    public String index() {
        return "index";
    }
}
