INSERT INTO `team` (`id`, `name`) VALUES (null,'France');
INSERT INTO `team` (`id`, `name`) VALUES (null,'Portugal');

INSERT INTO `player` (`id`,`name`, `dob`,  `height`, `weight`, `position`, `club`, `debut`, `team_id`)
    SELECT null, 'Antoine Griezmann', '1991-03-21', '176', '67', 'Forward', 'Atlético', '2014-03-05', id FROM team WHERE name = 'France';
INSERT INTO `player` (`id`,`name`, `dob`,  `height`, `weight`, `position`, `club`, `debut`, `team_id`)
    SELECT null, 'Dimitri Payet', '1987-03-29', '175', '77', 'Midfield', 'West Ham', '2010-10-09', id FROM team WHERE name = 'France';
INSERT INTO `player` (`id`,`name`, `dob`,  `height`, `weight`, `position`, `club`, `debut`, `team_id`)
   SELECT null,'Éder', '1987-12-22', '188', '81', 'Forward', 'Lille OSC', '2012-09-11', id FROM team WHERE name = 'Portugal';

INSERT INTO `match` (`id`,`date`, `phase`,  `stadium`, `team1_id`, `team2_id`)
  SELECT null,'2016-07-10',
              'Final',
              'Stade de France, Saint-Denis',
              (SELECT team.id FROM team WHERE team.name = 'France'),
              (SELECT team.id FROM team WHERE team.name = 'Portugal');

INSERT INTO `goal` (`id`,`scorer_id`, `match`,  `minute`)
  SELECT null,
    (SELECT player.id FROM player WHERE player.name = 'Éder'),
    (SELECT m.id FROM `match` m WHERE m.phase = 'Final'),
    109;
