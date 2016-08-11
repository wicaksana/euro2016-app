INSERT INTO `team` (`id`, `name`) VALUES (null,'France');
INSERT INTO `team` (`id`, `name`) VALUES (null,'Portugal');

INSERT INTO `player` (`id`,`name`, `dob`,  `height`, `weight`, `position`, `club`, `debut`, `team_id`)
    SELECT null, 'Antoine Griezmann', '1991-03-21', '176', '67', 'Forward', 'Atlético', '2014-03-05', id FROM team WHERE name = 'France';
INSERT INTO `player` (`id`,`name`, `dob`,  `height`, `weight`, `position`, `club`, `debut`, `team_id`)
    SELECT null, 'Dimitri Payet', '1987-03-29', '175', '77', 'Midfield', 'West Ham', '2010-10-09', id FROM team WHERE name = 'France';
INSERT INTO `player` (`id`,`name`, `dob`,  `height`, `weight`, `position`, `club`, `debut`, `team_id`)
   SELECT null,'Renato Sanches', '1997-08-18', '176', '70', 'Midfield', 'Bayern Muenchen', '2016-03-25', id FROM team WHERE name = 'Portugal';

INSERT INTO `euro_match` (`id`,`date`, `phase`,  `stadium`, `team1_id`, `team2_id`)
  SELECT null,'2016-07-10',
              'Final',
              'Stade de France, Saint-Denis',
              (SELECT team.id FROM team WHERE team.name = 'France'),
              (SELECT team.id FROM team WHERE team.name = 'Portugal');