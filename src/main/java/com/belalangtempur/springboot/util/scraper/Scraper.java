package com.belalangtempur.springboot.util.scraper;

import com.belalangtempur.springboot.util.scraper.db.dao.ClubDAO;
import com.belalangtempur.springboot.util.scraper.db.dao.PlayerDAO;
import com.belalangtempur.springboot.util.scraper.db.dao.TeamDAO;
import com.belalangtempur.springboot.util.scraper.db.dto.Club;
import com.belalangtempur.springboot.util.scraper.db.dto.Player;
import com.belalangtempur.springboot.util.scraper.db.dto.Team;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by arif on 16-12-16.
 */
public class Scraper {

    private static final Logger logger = LoggerFactory.getLogger(Scraper.class);

    private final static String BASE_URL = "http://www.uefa.com/uefaeuro";
    private final static String TEAM = "/uefaeuro/season=2016/teams/";

    private URL mainUrl = null;
    private URL allTeamsUrl = null;

    private List<String> teams;

    public Scraper() {

        teams = new ArrayList<String>();

        try {
            mainUrl = new URL(BASE_URL);
            allTeamsUrl = new URL(mainUrl, TEAM);
        } catch (MalformedURLException e) {
            logger.error("Cannot form URL: " + e.getMessage());
        }
    }

    /**
     * Runner
     */
    public void run() {
        try {
            Document doc = Jsoup.connect(getAllTeamsUrl()).get();

            Elements countries = doc.select("span.team-name_name");
            Elements countryLinks = doc.select("a.team-hub_link");

            saveCountries(countries);

            for (Element link : countryLinks) {
                try {
                    URL countryUrl = new URL(mainUrl, link.attr("href"));

                    logger.info("Parse team " + link.text());
                    parseTeam(countryUrl.toString());
                } catch (InterruptedException e) {
                    logger.error("Error on parsing team " + link.text() + e.getMessage());
                }
            }

        } catch (IOException e) {
            logger.error("cannot fetch main URL: " + e.getMessage());
        }

    }

    /**
     * Parses team URI and gets players' URI
     * @param teamUrl
     * @throws InterruptedException
     */
    public void parseTeam(final String teamUrl) throws InterruptedException {
        try {
            Document countryDoc = Jsoup.connect(teamUrl).get();

            Elements players = countryDoc.select("a.squad--player-img");

            for (Element player : players) {
                parsePlayer(player);
            }

        } catch (IOException e) {
            logger.error("Error on fetching country URL: " + e.getMessage());
        }
    }

    /**
     * gets all players from a team and save it to the database
     * @param player player's element
     */
    private void parsePlayer(Element player) throws InterruptedException {
        try {
            PlayerDAO playerDAO = new PlayerDAO();
            Player addedPlayer = new Player();

            URL playerURL = new URL(mainUrl, player.attr("href"));

            try {
                Document doc = Jsoup.connect(playerURL.toString()).get();

                Element playerHeader = doc.select("div.player-header_content").first();
                if (playerHeader != null) { // check if indeed a player page by looking at the presence of div.player-header_content

                    try {
                        addedPlayer.setName(elementSelector(doc, "Name"));
                        addedPlayer.setHeight(parseHeightWeight(elementSelector(doc, "Height")));
                        addedPlayer.setWeight(parseHeightWeight(elementSelector(doc, "Weight")));
                        addedPlayer.setClubId(getClubId(elementSelector(doc, "Club")));
                        addedPlayer.setPlayingPosition(elementSelector(doc, "Position"));
                        addedPlayer.setDob(parseDate(elementSelector(doc, "Date")));
                        addedPlayer.setTeamId(getTeamId(elementSelector(doc, "Country")));
                        addedPlayer.setSeniorDebut(parseDate(elementSelector(doc, "Senior")));
                    } catch (NullPointerException e) {
                        logger.error("Error on appending addedPlayer properties: " + e.getMessage());
                    }

                    try {
                        playerDAO.add(addedPlayer);
                        logger.info("added player: " + addedPlayer.getName());
                    } catch (SQLException e) {
                        logger.error("Error on adding a player (" + addedPlayer + "): " + e.getMessage());
                    }

                } else {
                    logger.error("This is not a page player");
                    return; // the page is not a player page. Leave it.
                }

            } catch (IOException e) {
                logger.error("Error on fetching player URL: " + e.getMessage());
            }

            // be nice!
            Thread.sleep(1000);

        } catch (MalformedURLException e) {
            logger.error("Cannot form player URL: " + e.getMessage());
        }
    }

