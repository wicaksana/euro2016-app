package com.belalangtempur.springboot;

import com.belalangtempur.springboot.domain.Match;
import com.belalangtempur.springboot.domain.Goal;
import com.belalangtempur.springboot.domain.Player;
import com.belalangtempur.springboot.domain.Team;
import com.belalangtempur.springboot.repository.MatchRepository;
import com.belalangtempur.springboot.repository.GoalRepository;
import com.belalangtempur.springboot.repository.PlayerRepository;
import com.belalangtempur.springboot.repository.TeamRepository;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.hamcrest.Matchers.*;
/**
 * Testing REST service
 */

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest
public class Euro2016AppApplicationTests {
    //https://spring.io/guides/tutorials/bookmarks/

    @Autowired
	private PlayerRepository playerRepository;
    @Autowired
    private TeamRepository teamRepository;
    @Autowired
    private MatchRepository matchRepository;
    @Autowired
    private GoalRepository goalRepository;

    private List<Team> teams = new ArrayList<>();
    private List<Player> players = new ArrayList<>();
    private Match match;
    private List<Goal> goals = new ArrayList<>();

    @Autowired
    private WebApplicationContext webApplicationContext;
    private MockMvc mockMvc;
    private MediaType contentType = new MediaType(MediaType.APPLICATION_JSON.getType(),
                                                  MediaType.APPLICATION_JSON.getSubtype(),
                                                  Charset.forName("utf-8"));
    private HttpMessageConverter mappingJackson2HttpMessageConverter;

    @Autowired
    void setConverters(HttpMessageConverter<?>[] converters) {
        this.mappingJackson2HttpMessageConverter = Arrays.asList(converters)
                .stream()
                .filter(hmc -> hmc instanceof MappingJackson2HttpMessageConverter)
                .findAny()
                .get();

        Assert.assertNotNull("the JSON message converter must not be null", this.mappingJackson2HttpMessageConverter);
    }

    @Before
    public void setup() throws Exception {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
        this.goalRepository.deleteAllInBatch();
        this.playerRepository.deleteAllInBatch(); // ??
        this.matchRepository.deleteAllInBatch();
        this.teamRepository.deleteAllInBatch();
        System.out.println("initiate teams..");
        this.teams.add(teamRepository.save(new Team("France")));
        this.teams.add(teamRepository.save(new Team("Portugal")));
        System.out.println("initiate players..");
        this.players.add(playerRepository.save(new Player("Antoine Griezmann",
                                                          teamRepository.findByName("France"),
                                                          "1991-03-21",
                                                          176,
                                                          67,
                                                          "Forward",
                                                          "Atlético",
                                                          "2014-03-05")));

        this.players.add(playerRepository.save(new Player("Éder",
                                                            teamRepository.findByName("Portugal"),
                                                            "1987-12-22",
                                                            188,
                                                            81,
                                                            "Forward",
                                                            "Lille OSC",
                                                            "2012-09-11")));

        this.match = matchRepository.save(new Match(teamRepository.findByName("France"),
                                                    teamRepository.findByName("Portugal"),
                                                    "2016-07-10",
                                                    "Final",
                                                    "Stade de France, Saint-Denis"));

        this.goals.add(goalRepository.save(new Goal(playerRepository.findByName("Éder"),
                                                    matchRepository.findByPhase("Final").get(0),  // there is only 1 final, right?
                                                    109)));
    }

