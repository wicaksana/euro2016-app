package com.belalangtempur.springboot;

import com.belalangtempur.springboot.domain.Player;
import com.belalangtempur.springboot.domain.Team;
import com.belalangtempur.springboot.repository.PlayerRepository;
import com.belalangtempur.springboot.repository.TeamRepository;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.mock.http.MockHttpOutputMessage;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.io.IOException;
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
    private Player player;
    private Team team;
    private List<Player> players = new ArrayList<>();

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
        this.playerRepository.deleteAllInBatch(); // ??
        this.teamRepository.deleteAllInBatch();
        this.team = teamRepository.save(new Team("France"));
        this.players.add(playerRepository.save(new Player("Antoine Griezmann",
                                                          teamRepository.findByName("France"),
                                                          "1991-03-21",
                                                          176,
                                                          67,
                                                          "Forward",
                                                          "Atlético",
                                                          "2014-03-05")));

        this.players.add(playerRepository.save(new Player("Dmitri Payet",
                                                            teamRepository.findByName("France"),
                                                            "1987-03-21",
                                                            175,
                                                            77,
                                                            "Midfield",
                                                            "West Ham",
                                                            "2010-03-05")));
    }

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
                .andExpect(jsonPath("$[0].debut", is(this.players.get(0).getDebut())));
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

    /**
     * The result should match all teams
     * @throws Exception
     */
    @Test
    public void readTeams() throws Exception {
        mockMvc.perform(get("/teams"))
                .andExpect(status().isOk())
                .andExpect(content().contentType(contentType))
                .andExpect(jsonPath("$", hasSize(1)))
                .andExpect(jsonPath("$[0].id", is(this.team.getId().intValue())))
                .andExpect(jsonPath("$[0].name", is(this.team.getName())));
    }

    /**
     * test /team/{id}
     * @throws Exception
     */
    @Test
    public void readTeam() throws Exception {
        mockMvc.perform(get("/team/" + this.team.getId().intValue()))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.id", is(this.team.getId().intValue())))
            .andExpect(jsonPath("$.name", is(this.team.getName())));
    }

    @Test
    public void readPlayersFromATeam() throws Exception {
        mockMvc.perform(get("/team/" + this.team.getId().intValue() + "/players"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(contentType))
            .andExpect(jsonPath("$", hasSize(2)));
    }
}
