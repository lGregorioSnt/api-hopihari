insert into users(first_name, last_name, email, password, birth_date, phone) values
("flaco", "lopez", "palmeiras@gmail.com", "$10$EylpY.Qgws0ldA9EP7Qiv.T2sie2/T8Wy0LLki6mIxTfx4uDQZa0C", '2008-08-05', "14997679303"),
("neymar", "santos", "raio3@gmail.com", "$10$bXdL70gyP2sZ/ijiR29PBO3CBHeB1NH5Z2mFn18W1eRwqaAnpAj3O", '2008-06-02', "14997679302"),
("gat", "gay", "do@gmail.com", "$10$J74qVRIZSVF1x7BPj1G8eezRgqm3vNp4WeaevRs30uG93InfxGg6a", '2008-11-10', "14997679301");

insert into rides (name, waiting_time, status, area) values
("Tiroteio", 8, "Normal", "A"),
("minhoca", 20, "Movimentado", "A"),
("alianz", 5, "Normal", "B");

		INSERT INTO `users_has_rides` (users_id, rides_id) VALUES (6, 15);
		INSERT INTO `users_has_rides` (users_id, rides_id) VALUES (7, 15);

		INSERT INTO `users_has_rides` (users_id, rides_id) VALUES (7, 16);
		INSERT INTO `users_has_rides` (users_id, rides_id) VALUES (8, 16);

		INSERT INTO `users_has_rides` (users_id, rides_id) VALUES (6, 17);
		INSERT INTO `users_has_rides` (users_id, rides_id) VALUES (8, 17);

-- ----------------------------------------------------------------------------------------------------------------------

	select users.first_name as name, 
			users_id,
            rides.name,
            rides.id
	from `users_has_rides`
    
	inner join users
		on users.id = `users_has_rides`.users_id
	inner join rides
		on rides.id = `users_has_rides`.Rides_id


		INSERT INTO rides (name, waiting_time, status, id_areas)
VALUES 
('NAMUSKITA', 0, 'open', (SELECT id FROM areas WHERE name = 'WildWest')),
('LA MINA DEL JOE SACRAMENTO', 0, 'open', (SELECT id FROM areas WHERE name = 'WildWest')),
('EVOLUTION', 0, 'open', (SELECT id FROM areas WHERE name = 'WildWest')),
('BRAVO BULL', 0, 'open', (SELECT id FROM areas WHERE name = 'WildWest')),
('GHOSTI HOTEL', 0, 'open', (SELECT id FROM areas WHERE name = 'WildWest')),
('RIO BRAVO', 0, 'open', (SELECT id FROM areas WHERE name = 'WildWest')),
('VAMVOLARI', 0, 'open', (SELECT id FROM areas WHERE name = 'WildWest')),
('SPLESHI', 0, 'open', (SELECT id FROM areas WHERE name = 'WildWest')),
('TIROLESA', 0, 'open', (SELECT id FROM areas WHERE name = 'WildWest'));

INSERT INTO rides (name, waiting_time, status, area)
VALUES 
('KATAKUMB', 16, 'open', (SELECT id FROM areas WHERE name = 'Mistieri')),
('EKATOMB', 10, 'open', (SELECT id FROM areas WHERE name = 'Mistieri')),
('MONTEZUM', 4, 'open', (SELECT id FROM areas WHERE name = 'Mistieri')),
('SIMULÁKRON', 6, 'open', (SELECT id FROM areas WHERE name = 'Mistieri')),
('VULAVIKING', 5, 'open', (SELECT id FROM areas WHERE name = 'Mistieri')),
('VURANG', 8, 'open', (SELECT id FROM areas WHERE name = 'Mistieri'));

INSERT INTO rides (name, waiting_time, status, area)
VALUES 
('THEATRO DI KAMINDA', 30, 'open', (SELECT id FROM areas WHERE name = 'KamindaMundi')),
('GIRANDA MUNDI', 8, 'open', (SELECT id FROM areas WHERE name = 'KamindaMundi')),
('JOGAKÍ DI KAMINDA', 10, 'open', (SELECT id FROM areas WHERE name = 'KamindaMundi')),
('LE VOYAGE', 15, 'open', (SELECT id FROM areas WHERE name = 'KamindaMundi'));

INSERT INTO rides (name, waiting_time, status, area)
VALUES 
('SPEEDI ´64', 5, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba')),
('VAMBATÊ', 3, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba')),
('CINEMOTION', 7, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba')),
('KATAPUL', 1, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba')),
('JAMBALAIA', 2, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba')),
('ARIBABOBBI', 8, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba')),
('PARANGOLÉ', 3, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba')),
('HADIKALI', 1, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba'));

INSERT INTO rides (name, waiting_time, status, area)
VALUES 
('KASTEL DI LENDAS', 12, 'open', (SELECT id FROM areas WHERE name = 'Infantasia')),
('GIRANDA POKOTÓ', 13, 'open', (SELECT id FROM areas WHERE name = 'Infantasia')),
('TOKA DO UGA', 1, 'open', (SELECT id FROM areas WHERE name = 'Infantasia')),
('BUGABALUM', 15, 'open', (SELECT id FROM areas WHERE name = 'Infantasia')),
('GIRALATA', 5, 'open', (SELECT id FROM areas WHERE name = 'Infantasia')),
('DISPENKITO', 2, 'open', (SELECT id FROM areas WHERE name = 'Infantasia')),
('KOMBOIO', 3, 'open', (SELECT id FROM areas WHERE name = 'Infantasia')),
('ASTRONAVI', 6, 'open', (SELECT id FROM areas WHERE name = 'Infantasia')),
('KLAPI KLAPI', 8, 'open', (SELECT id FROM areas WHERE name = 'Infantasia'));