    public String getMainUrl() {
        return mainUrl.toString();
    }

    public String getAllTeamsUrl() {
        return allTeamsUrl.toString();
    }

    public List<String> getTeams() {
        return teams;
    }


    /**
     * Save countries to the database and the list
     * @param countries
     */
    private void saveCountries(final Elements countries) {
        TeamDAO teamDAO = new TeamDAO();
        for (Element country : countries) {
            try {
                teamDAO.add(new Team(country.text()));
            } catch (SQLException e) {
                logger.error("Error inserting new team: " + e.getMessage());
            }
            teams.add(country.text());
        }

    }

    /**
     * Returns the text of interest from an element
     * @param doc
     * @param contains
     * @return
     */
    private String elementSelector(final Document doc, final String contains) {
        String result = "0";
        String selector = String.format("span.profile--list--label:contains(%s)", contains);
        try {
            result = doc.select(selector).first().nextElementSibling().text();
        } catch (NullPointerException e) {
            logger.error("The page does not contain the respective element: " + e.getMessage());
        }

        return result;
    }

    /**
     * parses date for dob and senior debut
     * See pattern matching solution used in http://stackoverflow.com/questions/18591242/java-extract-date-from-string-using-regex-failing
     * @param text
     * @return
     */
    private Date parseDate(final String text) {
        Date result = null;

        String parsedText = "";
        Matcher m = Pattern.compile("(0[1-9]|[12][0-9]|3[01])[- \\/.](0[1-9]|1[012])[- \\/.](19|20)\\d\\d").matcher(text);
        while (m.find()) {
            parsedText = m.group();
        }

        try {
            SimpleDateFormat parsedDate = new SimpleDateFormat("dd/MM/yyyy");
            java.util.Date utilDate = parsedDate.parse(parsedText);
            result = new Date(utilDate.getTime());
        } catch (ParseException e) {
            logger.error("Error on parsing date: " + e.getMessage());
        }

        return result;
    }

    /**
     * Parses height and weight attributes
     * @param text
     * @return height/weight in Integer
     */
    private Integer parseHeightWeight(final String text) {
        String parsedText = "";
        Matcher m = Pattern.compile("\\d+").matcher(text);
        while (m.find()) {
            parsedText = m.group();
        }

        return Integer.parseInt(parsedText);
    }

    /**
     * Gets team ID
     * @param country
     * @return team ID. Non-existent team is identified by -1
     */
    private Integer getTeamId(final String country) {
        Integer result = -1;
        TeamDAO teamDAO = new TeamDAO();
        try {
            result = teamDAO.find(country).getId();
        } catch (SQLException e) {
            logger.error("Error on fetching team ID: " + e.getMessage());
        }

        return result;
    }

    /**
     * Gets club ID. Create one if not exist yet.
     * @param club
     * @return club ID
     */
    private Integer getClubId(final String club) {
        Integer result = -1;
        ClubDAO clubDAO = new ClubDAO();
        try {
            if (clubDAO.find(club).getId() == null) {
                clubDAO.add(new Club(club));
            }
            result = clubDAO.find(club).getId();
        } catch (SQLException e) {
            logger.error("Error on fetching club ID: " + e.getMessage());
        }

        return result;
    }
}