    /*******************************************************************************************************************
     * Player
     *******************************************************************************************************************/
    /**
     * The result should match with the predetermined test input
     * @throws Exception
     */
    @Test
    public void readPlayers() throws Exception {
        mockMvc.perform(get("/players"))
                .andExpect(status().isOk())
                .andExpect(content().contentType(contentType))
                .andExpect(jsonPath("$", hasSize(2)))
                .andExpect(jsonPath("$[0].id", is(this.players.get(0).getId().intValue())))
                .andExpect(jsonPath("$[0].team.id", is(this.players.get(0).getTeam().getId().intValue())))
                .andExpect(jsonPath("$[0].team.name", is(this.players.get(0).getTeam().getName())))
                .andExpect(jsonPath("$[0].dob", is(this.players.get(0).getDob())))
                .andExpect(jsonPath("$[0].height", is(this.players.get(0).getHeight())))
                .andExpect(jsonPath("$[0].weight", is(this.players.get(0).getWeight())))
                .andExpect(jsonPath("$[0].position", is(this.players.get(0).getPosition())))
                .andExpect(jsonPath("$[0].club", is(this.players.get(0).getClub())))
                .andExpect(jsonPath("$[0].debut", is(this.players.get(0).getDebut())))
                // second player
                .andExpect(jsonPath("$[1].id", is(this.players.get(1).getId().intValue())))
                .andExpect(jsonPath("$[1].team.id", is(this.players.get(1).getTeam().getId().intValue())))
                .andExpect(jsonPath("$[1].team.name", is(this.players.get(1).getTeam().getName())))
                .andExpect(jsonPath("$[1].dob", is(this.players.get(1).getDob())))
                .andExpect(jsonPath("$[1].height", is(this.players.get(1).getHeight())))
                .andExpect(jsonPath("$[1].weight", is(this.players.get(1).getWeight())))
                .andExpect(jsonPath("$[1].position", is(this.players.get(1).getPosition())))
                .andExpect(jsonPath("$[1].club", is(this.players.get(1).getClub())))
                .andExpect(jsonPath("$[1].debut", is(this.players.get(1).getDebut())));
    }

    /**
     * Test /player/{id}
     * @throws Exception
     */
    @Test
    public void readPlayer() throws Exception {
        mockMvc.perform(get("/player/" + this.players.get(0).getId().intValue()))
                .andExpect(status().isOk())
                .andExpect(content().contentType(contentType))
                .andExpect(jsonPath("$.id", is(this.players.get(0).getId().intValue())))
                .andExpect(jsonPath("$.team.id", is(this.players.get(0).getTeam().getId().intValue())))
                .andExpect(jsonPath("$.team.name", is(this.players.get(0).getTeam().getName())))
                .andExpect(jsonPath("$.dob", is(this.players.get(0).getDob())))
                .andExpect(jsonPath("$.height", is(this.players.get(0).getHeight())))
                .andExpect(jsonPath("$.weight", is(this.players.get(0).getWeight())))
                .andExpect(jsonPath("$.position", is(this.players.get(0).getPosition())))
                .andExpect(jsonPath("$.club", is(this.players.get(0).getClub())))
                .andExpect(jsonPath("$.debut", is(this.players.get(0).getDebut())));
    }

    /*******************************************************************************************************************
     * Team
     *******************************************************************************************************************/

    /**
     * The result should match all teams
     * @throws Exception
     */
    @Test
    public void readTeams() throws Exception {
        mockMvc.perform(get("/teams"))
                .andExpect(status().isOk())
                .andExpect(content().contentType(contentType))
                .andExpect(jsonPath("$", hasSize(2)))
                .andExpect(jsonPath("$[0].id", is(this.teams.get(0).getId().intValue())))
                .andExpect(jsonPath("$[0].name", is(this.teams.get(0).getName())))
                // second team
                .andExpect(jsonPath("$[1].id", is(this.teams.get(1).getId().intValue())))
                .andExpect(jsonPath("$[1].name", is(this.teams.get(1).getName())));

    }

    /**
     * test /team/{id} using 'france'
     * @throws Exception
     */
    @Test
    public void readTeam() throws Exception {
        mockMvc.perform(get("/team/" + this.teams.get(0).getId().intValue()))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.id", is(this.teams.get(0).getId().intValue())))
            .andExpect(jsonPath("$.name", is(this.teams.get(0).getName())));
    }

