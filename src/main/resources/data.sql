INSERT INTO `team` (`id`, `name`) VALUES (null,'France');
INSERT INTO `team` (`id`, `name`) VALUES (null,'Poland');

INSERT INTO `player` (`id`,`name`, `dob`,  `height`, `weight`, `position`, `club`, `debut`, `team_id`)
    SELECT null, 'Antoine Griezmann', '1991-03-21', '176', '67', 'Forward', 'Atlético', '2014-03-05', id FROM team WHERE name = 'France';
INSERT INTO `player` (`id`,`name`, `dob`,  `height`, `weight`, `position`, `club`, `debut`, `team_id`)
    SELECT null, 'Dimitri Payet', '1987-03-29', '175', '77', 'Midfield', 'West Ham', '2010-10-09', id FROM team WHERE name = 'France';
INSERT INTO `player` (`id`,`name`, `dob`,  `height`, `weight`, `position`, `club`, `debut`, `team_id`)
    SELECT null,'Bartosz Kapustka', '1996-12-23', '179', '60', 'Midfield', 'Cracovia', '2015-09-07', id FROM team WHERE name = 'Poland';