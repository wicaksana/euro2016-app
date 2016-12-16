--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: euro2016app; Type: SCHEMA; Schema: -; Owner: arif
--

CREATE SCHEMA euro2016app;


ALTER SCHEMA euro2016app OWNER TO arif;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = euro2016app, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: club; Type: TABLE; Schema: euro2016app; Owner: arif
--

CREATE TABLE club (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE club OWNER TO arif;

--
-- Name: club_id_seq; Type: SEQUENCE; Schema: euro2016app; Owner: arif
--

CREATE SEQUENCE club_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE club_id_seq OWNER TO arif;

--
-- Name: club_id_seq; Type: SEQUENCE OWNED BY; Schema: euro2016app; Owner: arif
--

ALTER SEQUENCE club_id_seq OWNED BY club.id;


--
-- Name: goal; Type: TABLE; Schema: euro2016app; Owner: arif
--

CREATE TABLE goal (
    id integer NOT NULL,
    scorer_id integer NOT NULL,
    match_id integer NOT NULL,
    minute integer
);


ALTER TABLE goal OWNER TO arif;

--
-- Name: goal_id_seq; Type: SEQUENCE; Schema: euro2016app; Owner: arif
--

CREATE SEQUENCE goal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE goal_id_seq OWNER TO arif;

--
-- Name: goal_id_seq; Type: SEQUENCE OWNED BY; Schema: euro2016app; Owner: arif
--

ALTER SEQUENCE goal_id_seq OWNED BY goal.id;


--
-- Name: match; Type: TABLE; Schema: euro2016app; Owner: arif
--

CREATE TABLE match (
    id integer NOT NULL,
    team_1_id integer NOT NULL,
    team_2_id integer NOT NULL,
    playing_date date NOT NULL,
    phase character varying NOT NULL,
    stadium character varying
);


ALTER TABLE match OWNER TO arif;

--
-- Name: match_id_seq; Type: SEQUENCE; Schema: euro2016app; Owner: arif
--

CREATE SEQUENCE match_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE match_id_seq OWNER TO arif;

--
-- Name: match_id_seq; Type: SEQUENCE OWNED BY; Schema: euro2016app; Owner: arif
--

ALTER SEQUENCE match_id_seq OWNED BY match.id;


--
-- Name: player; Type: TABLE; Schema: euro2016app; Owner: arif
--

CREATE TABLE player (
    id integer NOT NULL,
    name character varying NOT NULL,
    team_id integer NOT NULL,
    dob date,
    height integer,
    weight integer,
    play_position character varying,
    club_id integer,
    senior_debut date
);


ALTER TABLE player OWNER TO arif;

--
-- Name: player_id_seq; Type: SEQUENCE; Schema: euro2016app; Owner: arif
--

CREATE SEQUENCE player_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE player_id_seq OWNER TO arif;

--
-- Name: player_id_seq; Type: SEQUENCE OWNED BY; Schema: euro2016app; Owner: arif
--

ALTER SEQUENCE player_id_seq OWNED BY player.id;


--
-- Name: team; Type: TABLE; Schema: euro2016app; Owner: arif
--

CREATE TABLE team (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE team OWNER TO arif;

--
-- Name: team_id_seq; Type: SEQUENCE; Schema: euro2016app; Owner: arif
--

CREATE SEQUENCE team_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE team_id_seq OWNER TO arif;

--
-- Name: team_id_seq; Type: SEQUENCE OWNED BY; Schema: euro2016app; Owner: arif
--

ALTER SEQUENCE team_id_seq OWNED BY team.id;


--
-- Name: id; Type: DEFAULT; Schema: euro2016app; Owner: arif
--

ALTER TABLE ONLY club ALTER COLUMN id SET DEFAULT nextval('club_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: euro2016app; Owner: arif
--

ALTER TABLE ONLY goal ALTER COLUMN id SET DEFAULT nextval('goal_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: euro2016app; Owner: arif
--

ALTER TABLE ONLY match ALTER COLUMN id SET DEFAULT nextval('match_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: euro2016app; Owner: arif
--

ALTER TABLE ONLY player ALTER COLUMN id SET DEFAULT nextval('player_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: euro2016app; Owner: arif
--

ALTER TABLE ONLY team ALTER COLUMN id SET DEFAULT nextval('team_id_seq'::regclass);


--
-- Data for Name: club; Type: TABLE DATA; Schema: euro2016app; Owner: arif
--

COPY club (id, name) FROM stdin;
1	Atalanta (ITA)
2	Skënderbeu (ALB)
3	Partizani (ALB)
4	Giannina (GRE)
5	Napoli (ITA)
6	Empoli (ITA)
7	Qarabağ (AZE)
8	Köln (GER)
9	Kaiserslautern (GER)
10	Torino (ITA)
11	Nantes (FRA)
12	Bari (ITA)
13	Pescara (ITA)
14	Zürich (SUI)
15	Basel (SUI)
16	Plzeň (CZE)
17	Terek (RUS)
18	Freiburg (GER)
19	Colorado (USA)
20	İstanbul Başakşehir (TUR)
21	Austria Wien (AUT)
22	Frankfurt (GER)
23	Leverkusen (GER)
24	Augsburg (GER)
25	Leicester (ENG)
26	Bayern (GER)
27	Ingolstadt (GER)
28	Watford (ENG)
29	Tottenham (ENG)
30	Stuttgart (GER)
31	Darmstadt (GER)
32	Leipzig (GER)
33	Bremen (GER)
34	Hannover (GER)
35	Schalke (GER)
36	Rizespor (TUR)
37	Stoke (ENG)
38	1860 München (GER)
39	Chelsea (ENG)
40	Liverpool (ENG)
41	Standard Liège (BEL)
42	Roma (ITA)
43	Sunderland (ENG)
44	Paris (FRA)
45	Lazio (ITA)
46	Montreal (CAN)
47	Zenit (RUS)
48	Man. City (ENG)
49	Man. United (ENG)
50	Atlético (ESP)
51	Everton (ENG)
52	Crystal Palace (ENG)
53	Hajduk Split (CRO)
54	Monaco (FRA)
55	Lokomotiv Moskva (RUS)
56	Shakhtar Donetsk (UKR)
57	Dinamo Zagreb (CRO)
58	Dynamo Kyiv (UKR)
59	Internazionale (ITA)
60	Barcelona (ESP)
61	Real Madrid (ESP)
62	Fiorentina (ITA)
63	Hoffenheim (GER)
64	Juventus (ITA)
65	Sporting Gijón (ESP)
66	Arsenal (ENG)
67	Sparta Praha (CZE)
68	Bursaspor (TUR)
69	Sheff. Wednesday (ENG)
70	Bordeaux (FRA)
71	Gaziantepspor (TUR)
72	Kasımpaşa (TUR)
73	Bologna (ITA)
74	Brighton (ENG)
75	Hertha (GER)
76	Slavia Praha (CZE)
77	Southampton (ENG)
78	Burnley (ENG)
79	Bournemouth (ENG)
80	Rennes (FRA)
81	Lyon (FRA)
82	Sevilla (ESP)
83	Valencia (ESP)
84	West Ham (ENG)
85	Tigres (MEX)
86	Wolfsburg (GER)
87	Dortmund (GER)
88	Galatasaray (TUR)
89	Haladás (HUN)
90	Ferencváros (HUN)
91	Dijon (FRA)
92	H. Beer-Sheva (ISR)
93	Lech (POL)
94	Videoton (HUN)
95	Wisła (POL)
96	Le Havre (FRA)
97	Diósgyőr (HUN)
98	Al Wahda FC (UAE)
99	Al-Gharafa (QAT)
100	Legia (POL)
101	Slovan Bratislava (SVK)
102	Randers (DEN)
103	Hammarby (SWE)
104	Sandefjord (NOR)
105	AIK (SWE)
106	Brøndby (DEN)
107	Lokeren (BEL)
108	Fulham (ENG)
109	AGF (DEN)
110	Bristol City (ENG)
111	Swansea (ENG)
112	Malmö (SWE)
113	Grasshoppers (SUI)
114	Cardiff (WAL)
115	Udinese (ITA)
116	Rapid Wien (AUT)
117	Wolves (ENG)
118	Molde (NOR)
119	Milan (ITA)
120	Shandong Luneng (CHN)
121	Norwich (ENG)
122	Linfield (NIR)
123	St Johnstone (SCO)
124	Fleetwood (ENG)
125	West Brom (ENG)
126	Doncaster (ENG)
127	Kerala (IND)
128	Rangers (SCO)
129	Millwall (ENG)
130	Blackburn (ENG)
131	Leeds (ENG)
132	Burton (ENG)
133	Charlton (ENG)
134	Aberdeen (SCO)
135	Wigan (ENG)
136	QPR (ENG)
137	Krasnodar (RUS)
138	Lechia (POL)
139	Cagliari (ITA)
140	Sampdoria (ITA)
141	Zagłębie (POL)
142	Sporting CP (POR)
143	Benfica (POR)
144	Porto (POR)
145	LOSC (FRA)
146	Beşiktaş (TUR)
147	Newcastle (ENG)
148	Derby (ENG)
149	Preston (ENG)
150	Hull (ENG)
151	Reading (ENG)
152	LA Galaxy (USA)
153	Astra (ROU)
154	Rayo Vallecano (ESP)
155	Ludogorets (BUL)
156	Karabükspor (TUR)
157	Dinamo Bucureşti (ROU)
158	Al-Sailiya (QAT)
159	Steaua (ROU)
160	Anderlecht (BEL)
161	Al-Ittihad (KSA)
162	Rostov (RUS)
163	Deportivo (ESP)
164	Gençlerbirliği (TUR)
165	Fenerbahçe (TUR)
166	Trabzonspor (TUR)
167	Marseille (FRA)
168	København (DEN)
169	Žilina (SVK)
170	()
171	Athletic (ESP)
172	Villarreal (ESP)
173	Djurgården (SWE)
174	Celtic (SCO)
175	Hamburg (GER)
176	Palermo (ITA)
177	CSKA Moskva (RUS)
178	Toulouse (FRA)
179	Eskişehirspor (TUR)
180	Panathinaikos (GRE)
181	Gent (BEL)
182	Celta (ESP)
183	Mönchengladbach (GER)
184	Young Boys (SUI)
185	Mainz (GER)
186	Beijing Guoan (CHN)
187	Málaga (ESP)
188	Kairat (KAZ)
189	Dnipro (UKR)
190	PSV (NED)
191	Zorya (UKR)
192	Betis (ESP)
193	Anji (RUS)
194	Inverness (SCO)
195	Huddersfield (ENG)
196	Aston Villa (ENG)
197	Ipswich (ENG)
198	Nottm Forest (ENG)
199	MK Dons (ENG)
200	Birmingham (ENG)
201	Roda (NED)
\.


--
-- Name: club_id_seq; Type: SEQUENCE SET; Schema: euro2016app; Owner: arif
--

SELECT pg_catalog.setval('club_id_seq', 201, true);


--
-- Data for Name: goal; Type: TABLE DATA; Schema: euro2016app; Owner: arif
--

COPY goal (id, scorer_id, match_id, minute) FROM stdin;
\.


--
-- Name: goal_id_seq; Type: SEQUENCE SET; Schema: euro2016app; Owner: arif
--

SELECT pg_catalog.setval('goal_id_seq', 1, false);


--
-- Data for Name: match; Type: TABLE DATA; Schema: euro2016app; Owner: arif
--

COPY match (id, team_1_id, team_2_id, playing_date, phase, stadium) FROM stdin;
\.


--
-- Name: match_id_seq; Type: SEQUENCE SET; Schema: euro2016app; Owner: arif
--

SELECT pg_catalog.setval('match_id_seq', 1, false);


--
-- Data for Name: player; Type: TABLE DATA; Schema: euro2016app; Owner: arif
--

COPY player (id, name, team_id, dob, height, weight, play_position, club_id, senior_debut) FROM stdin;
1	Etrit Berisha	1	1989-03-10	194	92	Goalkeeper	1	2012-05-27
2	Orges Shehi	1	1977-09-25	182	78	Goalkeeper	2	2010-11-17
3	Alban Hoxha	1	1987-11-23	188	79	Goalkeeper	3	2015-11-16
4	Andi Lila	1	1986-02-12	184	79	Defender	4	2007-11-21
5	Elseid Hysaj	1	1994-02-20	182	70	Defender	5	2013-02-06
6	Frédéric Veseli	1	1992-11-20	183	80	Defender	6	2015-11-16
7	Ansi Agolli	1	1982-10-11	179	70	Defender	7	2005-09-03
8	Mërgim Mavraj	1	1986-06-09	189	84	Defender	8	2012-05-22
9	Naser Aliji	1	1993-12-27	177	73	Defender	9	2015-06-13
10	Arlind Ajeti	1	1993-09-25	185	81	Defender	10	2014-11-14
11	Ermir Lenjani	1	1989-08-05	175	65	Midfield	11	2013-11-15
12	Lorik Cana	1	1983-07-27	186	77	Midfield	11	2003-06-11
13	Migjen Basha	1	1987-01-05	180	72	Midfield	12	2013-03-22
14	Ledian Memushaj	1	1986-12-17	175	71	Midfield	13	2010-11-17
15	Burim Kukeli	1	1984-01-16	180	72	Midfield	14	2012-09-07
16	Taulant Xhaka	1	1991-03-28	172	72	Midfield	15	2014-09-07
17	Ergys Kaçe	1	1993-07-08	170	62	Midfield	16	2013-06-07
18	Odise Roshi	1	1991-05-22	187	78	Midfield	17	2011-10-07
19	Amir Abrashi	1	1990-03-27	172	71	Midfield	18	2013-08-14
20	Armando Sadiku	1	1991-05-27	185	80	Forward	14	2012-02-29
21	Shkëlzen Gashi	1	1988-07-15	182	75	Forward	19	2013-08-14
22	Sokol Çikalleshi	1	1990-07-27	185	79	Forward	20	2014-05-31
23	Bekim Balaj	1	1991-01-11	188	80	Forward	17	2012-11-14
24	Robert Almer	2	1984-03-20	194	88	Goalkeeper	21	2011-11-15
25	Heinz Lindner	2	1990-07-17	187	80	Goalkeeper	22	2012-06-01
26	Ramazan Özcan	2	1984-06-28	187	84	Goalkeeper	23	2008-08-20
27	Aleksandar Dragović	2	1991-03-06	184	76	Defender	23	2009-06-06
28	Martin Hinteregger	2	1992-09-07	184	78	Defender	24	2013-11-19
29	Christian Fuchs	2	1986-04-07	186	80	Defender	25	2006-05-23
30	David Alaba	2	1992-06-24	180	75	Defender	26	2009-10-14
31	Markus Suttner	2	1987-04-16	179	72	Defender	27	2012-02-29
32	Sebastian Prödl	2	1987-06-21	194	85	Defender	28	2007-05-30
33	Kevin Wimmer	2	1992-11-15	187	85	Defender	29	2013-11-19
34	Florian Klein	2	1986-11-17	180	66	Defender	30	2010-05-19
35	György Garics	2	1984-03-08	183	76	Midfield	31	2006-10-06
36	Stefan Ilsanker	2	1989-05-18	189	86	Midfield	32	2014-05-30
37	Zlatko Junuzović	2	1987-09-26	172	69	Midfield	33	2006-03-01
38	Martin Harnik	2	1987-06-10	185	75	Midfield	34	2007-08-22
39	Julian Baumgartlinger	2	1988-01-02	183	82	Midfield	23	2009-09-09
40	Alessandro Schöpf	2	1994-02-07	178	75	Midfield	35	2016-03-26
41	Marcel Sabitzer	2	1994-03-17	177	74	Midfield	32	2012-06-05
42	Jakob Jantscher	2	1989-01-08	181	69	Midfield	36	2009-06-06
43	Marko Arnautović	2	1989-04-19	192	83	Forward	37	2008-10-11
44	Rubin Okotie	2	1987-06-06	188	86	Forward	38	2008-11-19
45	Lukas Hinterseer	2	1991-03-28	192	84	Forward	27	2013-11-19
46	Marc Janko	2	1983-06-25	196	93	Forward	15	2006-05-23
47	Thibaut Courtois	3	1992-05-11	199	91	Goalkeeper	39	2011-11-15
48	Simon Mignolet	3	1988-08-06	193	87	Goalkeeper	40	2011-03-25
49	Jean-François Gillet	3	1979-05-31	181	82	Goalkeeper	41	2009-09-05
50	Toby Alderweireld	3	1989-03-02	186	81	Defender	29	2009-05-29
51	Thomas Vermaelen	3	1985-11-14	183	80	Defender	42	2006-03-01
52	Jan Vertonghen	3	1987-04-24	189	79	Defender	29	2007-06-02
53	Jason Denayer	3	1995-06-28	184	70	Defender	43	2015-03-31
54	Thomas Meunier	3	1991-09-12	190	78	Defender	44	2013-11-14
55	Christian Kabasele	3	1991-02-24	186	84	Defender	28	\N
56	Jordan Lukaku	3	1994-07-25	186	83	Defender	45	2015-10-10
57	Laurent Ciman	3	1985-08-05	184	70	Defender	46	2010-05-19
58	Radja Nainggolan	3	1988-05-04	176	65	Midfield	42	2009-05-29
59	Axel Witsel	3	1989-01-12	186	73	Midfield	47	2008-03-26
60	Kevin De Bruyne	3	1991-06-28	181	68	Midfield	48	2010-08-11
61	Marouane Fellaini	3	1987-11-22	194	85	Midfield	49	2007-02-07
62	Eden Hazard	3	1991-01-07	173	74	Midfield	39	2008-11-19
63	Yannick Carrasco	3	1993-09-04	180	67	Midfield	50	2015-03-28
64	Dries Mertens	3	1987-05-06	169	61	Midfield	5	2011-02-09
65	Mousa Dembélé	3	1987-07-16	185	82	Midfield	29	2006-05-20
66	Romelu Lukaku	3	1993-05-13	190	93	Forward	51	2010-05-19
67	Divock Origi	3	1995-04-18	185	75	Forward	40	2014-05-26
68	Christian Benteke	3	1990-12-03	190	83	Forward	52	2010-05-19
69	Michy Batshuayi	3	1993-10-02	185	78	Forward	39	2015-03-28
70	Ivan Vargić	4	1987-03-15	192	90	Goalkeeper	45	2014-11-12
71	Lovre Kalinić	4	1990-04-03	201	96	Goalkeeper	53	2014-11-12
72	Danijel Subašić	4	1984-10-27	191	87	Goalkeeper	54	2009-11-14
73	Šime Vrsaljko	4	1992-01-10	183	75	Defender	50	2011-02-09
74	Ivan Strinić	4	1987-07-17	186	78	Defender	5	2010-05-19
75	Vedran Ćorluka	4	1986-02-05	192	84	Defender	55	2006-08-16
76	Tin Jedvaj	4	1995-11-28	184	80	Defender	23	2014-09-04
77	Darijo Srna	4	1982-05-01	178	78	Defender	56	2002-11-20
78	Gordon Schildenfeld	4	1985-03-18	191	89	Defender	57	2009-11-14
79	Domagoj Vida	4	1989-04-29	184	73	Defender	58	2010-05-23
80	Ivan Perišić	4	1989-02-02	187	80	Midfield	59	2011-03-26
81	Ivan Rakitić	4	1988-03-10	184	78	Midfield	60	2007-09-08
82	Mateo Kovačić	4	1994-05-06	178	77	Midfield	61	2013-03-22
83	Luka Modrić	4	1985-09-09	174	65	Midfield	61	2006-03-01
84	Marcelo Brozović	4	1992-11-16	181	68	Midfield	59	2014-06-07
85	Marko Rog	4	1995-07-19	180	73	Midfield	5	2014-11-12
86	Ante Ćorić	4	1997-04-14	172	78	Midfield	57	2016-05-27
87	Milan Badelj	4	1989-02-25	186	76	Midfield	62	2010-05-23
88	Andrej Kramarić	4	1991-06-19	177	70	Forward	63	2014-09-04
89	Nikola Kalinić	4	1988-01-05	187	80	Forward	62	2008-05-24
90	Mario Mandžukić	4	1986-05-21	190	85	Forward	64	2007-11-17
91	Marko Pjaca	4	1995-05-06	186	81	Forward	64	2014-09-04
92	Duje Čop	4	1990-02-01	184	73	Forward	65	2014-09-04
93	Petr Čech	5	1982-05-20	196	90	Goalkeeper	66	2002-02-12
94	Tomáš Vaclík	5	1989-03-29	188	85	Goalkeeper	15	2012-11-14
95	Tomáš Koubek	5	1992-08-26	198	95	Goalkeeper	67	2016-03-24
96	Pavel Kadeřábek	5	1992-04-25	182	81	Defender	63	2014-05-21
97	Michal Kadlec	5	1984-12-13	185	76	Defender	67	2007-11-17
98	Theodor Gebre Selassie	5	1986-12-24	181	71	Defender	33	2011-06-04
99	Roman Hubník	5	1984-06-06	191	86	Defender	16	2009-06-05
100	Tomáš Sivok	5	1983-09-15	185	77	Defender	68	2005-09-03
101	David Limberský	5	1983-10-06	179	79	Defender	16	2009-06-05
102	Marek Suchý	5	1988-03-29	184	84	Defender	15	2010-10-08
103	Bořek Dočkal	5	1988-09-30	182	72	Midfield	67	2012-11-14
104	Tomáš Rosický	5	1980-10-04	178	65	Midfield	67	2000-02-23
105	Daniel Pudil	5	1985-09-27	185	81	Midfield	69	2007-02-07
106	Jaroslav Plašil	5	1982-01-05	182	72	Midfield	70	2004-03-31
107	Daniel Kolář	5	1985-10-27	180	77	Midfield	71	2009-06-05
108	David Pavelka	5	1991-05-18	185	74	Midfield	72	2015-09-03
109	Ladislav Krejčí	5	1992-07-05	180	67	Midfield	73	2012-11-14
110	Jiří Skalák	5	1992-03-12	177	76	Midfield	74	2015-09-03
111	Vladimír Darida	5	1990-08-08	171	74	Midfield	75	2012-05-26
112	Tomáš Necid	5	1989-08-13	190	81	Forward	68	2008-11-19
113	Milan Škoda	5	1986-01-16	190	86	Forward	76	2015-06-12
114	Josef Šural	5	1990-05-30	184	81	Forward	67	2013-11-15
115	David Lafata	5	1981-09-18	180	72	Forward	67	2006-09-02
116	Joe Hart	6	1987-04-19	196	89	Goalkeeper	10	2008-06-01
117	Fraser Forster	6	1988-03-17	201	73	Goalkeeper	77	2013-11-15
118	Tom Heaton	6	1986-04-15	188	85	Goalkeeper	78	2016-05-27
119	Kyle Walker	6	1990-05-28	178	70	Defender	29	2011-11-12
120	Danny Rose	6	1990-07-02	173	72	Defender	29	2016-03-26
121	Gary Cahill	6	1985-12-19	193	86	Defender	39	2010-09-03
122	Chris Smalling	6	1989-11-22	192	81	Defender	49	2011-09-02
123	Nathaniel Clyne	6	1991-04-05	175	67	Defender	40	2014-11-15
124	John Stones	6	1994-05-28	188	70	Defender	48	2014-05-30
125	Ryan Bertrand	6	1989-08-05	179	85	Defender	77	2012-08-15
126	James Milner	6	1986-01-04	175	70	Midfield	40	2009-08-12
127	Adam Lallana	6	1988-05-10	172	73	Midfield	40	2013-11-15
128	Jordan Henderson	6	1990-06-17	182	67	Midfield	40	2010-11-17
129	Eric Dier	6	1994-01-15	188	88	Midfield	29	2015-11-13
130	Jack Wilshere	6	1992-01-01	172	65	Midfield	79	2010-08-11
131	Ross Barkley	6	1993-12-05	189	76	Midfield	51	2013-09-06
132	Dele Alli	6	1996-04-11	188	73	Midfield	29	2015-10-09
133	Raheem Sterling	6	1994-12-08	170	69	Forward	48	2012-11-14
134	Harry Kane	6	1993-07-28	188	65	Forward	29	2015-03-27
135	Wayne Rooney	6	1985-10-24	176	83	Forward	49	2003-02-12
136	Jamie Vardy	6	1987-01-11	178	76	Forward	25	2015-06-07
137	Daniel Sturridge	6	1989-09-01	188	76	Forward	40	2011-11-15
138	Marcus Rashford	6	1997-10-31	180	70	Forward	49	2016-05-27
139	Hugo Lloris	7	1986-12-26	188	73	Goalkeeper	29	2008-11-19
140	Steve Mandanda	7	1985-03-28	185	82	Goalkeeper	52	2008-05-27
141	Benoît Costil	7	1987-07-03	188	86	Goalkeeper	80	\N
142	Christophe Jallet	7	1983-10-31	178	70	Defender	81	2012-08-15
143	Patrice Evra	7	1981-05-15	174	74	Defender	64	2004-08-18
144	Adil Rami	7	1985-12-27	190	90	Defender	82	2010-08-11
145	Eliaquim Mangala	7	1991-02-13	188	84	Defender	83	2013-06-05
146	Lucas Digne	7	1993-07-20	178	74	Defender	60	2014-03-05
147	Bacary Sagna	7	1983-02-14	176	72	Defender	48	2007-08-22
148	Laurent Koscielny	7	1985-09-10	186	75	Defender	66	2011-11-11
149	Samuel Umtiti	7	1993-11-14	180	75	Defender	60	\N
150	N'Golo Kanté	7	1991-03-29	169	68	Midfield	39	2016-03-25
151	Yohan Cabaye	7	1986-01-14	174	71	Midfield	52	2010-08-11
152	Dimitri Payet	7	1987-03-29	175	77	Midfield	84	2010-10-09
153	Morgan Schneiderlin	7	1989-11-08	180	75	Midfield	49	2014-06-08
154	Blaise Matuidi	7	1987-04-09	175	70	Midfield	44	2010-09-07
155	Paul Pogba	7	1993-03-15	191	84	Midfield	49	2013-03-22
156	Moussa Sissoko	7	1989-08-16	187	83	Midfield	29	2009-10-10
157	Antoine Griezmann	7	1991-03-21	176	67	Forward	50	2014-03-05
158	Olivier Giroud	7	1986-09-30	192	88	Forward	66	2011-11-11
159	André-Pierre Gignac	7	1985-12-05	187	84	Forward	85	2009-04-01
160	Anthony Martial	7	1995-12-05	181	76	Forward	49	2015-09-04
161	Kingsley Coman	7	1996-06-13	178	71	Forward	26	2015-11-13
162	Manuel Neuer	8	1986-03-27	193	92	Goalkeeper	26	2009-06-02
163	Bernd Leno	8	1992-03-04	190	83	Goalkeeper	23	2016-05-29
164	Marc-André ter Stegen	8	1992-04-30	187	85	Goalkeeper	60	2012-05-26
165	Shkodran Mustafi	8	1992-04-17	184	82	Defender	66	2014-05-13
166	Jonas Hector	8	1990-05-27	185	75	Defender	8	2014-11-14
167	Benedikt Höwedes	8	1988-02-29	187	82	Defender	35	2011-05-29
168	Mats Hummels	8	1988-12-16	191	92	Defender	26	2010-05-13
169	Jonathan Tah	8	1996-02-11	192	92	Defender	23	\N
170	Jérôme Boateng	8	1988-09-03	192	90	Defender	26	2009-10-10
171	Joshua Kimmich	8	1995-02-08	176	70	Defender	26	2016-05-29
172	Sami Khedira	8	1987-04-04	189	90	Midfield	64	2009-09-05
173	Bastian Schweinsteiger	8	1984-08-01	183	79	Midfield	49	2004-06-06
174	Mesut Özil	8	1988-10-15	180	76	Midfield	66	2009-02-11
175	Julian Draxler	8	1993-09-20	187	72	Midfield	86	2012-05-26
176	Emre Can	8	1994-01-12	184	82	Midfield	40	2015-09-04
177	Julian Weigl	8	1995-09-08	186	71	Midfield	87	2016-05-29
178	Toni Kroos	8	1990-01-04	182	78	Midfield	61	2010-03-03
179	Leroy Sané	8	1996-01-11	183	75	Midfield	48	2015-11-13
180	André Schürrle	8	1990-11-06	184	74	Forward	87	2010-11-17
181	Lukas Podolski	8	1985-06-04	182	83	Forward	88	2004-06-06
182	Thomas Müller	8	1989-09-13	186	74	Forward	26	2010-03-03
183	Mario Götze	8	1992-06-03	176	64	Forward	87	2010-11-17
184	Mario Gomez	8	1985-07-10	189	93	Forward	86	2007-02-07
185	Gábor Király	9	1976-04-01	190	85	Goalkeeper	89	1998-03-25
186	Dénes Dibusz	9	1990-11-16	188	81	Goalkeeper	90	2014-10-14
187	Péter Gulácsi	9	1990-05-06	190	83	Goalkeeper	32	2014-05-22
188	Ádám Lang	9	1993-01-17	185	77	Defender	91	2014-05-22
189	Mihály Korhut	9	1988-12-01	181	76	Defender	92	2014-05-22
190	Tamás Kádár	9	1990-03-14	188	79	Defender	93	2010-11-17
191	Attila Fiola	9	1990-02-17	182	70	Defender	94	2014-10-14
192	Ádám Pintér	9	1988-06-12	190	76	Defender	90	2010-10-12
193	Richárd Guzmics	9	1987-04-16	190	80	Defender	95	2012-11-14
194	Barnabás Bese	9	1994-05-06	188	84	Defender	96	2016-06-04
195	Roland Juhász	9	1983-07-01	194	96	Defender	94	2004-04-25
196	Ákos Elek	9	1988-07-21	193	91	Midfield	97	2010-06-05
197	Ádám Nagy	9	1995-06-17	178	74	Midfield	73	2015-09-07
198	László Kleinheisler	9	1994-04-08	173	70	Midfield	31	2015-11-12
199	Zoltán Stieber	9	1988-10-16	175	67	Midfield	9	2011-09-02
200	Balázs Dzsudzsák	9	1986-12-23	179	72	Forward	98	2007-06-02
201	Ádám Szalai	9	1987-12-09	193	91	Forward	63	2009-02-11
202	Zoltán Gera	9	1979-04-22	183	75	Forward	90	2002-02-13
203	Krisztián Németh	9	1989-01-05	180	74	Forward	99	2010-05-29
204	Dániel Böde	9	1986-10-24	185	77	Forward	90	2013-02-06
205	Gergő Lovrencsics	9	1988-09-01	177	79	Forward	90	2013-06-06
206	Nemanja Nikolić	9	1987-12-31	180	80	Forward	100	2013-10-11
207	Tamás Priskin	9	1986-09-27	189	90	Forward	101	2005-08-17
208	Hannes Halldórsson	10	1984-04-27	193	87	Goalkeeper	102	2011-09-06
209	Ögmundur Kristinsson	10	1989-06-19	192	89	Goalkeeper	103	2014-06-04
210	Ingvar Jónsson	10	1989-10-18	188	82	Goalkeeper	104	2014-11-12
211	Birkir Sævarsson	10	1984-11-11	187	81	Defender	103	2007-06-02
212	Haukur Heidar Hauksson	10	1991-09-01	187	79	Defender	105	2015-01-19
213	Hjörtur Hermannsson	10	1995-02-08	189	81	Defender	106	2016-01-31
214	Sverrir Ingason	10	1993-08-05	188	83	Defender	107	2014-01-21
215	Ragnar Sigurdsson	10	1986-06-19	187	77	Defender	108	2007-08-22
216	Elmar Bjarnason	10	1987-03-04	183	78	Defender	109	2007-06-02
217	Hordur Magnússon	10	1993-02-11	190	81	Defender	110	2014-11-12
218	Ari Skúlason	10	1987-05-14	170	65	Defender	107	2009-11-10
219	Birkir Bjarnason	10	1988-05-27	182	75	Midfield	15	2010-05-29
220	Gylfi Sigurdsson	10	1989-09-08	186	77	Midfield	111	2010-05-29
221	Kári Árnason	10	1982-10-13	190	79	Midfield	112	2005-03-30
222	Rúnar Már Sigurjónsson	10	1990-06-18	178	78	Midfield	113	2012-11-14
223	Aron Gunnarsson	10	1989-04-22	178	70	Midfield	114	2008-02-02
224	Emil Hallfredsson	10	1984-06-29	185	83	Midfield	115	2005-03-30
225	Arnór Ingvi Traustason	10	1993-04-30	183	74	Midfield	116	2015-11-13
226	Johann Gudmundsson	10	1990-10-27	178	72	Forward	78	2008-08-20
227	Kolbeinn Sigthórsson	10	1990-03-14	185	70	Forward	88	2010-03-21
228	Alfred Finnbogason	10	1989-02-01	184	78	Forward	24	2010-03-21
229	Jón Dadi Bödvarsson	10	1992-05-25	190	85	Forward	117	2012-11-14
230	Eidur Gudjohnsen	10	1978-09-15	185	82	Forward	118	1996-04-24
231	Gianluigi Buffon	11	1978-01-28	192	91	Goalkeeper	64	1997-10-29
232	Salvatore Sirigu	11	1987-01-12	192	80	Goalkeeper	82	2010-08-10
233	Federico Marchetti	11	1983-02-07	188	73	Goalkeeper	45	2009-06-06
234	Mattia De Sciglio	11	1992-10-20	183	74	Defender	119	2013-03-21
235	Giorgio Chiellini	11	1984-08-14	187	86	Defender	64	2004-11-17
236	Matteo Darmian	11	1989-12-02	182	70	Defender	49	2014-05-31
237	Angelo Ogbonna	11	1988-05-23	191	86	Defender	84	2011-11-11
238	Andrea Barzagli	11	1981-05-08	187	87	Defender	64	2004-11-17
239	Leonardo Bonucci	11	1987-05-01	190	86	Defender	64	2010-03-03
240	Antonio Candreva	11	1987-02-28	180	70	Midfield	59	2009-11-14
241	Alessandro Florenzi	11	1991-03-11	173	67	Midfield	42	2012-11-14
242	Thiago Motta	11	1982-08-28	183	82	Midfield	44	2011-02-09
243	Stefano Sturaro	11	1993-03-09	178	78	Midfield	64	2016-06-06
244	Daniele De Rossi	11	1983-07-24	184	83	Midfield	42	2004-09-04
245	Marco Parolo	11	1985-01-25	184	75	Midfield	45	2011-03-29
246	Federico Bernardeschi	11	1994-02-16	183	75	Midfield	62	2016-03-24
247	Emanuele Giaccherini	11	1985-05-05	167	60	Midfield	5	2012-06-10
248	Simone Zaza	11	1991-06-25	186	83	Forward	84	2014-09-04
249	Graziano Pellè	11	1985-07-15	194	84	Forward	120	2014-10-13
250	Ciro Immobile	11	1990-02-20	185	78	Forward	45	2014-03-05
251	Éder	11	1986-11-15	179	72	Forward	59	2015-03-28
252	Lorenzo Insigne	11	1991-06-04	163	59	Forward	5	2012-09-11
253	Stephan El Shaarawy	11	1992-10-27	178	72	Forward	42	2012-08-15
254	Michael McGovern	12	1984-07-12	191	89	Goalkeeper	121	2010-05-30
255	Roy Carroll	12	1977-09-30	188	80	Goalkeeper	122	1997-05-21
256	Alan Mannus	12	1982-05-19	188	84	Goalkeeper	123	2004-06-06
257	Conor McLaughlin	12	1991-07-26	183	71	Defender	124	2011-10-11
258	Gareth McAuley	12	1979-12-05	195	90	Defender	125	2005-06-04
259	Jonny Evans	12	1988-01-03	188	77	Defender	125	2006-09-06
260	Chris Baird	12	1982-02-25	181	74	Defender	108	2003-06-03
261	Luke McCullough	12	1994-02-15	185	81	Defender	126	2014-05-31
262	Paddy McNair	12	1995-04-27	183	72	Defender	43	2015-03-25
263	Aaron Hughes	12	1979-11-08	183	78	Defender	127	1998-03-25
264	Craig Cathcart	12	1989-02-06	188	73	Defender	28	2010-09-03
265	Lee Hodson	12	1991-10-02	174	71	Defender	128	2010-11-17
266	Shane Ferguson	12	1991-07-12	176	65	Midfield	129	2009-06-06
267	Steven Davis	12	1985-01-01	172	72	Midfield	77	2005-02-09
268	Corry Evans	12	1990-07-30	173	70	Midfield	130	2009-06-06
269	Stuart Dallas	12	1991-04-19	186	81	Midfield	131	2011-05-27
270	Oliver Norwood	12	1991-04-12	180	76	Midfield	74	2010-08-11
271	Jamie Ward	12	1986-05-12	165	68	Midfield	132	2011-08-10
272	Josh Magennis	12	1990-08-15	188	92	Midfield	133	2010-05-26
273	Niall McGinn	12	1987-07-20	183	70	Forward	134	2008-11-19
274	Will Grigg	12	1991-07-03	180	70	Forward	135	2012-06-02
275	Kyle Lafferty	12	1987-09-16	193	88	Forward	121	2006-05-21
276	Conor Washington	12	1992-05-18	178	74	Forward	136	2016-03-24
277	Wojciech Szczęsny	13	1990-04-18	196	84	Goalkeeper	42	2009-11-18
278	Artur Boruc	13	1980-02-20	193	88	Goalkeeper	79	2004-04-28
279	Łukasz Fabiański	13	1985-04-18	190	83	Goalkeeper	111	2006-03-28
280	Michał Pazdan	13	1987-09-21	181	78	Defender	100	2008-02-27
281	Artur Jędrzejczyk	13	1987-11-04	189	78	Defender	137	2010-10-12
282	Jakub Wawrzyniak	13	1983-07-07	188	85	Defender	138	2006-12-06
283	Kamil Glik	13	1988-02-03	190	80	Defender	54	2010-01-20
284	Bartosz Salamon	13	1991-05-01	196	89	Defender	139	2013-03-26
285	Łukasz Piszczek	13	1985-06-03	184	79	Defender	87	2007-02-03
286	Krzysztof Mączyński	13	1987-05-23	175	66	Midfield	95	2013-11-15
287	Tomasz Jodłowiec	13	1985-09-08	189	91	Midfield	100	2008-10-11
288	Karol Linetty	13	1995-02-02	176	74	Midfield	140	2014-01-18
289	Grzegorz Krychowiak	13	1990-01-29	186	83	Midfield	44	2008-12-14
290	Kamil Grosicki	13	1988-06-08	180	78	Midfield	80	2008-02-27
291	Jakub Błaszczykowski	13	1985-12-14	176	77	Midfield	86	2006-03-28
292	Sławomir Peszko	13	1985-02-19	173	70	Midfield	138	2008-11-19
293	Piotr Zieliński	13	1994-05-20	177	64	Midfield	5	2013-06-04
294	Bartosz Kapustka	13	1996-12-23	179	60	Midfield	25	2015-09-07
295	Filip Starzyński	13	1991-05-27	184	72	Midfield	141	2014-09-07
296	Arkadiusz Milik	13	1994-02-28	186	78	Forward	5	2012-10-12
297	Robert Lewandowski	13	1988-08-21	184	78	Forward	26	2008-09-10
298	Mariusz Stępiński	13	1995-05-12	183	73	Forward	11	2015-11-13
299	Rui Patrício	14	1988-02-15	190	84	Goalkeeper	142	2010-11-17
300	Anthony Lopes	14	1990-10-01	184	81	Goalkeeper	81	2015-03-31
301	Eduardo	14	1982-09-19	188	89	Goalkeeper	39	2009-02-11
302	Bruno Alves	14	1981-11-27	189	83	Defender	139	2007-06-05
303	Pepe	14	1983-02-26	188	81	Defender	61	2007-11-21
304	José Fonte	14	1983-12-22	187	81	Defender	77	2014-11-18
305	Raphaël Guerreiro	14	1993-12-22	170	67	Defender	87	2014-11-14
306	Ricardo Carvalho	14	1978-05-18	183	78	Defender	54	2003-10-11
307	Eliseu	14	1983-10-01	180	75	Defender	143	2009-06-10
308	Cédric	14	1991-08-31	172	67	Defender	77	2014-10-11
309	João Moutinho	14	1986-09-08	171	61	Midfield	54	2005-08-17
310	João Mário	14	1993-01-19	179	73	Midfield	59	2014-10-11
311	Vieirinha	14	1986-01-24	172	73	Midfield	86	2013-03-22
312	Danilo	14	1991-09-09	188	83	Midfield	144	2015-03-31
313	William Carvalho	14	1992-04-07	187	83	Midfield	142	2013-11-19
314	André Gomes	14	1993-07-30	188	84	Midfield	60	2014-09-07
315	Renato Sanches	14	1997-08-18	176	70	Midfield	26	2016-03-25
316	Rafa Silva	14	1993-05-17	170	63	Midfield	143	2014-03-05
317	Adrien Silva	14	1989-03-15	175	69	Midfield	142	2014-11-18
318	Cristiano Ronaldo	14	1985-02-05	185	80	Forward	61	2003-08-20
319	Éder	14	1987-12-22	188	81	Forward	145	2012-09-11
320	Nani	14	1986-11-17	175	66	Forward	83	2006-09-01
321	Ricardo Quaresma	14	1983-09-26	175	67	Forward	146	2003-06-10
322	Keiren Westwood	15	1984-10-23	187	92	Goalkeeper	69	2009-05-29
323	Shay Given	15	1976-04-20	185	84	Goalkeeper	37	1996-03-27
324	Darren Randolph	15	1987-05-12	188	98	Goalkeeper	84	2012-09-11
325	Seamus Coleman	15	1988-10-11	177	67	Defender	51	2011-02-08
326	Ciaran Clark	15	1989-09-26	188	76	Defender	147	2011-02-08
327	John O'Shea	15	1981-04-30	191	75	Defender	43	2001-08-15
328	Richard Keogh	15	1986-08-11	188	87	Defender	148	2013-02-06
329	Shane Duffy	15	1992-01-01	193	76	Defender	74	2014-06-07
330	Cyrus Christie	15	1992-09-30	188	78	Defender	148	2014-11-18
331	Stephen Ward	15	1985-08-20	184	72	Defender	78	2011-05-24
332	Glenn Whelan	15	1984-01-13	180	79	Midfield	37	2008-05-24
333	Aiden McGeady	15	1986-04-04	177	71	Midfield	149	2004-06-02
334	James McCarthy	15	1990-11-12	180	72	Midfield	51	2010-03-02
335	James McClean	15	1989-04-22	180	70	Midfield	125	2012-02-29
336	Jeff Hendrick	15	1992-01-31	185	79	Midfield	78	2013-02-06
337	David Meyler	15	1989-05-29	189	91	Midfield	150	2012-09-11
338	Robbie Brady	15	1992-01-14	175	69	Midfield	121	2012-09-11
339	Wes Hoolahan	15	1982-05-20	168	71	Midfield	121	2008-05-29
340	Stephen Quinn	15	1986-04-01	168	60	Midfield	151	2013-06-02
341	Shane Long	15	1987-01-22	180	81	Forward	77	2007-02-07
342	Robbie Keane	15	1980-07-08	175	72	Forward	152	1998-03-25
343	Jon Walters	15	1983-09-20	183	79	Forward	37	2010-11-17
344	Daryl Murphy	15	1983-03-15	191	88	Forward	147	2007-05-23
345	Costel Pantilimon	16	1987-02-01	203	96	Goalkeeper	28	2008-11-19
346	Ciprian Tătăruşanu	16	1986-02-09	195	88	Goalkeeper	62	2010-11-17
347	Silviu Lung	16	1989-06-04	189	78	Goalkeeper	153	2010-06-05
348	Alexandru Măţel	16	1989-10-17	177	72	Defender	57	2011-09-02
349	Răzvan Raţ	16	1981-05-26	178	72	Defender	154	2002-02-13
350	Cosmin Moţi	16	1984-12-03	183	74	Defender	155	2008-02-06
351	Vlad Chiricheş	16	1989-11-14	184	75	Defender	5	2011-08-10
352	Valerică Găman	16	1989-02-25	188	72	Defender	156	2011-11-11
353	Steliano Filip	16	1994-05-15	177	73	Defender	157	2015-11-17
354	Dragoş Grigore	16	1986-09-07	185	76	Defender	158	2011-02-09
355	Cristian Săpunaru	16	1984-04-05	187	81	Defender	153	2008-05-31
356	Ovidiu Hoban	16	1982-12-27	182	80	Midfield	92	2013-06-04
357	Mihai Pintilii	16	1984-11-09	180	78	Midfield	159	2011-08-10
358	Nicolae Stanciu	16	1993-05-07	170	69	Midfield	160	2016-03-23
359	Gabriel Torje	16	1989-11-22	168	71	Midfield	17	2010-09-03
360	Lucian Sânmărtean	16	1980-03-13	175	70	Midfield	161	2002-11-20
361	Andrei Prepeliţă	16	1985-12-08	178	79	Midfield	162	2014-09-07
362	Alexandru Chipciu	16	1989-05-18	177	74	Forward	160	2011-08-10
363	Denis Alibec	16	1991-01-05	187	77	Forward	153	2015-10-11
364	Claudiu Keșerü	16	1986-12-02	178	71	Forward	155	2013-10-11
365	Florin Andone	16	1993-04-11	182	78	Forward	163	2015-06-13
366	Bogdan Stancu	16	1987-06-28	183	75	Forward	164	2010-08-11
367	Adrian Popa	16	1988-07-24	169	71	Forward	159	2012-10-16
368	Ján Mucha	18	1982-12-05	189	90	Goalkeeper	101	2008-02-06
369	Ján Novota	18	1983-11-29	197	90	Goalkeeper	116	2014-05-23
370	Matúš Kozáčik	18	1983-12-27	193	88	Goalkeeper	16	2006-12-10
371	Peter Pekarík	18	1986-10-30	176	70	Defender	75	2006-12-10
372	Martin Škrtel	18	1984-12-15	193	81	Defender	165	2004-07-09
373	Ján Ďurica	18	1981-12-10	188	86	Defender	166	2003-12-10
374	Norbert Gyömber	18	1992-07-03	189	74	Defender	13	2014-03-05
375	Milan Škriniar	18	1995-02-11	187	80	Defender	140	2016-05-27
376	Tomáš Hubočan	18	1985-09-17	184	70	Defender	167	2006-12-10
377	Kornel Saláta	18	1985-01-24	191	89	Defender	101	2008-05-24
378	Ján Greguš	18	1991-01-29	189	70	Midfield	168	2015-03-31
379	Vladimír Weiss	18	1989-11-30	173	71	Midfield	99	2009-08-12
380	Ondrej Duda	18	1994-12-05	181	74	Midfield	75	2014-11-18
381	Miroslav Stoch	18	1989-10-19	169	66	Midfield	165	2009-02-10
382	Patrik Hrošovský	18	1992-04-22	172	68	Midfield	16	2014-11-18
383	Marek Hamšík	18	1987-07-27	183	79	Midfield	5	2007-02-07
384	Dušan Švento	18	1985-08-01	178	70	Midfield	76	2006-08-15
385	Juraj Kucka	18	1987-02-26	186	86	Midfield	119	2008-11-19
386	Róbert Mak	18	1991-03-08	179	78	Midfield	47	2013-02-06
387	Viktor Pečovský	18	1983-05-24	171	74	Midfield	169	2012-08-15
388	Stanislav Šesták	18	1982-12-16	180	74	Forward	90	2004-08-18
389	Adam Nemec	18	1985-09-02	190	84	Forward	157	2006-12-10
390	Michal Ďuriš	18	1988-06-01	183	75	Forward	16	2012-08-15
391	Iker Casillas	19	1981-05-20	185	84	Goalkeeper	144	2000-06-03
392	Sergio Rico	19	1993-09-01	195	90	Goalkeeper	82	2016-06-01
393	César Azpilicueta	19	1989-08-28	178	75	Defender	39	2013-02-06
394	Gerard Piqué	19	1987-02-02	193	85	Defender	60	2009-02-11
395	Marc Bartra	19	1991-01-15	183	74	Defender	87	2014-09-08
396	Héctor Bellerín	19	1995-03-19	177	74	Defender	170	2016-05-29
397	Sergio Ramos	19	1986-03-30	183	75	Defender	61	2005-03-26
398	Juanfran	19	1985-01-09	180	72	Defender	50	2012-05-26
399	Mikel San José	19	1989-05-30	186	77	Defender	171	2014-09-04
400	Jordi Alba	19	1989-03-21	170	68	Defender	60	2011-10-11
401	Sergio Busquets	19	1988-07-16	189	76	Midfield	60	2009-04-01
402	Andrés Iniesta	19	1984-05-11	171	68	Midfield	60	2006-05-27
403	Koke	19	1992-01-08	178	74	Midfield	50	2013-08-14
404	Cesc Fàbregas	19	1987-05-04	175	74	Midfield	39	2006-03-01
405	Thiago Alcántara	19	1991-04-11	172	71	Midfield	26	2011-08-10
406	Bruno Soriano	19	1984-06-12	184	73	Midfield	172	2010-08-11
407	David Silva	19	1986-01-08	173	67	Midfield	48	2006-11-15
408	Álvaro Morata	19	1992-10-23	189	85	Forward	61	2014-11-15
409	Lucas Vázquez	19	1991-07-01	173	70	Forward	61	\N
410	Pedro Rodríguez	19	1987-07-28	167	62	Forward	39	2010-05-29
411	Aritz Aduriz	19	1981-02-11	181	75	Forward	171	2010-10-08
412	Nolito	19	1986-10-15	175	65	Forward	48	2014-11-18
413	Andreas Isaksson	20	1981-10-03	200	86	Goalkeeper	173	2002-03-27
414	Robin Olsen	20	1990-01-08	198	89	Goalkeeper	168	2015-01-15
415	Patrik Carlgren	20	1992-01-08	188	84	Goalkeeper	105	\N
416	Mikael Lustig	20	1986-12-13	189	78	Defender	174	2008-01-19
417	Erik Johansson	20	1988-12-30	191	84	Defender	168	2014-01-21
418	Andreas Granqvist	20	1985-04-16	192	84	Defender	137	2006-01-23
419	Pontus Jansson	20	1991-02-13	194	89	Defender	131	2012-01-18
420	Victor Nilsson Lindelöf	20	1994-07-17	187	80	Defender	143	2016-03-24
421	Ludwig Augustinsson	20	1994-04-21	181	74	Defender	168	2015-01-15
422	Emil Forsberg	20	1991-10-23	179	78	Midfield	32	2014-01-17
423	Sebastian Larsson	20	1985-06-06	178	70	Midfield	43	2008-02-06
424	Albin Ekdal	20	1989-07-28	186	75	Midfield	175	2011-08-10
425	Kim Källström	20	1982-08-24	185	87	Midfield	113	2001-02-01
426	Oscar Hiljemark	20	1992-06-28	184	75	Midfield	176	2012-01-18
427	Pontus Wernbloom	20	1986-06-25	187	85	Midfield	177	2007-01-18
428	Oscar Lewicki	20	1992-07-14	171	68	Midfield	112	2014-01-17
429	Jimmy Durmaz	20	1989-03-22	180	69	Midfield	178	2012-01-18
430	Erkan Zengin	20	1985-08-05	180	72	Midfield	179	2013-03-26
431	Zlatan Ibrahimović	20	1981-10-03	195	95	Forward	49	2001-01-31
432	Marcus Berg	20	1986-08-17	184	75	Forward	180	2008-02-06
433	Emir Kujovic	20	1988-06-22	194	87	Forward	181	2016-03-24
434	John Guidetti	20	1992-04-15	185	79	Forward	182	2012-02-29
435	Yann Sommer	21	1988-12-17	183	79	Goalkeeper	183	2012-05-30
436	Marwin Hitz	21	1987-09-18	193	86	Goalkeeper	24	2015-06-10
437	Roman Bürki	21	1990-11-14	187	85	Goalkeeper	87	2014-11-18
438	Stephan Lichtsteiner	21	1984-01-16	182	75	Defender	64	2006-11-15
439	François Moubandje	21	1990-06-21	180	74	Defender	178	2014-11-15
440	Nico Elvedi	21	1996-09-30	188	83	Defender	183	2016-05-28
441	Steve von Bergen	21	1983-06-10	182	79	Defender	184	2006-09-06
442	Michael Lang	21	1991-02-08	185	79	Defender	15	2013-08-14
443	Ricardo Rodríguez	21	1992-08-25	181	77	Defender	86	2011-10-07
444	Johan Djourou	21	1987-01-18	191	87	Defender	175	2006-03-01
445	Fabian Schär	21	1991-12-20	186	84	Defender	63	2013-08-14
446	Fabian Frei	21	1989-01-08	182	77	Midfield	185	2011-10-07
447	Granit Xhaka	21	1992-09-27	185	82	Midfield	66	2011-06-04
448	Valon Behrami	21	1985-04-19	185	78	Midfield	28	2005-10-08
449	Denis Zakaria	21	1996-11-20	191	76	Midfield	184	2016-05-28
450	Blerim Džemaili	21	1986-04-12	179	73	Midfield	73	2006-03-01
451	Gelson Fernandes	21	1986-09-02	179	70	Midfield	80	2007-08-22
452	Xherdan Shaqiri	21	1991-10-10	169	72	Midfield	37	2010-03-03
453	Breel Embolo	21	1997-02-14	185	84	Forward	35	2015-03-31
454	Haris Seferović	21	1992-02-22	185	85	Forward	22	2013-02-06
455	Shani Tarashaj	21	1995-02-07	176	77	Forward	22	2016-03-25
456	Admir Mehmedi	21	1991-03-16	183	81	Forward	23	2011-06-04
457	Eren Derdiyok	21	1988-06-12	191	90	Forward	88	2008-02-06
458	Volkan Babacan	22	1988-08-11	192	86	Goalkeeper	20	2014-10-13
459	Onur Kıvrak	22	1988-01-01	187	74	Goalkeeper	166	2010-05-26
460	Harun Tekin	22	1989-06-17	187	78	Goalkeeper	68	\N
461	Semih Kaya	22	1991-02-24	183	66	Defender	88	2012-02-29
462	Hakan Balta	22	1983-03-23	184	80	Defender	88	2006-04-12
463	Ahmet Çalık	22	1994-02-26	184	77	Defender	164	2015-11-17
464	Gökhan Gönül	22	1985-01-04	174	73	Defender	146	2007-11-17
465	İsmail Köybaşı	22	1989-07-10	177	75	Defender	165	2009-08-12
466	Caner Erkin	22	1988-10-04	181	76	Defender	146	2006-05-26
467	Şener Özbayraklı	22	1990-01-23	171	71	Defender	165	2015-03-31
468	Nuri Şahin	22	1988-09-05	179	65	Midfield	87	2005-10-08
469	Hakan Çalhanoğlu	22	1994-02-08	176	76	Midfield	23	2013-09-06
470	Selçuk İnan	22	1985-02-10	182	74	Midfield	88	2007-10-13
471	Arda Turan	22	1987-01-30	178	76	Midfield	60	2006-08-16
472	Olcay Şahan	22	1987-05-26	179	71	Midfield	146	2013-03-22
473	Oğuzhan Özyakup	22	1992-09-23	180	75	Midfield	146	2013-05-28
474	Mehmet Topal	22	1986-03-03	187	82	Midfield	165	2008-02-06
475	Ozan Tufan	22	1995-03-23	179	70	Midfield	165	2014-05-25
476	Yunus Mallı	22	1992-02-24	179	70	Midfield	185	2015-11-13
477	Volkan Şen	22	1987-07-07	175	68	Midfield	165	2010-03-03
478	Cenk Tosun	22	1991-06-07	183	78	Forward	146	2013-10-15
479	Burak Yılmaz	22	1985-07-15	188	77	Forward	186	2006-04-12
480	Emre Mor	22	1997-07-24	168	63	Forward	87	2016-05-29
481	Denys Boyko	23	1988-01-29	194	82	Goalkeeper	187	2014-11-18
482	Andriy Pyatov	23	1984-06-28	190	84	Goalkeeper	56	2007-08-22
483	Mykyta Shevchenko	23	1993-01-26	187	80	Goalkeeper	56	\N
484	Bohdan Butko	23	1991-01-13	180	68	Defender	56	2011-09-02
485	Yevhen Khacheridi	23	1987-07-28	198	85	Defender	58	2009-10-10
486	Olexandr Kucher	23	1982-10-22	184	77	Defender	56	2006-08-15
487	Vyacheslav Shevchuk	23	1979-05-13	184	78	Defender	56	2003-04-30
488	Artem Fedetskiy	23	1985-04-26	183	76	Defender	31	2010-05-25
489	Yaroslav Rakitskiy	23	1989-08-03	180	70	Defender	56	2009-10-10
490	Anatoliy Tymoshchuk	23	1979-03-30	181	70	Midfield	188	2000-04-26
491	Taras Stepanenko	23	1989-08-08	181	75	Midfield	56	2010-11-17
492	Viktor Kovalenko	23	1996-02-14	182	75	Midfield	56	2016-03-24
493	Ruslan Rotan	23	1981-10-29	174	67	Midfield	189	2003-02-12
494	Serhiy Sydorchuk	23	1991-05-02	189	90	Midfield	58	2014-10-09
495	Serhiy Rybalka	23	1990-04-01	176	70	Midfield	58	2015-03-31
496	Denys Garmash	23	1990-04-19	186	72	Midfield	58	2011-10-07
497	Olexandr Zinchenko	23	1996-12-15	175	61	Midfield	190	2015-10-12
498	Olexandr Karavaev	23	1992-06-02	173	65	Midfield	191	2015-10-09
499	Andriy Yarmolenko	23	1989-10-23	189	81	Forward	58	2009-09-05
500	Roman Zozulya	23	1989-11-17	176	72	Forward	192	2010-06-02
501	Yevhen Konoplyanka	23	1989-09-29	176	69	Forward	35	2010-05-25
502	Yevhen Seleznyov	23	1985-07-20	188	85	Forward	56	2008-05-24
503	Pylyp Budkivskiy	23	1992-03-10	196	81	Forward	193	2014-10-09
504	Wayne Hennessey	24	1987-01-24	198	90	Goalkeeper	52	2007-05-26
505	Owain Fôn Williams	24	1987-03-17	193	77	Goalkeeper	194	2015-11-13
506	Danny Ward	24	1993-06-22	191	88	Goalkeeper	195	2016-03-24
507	Chris Gunter	24	1989-07-21	180	71	Defender	151	2007-05-26
508	Neil Taylor	24	1989-02-07	175	64	Defender	111	2010-05-23
509	Ben Davies	24	1993-04-24	181	76	Defender	29	2012-10-12
510	James Chester	24	1989-01-23	177	75	Defender	196	2014-06-04
511	Ashley Williams	24	1984-08-23	183	71	Defender	51	2008-03-26
512	Jazz Richards	24	1991-04-12	185	78	Defender	114	2012-05-27
513	James Collins	24	1983-08-23	188	83	Defender	84	2004-05-27
514	Joe Allen	24	1990-03-14	168	62	Midfield	37	2009-05-29
515	Andy King	24	1988-10-29	183	74	Midfield	25	2009-05-29
516	Aaron Ramsey	24	1990-12-26	178	76	Midfield	66	2008-11-19
517	David Edwards	24	1986-02-03	183	78	Midfield	117	2007-11-17
518	Joe Ledley	24	1987-01-23	183	73	Midfield	52	2005-09-07
519	Jonathan Williams	24	1993-10-09	168	60	Midfield	197	2013-03-22
520	David Vaughan	24	1983-02-18	171	70	Midfield	198	2003-05-26
521	Hal Robson-Kanu	24	1989-05-21	183	83	Forward	125	2010-05-23
522	Gareth Bale	24	1989-07-16	183	74	Forward	61	2006-05-27
523	George Williams	24	1995-09-07	172	73	Forward	199	2014-06-04
524	David Cotterill	24	1987-12-04	175	71	Forward	200	2005-10-12
525	Sam Vokes	24	1989-10-21	186	90	Forward	78	2008-05-28
526	Simon Church	24	1988-12-10	183	84	Forward	201	2009-05-29
\.


--
-- Name: player_id_seq; Type: SEQUENCE SET; Schema: euro2016app; Owner: arif
--

SELECT pg_catalog.setval('player_id_seq', 526, true);


--
-- Data for Name: team; Type: TABLE DATA; Schema: euro2016app; Owner: arif
--

COPY team (id, name) FROM stdin;
1	Albania
2	Austria
3	Belgium
4	Croatia
5	Czech Republic
6	England
7	France
8	Germany
9	Hungary
10	Iceland
11	Italy
12	Northern Ireland
13	Poland
14	Portugal
15	Republic of Ireland
16	Romania
17	Russia
18	Slovakia
19	Spain
20	Sweden
21	Switzerland
22	Turkey
23	Ukraine
24	Wales
\.


--
-- Name: team_id_seq; Type: SEQUENCE SET; Schema: euro2016app; Owner: arif
--

SELECT pg_catalog.setval('team_id_seq', 24, true);


--
-- Name: club_pkey; Type: CONSTRAINT; Schema: euro2016app; Owner: arif
--

ALTER TABLE ONLY club
    ADD CONSTRAINT club_pkey PRIMARY KEY (id);


--
-- Name: goal_pkey; Type: CONSTRAINT; Schema: euro2016app; Owner: arif
--

ALTER TABLE ONLY goal
    ADD CONSTRAINT goal_pkey PRIMARY KEY (id);


--
-- Name: match_pkey; Type: CONSTRAINT; Schema: euro2016app; Owner: arif
--

ALTER TABLE ONLY match
    ADD CONSTRAINT match_pkey PRIMARY KEY (id);


--
-- Name: player_pkey; Type: CONSTRAINT; Schema: euro2016app; Owner: arif
--

ALTER TABLE ONLY player
    ADD CONSTRAINT player_pkey PRIMARY KEY (id);


--
-- Name: team_pkey; Type: CONSTRAINT; Schema: euro2016app; Owner: arif
--

ALTER TABLE ONLY team
    ADD CONSTRAINT team_pkey PRIMARY KEY (id);


--
-- Name: goal_match_id_fkey; Type: FK CONSTRAINT; Schema: euro2016app; Owner: arif
--

ALTER TABLE ONLY goal
    ADD CONSTRAINT goal_match_id_fkey FOREIGN KEY (match_id) REFERENCES match(id);


--
-- Name: goal_scorer_id_fkey; Type: FK CONSTRAINT; Schema: euro2016app; Owner: arif
--

ALTER TABLE ONLY goal
    ADD CONSTRAINT goal_scorer_id_fkey FOREIGN KEY (scorer_id) REFERENCES player(id);


--
-- Name: match_team_1_id_fkey; Type: FK CONSTRAINT; Schema: euro2016app; Owner: arif
--

ALTER TABLE ONLY match
    ADD CONSTRAINT match_team_1_id_fkey FOREIGN KEY (team_1_id) REFERENCES team(id);


--
-- Name: match_team_2_id_fkey; Type: FK CONSTRAINT; Schema: euro2016app; Owner: arif
--

ALTER TABLE ONLY match
    ADD CONSTRAINT match_team_2_id_fkey FOREIGN KEY (team_2_id) REFERENCES team(id);


--
-- Name: player_club_id_fkey; Type: FK CONSTRAINT; Schema: euro2016app; Owner: arif
--

ALTER TABLE ONLY player
    ADD CONSTRAINT player_club_id_fkey FOREIGN KEY (club_id) REFERENCES club(id);


--
-- Name: player_team_id_fkey; Type: FK CONSTRAINT; Schema: euro2016app; Owner: arif
--

ALTER TABLE ONLY player
    ADD CONSTRAINT player_team_id_fkey FOREIGN KEY (team_id) REFERENCES team(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