    @Test
    public void readPlayersFromATeam() throws Exception {
        mockMvc.perform(get("/team/" + this.teams.get(0).getId().intValue() + "/players"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(contentType))
            .andExpect(jsonPath("$", hasSize(1)));
    }

    /*******************************************************************************************************************
     * Match
     *******************************************************************************************************************/
    @Test
    public void readMatches() throws Exception {
        mockMvc.perform(get("/matches/"))
                .andExpect(status().isOk())
                .andExpect(content().contentType(contentType))
                .andExpect(jsonPath("$", hasSize(1)))
                .andExpect(jsonPath("$[0].team1.id", is(this.match.getTeam1().getId().intValue())))
                .andExpect(jsonPath("$[0].team1.name", is(this.match.getTeam1().getName())))
                .andExpect(jsonPath("$[0].team2.id", is(this.match.getTeam2().getId().intValue())))
                .andExpect(jsonPath("$[0].team2.name", is(this.match.getTeam2().getName())))
                .andExpect(jsonPath("$[0].date", is(this.match.getDate())))
                .andExpect(jsonPath("$[0].phase", is(this.match.getPhase())))
                .andExpect(jsonPath("$[0].stadium", is(this.match.getStadium())));
    }

    @Test
    public void readAMatch() throws Exception {
        mockMvc.perform(get("/match/" + this.match.getId().intValue()))
                .andExpect(status().isOk())
                .andExpect(content().contentType(contentType))
                .andExpect(jsonPath("$.team1.id", is(this.match.getTeam1().getId().intValue())))
                .andExpect(jsonPath("$.team1.name", is(this.match.getTeam1().getName())))
                .andExpect(jsonPath("$.team2.id", is(this.match.getTeam2().getId().intValue())))
                .andExpect(jsonPath("$.team2.name", is(this.match.getTeam2().getName())))
                .andExpect(jsonPath("$.date", is(this.match.getDate())))
                .andExpect(jsonPath("$.phase", is(this.match.getPhase())))
                .andExpect(jsonPath("$.stadium", is(this.match.getStadium())));
    }

    @Test
    public void readGoalsInAMatch() throws Exception {
        mockMvc.perform(get("/match/" + this.match.getId().intValue() + "/goals"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", hasSize(1)))
                .andExpect(jsonPath("$[0].id", is(this.goals.get(0).getId().intValue())))
                .andExpect(jsonPath("$[0].scorer.id", is(this.goals.get(0).getScorer().getId().intValue())))
                .andExpect(jsonPath("$[0].scorer.name", is(this.goals.get(0).getScorer().getName())))
                .andExpect(jsonPath("$[0].match.id", is(this.goals.get(0).getMatch().getId().intValue())))
                .andExpect(jsonPath("$[0].match.phase", is(this.goals.get(0).getMatch().getPhase())))
                .andExpect(jsonPath("$[0].minute", is(this.goals.get(0).getMinute())));

    }

    /*******************************************************************************************************************
     * Goal
     *******************************************************************************************************************/
    @Test
    public void readGoals() throws Exception {
        mockMvc.perform(get("/goals/"))
                .andExpect(status().isOk())
                .andExpect(content().contentType(contentType))
                .andExpect(jsonPath("$", hasSize(1)))
                .andExpect(jsonPath("$[0].id", is(this.goals.get(0).getId().intValue())))
                .andExpect(jsonPath("$[0].scorer.id", is(this.goals.get(0).getScorer().getId().intValue())))
                .andExpect(jsonPath("$[0].scorer.name", is(this.goals.get(0).getScorer().getName())))
                .andExpect(jsonPath("$[0].match.id", is(this.goals.get(0).getMatch().getId().intValue())))
                .andExpect(jsonPath("$[0].match.phase", is(this.goals.get(0).getMatch().getPhase())))
                .andExpect(jsonPath("$[0].minute", is(this.goals.get(0).getMinute())));
    }

    @Test
    public void readAGoal() throws Exception {
        mockMvc.perform(get("/goal/" + this.goals.get(0).getId().intValue()))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.id", is(this.goals.get(0).getId().intValue())))
                .andExpect(jsonPath("$.scorer.id", is(this.goals.get(0).getScorer().getId().intValue())))
                .andExpect(jsonPath("$.scorer.name", is(this.goals.get(0).getScorer().getName())))
                .andExpect(jsonPath("$.match.id", is(this.goals.get(0).getMatch().getId().intValue())))
                .andExpect(jsonPath("$.match.phase", is(this.goals.get(0).getMatch().getPhase())))
                .andExpect(jsonPath("$.minute", is(this.goals.get(0).getMinute())));

    }
}
