package com.belalangtempur.springboot;

import com.belalangtempur.springboot.repository.PlayerRepository;
import com.belalangtempur.springboot.repository.TeamRepository;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;

/**
 * Created by arif on 24-8-16.
 */
public class ScraperTest {
    // Todo: implementation. read this: http://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-testing.html

    private static final String BASE_URL = "http://www.uefa.com/";
    private static final String BASE_TEAM = BASE_URL + "uefaeuro/season=2016/teams/";
    private static boolean SCRAPE_DATA = false;

    @Autowired
    private PlayerRepository playerRepository;

    @Autowired
    private TeamRepository teamRepository;

    @BeforeClass
    public static void init() throws IOException {
        // todo: how exactly to create preparation for unit testing?
        Document teamDoc = Jsoup.connect(BASE_TEAM).get();
        Elements teams = teamDoc.select("div.col-md-6.col-lg-6.col-sm-6.col-xs-12.teams--qualified  a");
    }

    @Test
    public void getTeamsTest() {
        // todo
    }

    @Test
    public void getPlayers() {
        // todo
    }
}
