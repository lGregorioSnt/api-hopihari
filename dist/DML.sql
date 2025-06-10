insert into areas (name) 
values 
("Aribabiba"),
("KamindaMundi"),
("WildWest"),
("Infantasia"),
("Mistieri");

INSERT INTO rides (name, waiting_time, status, area)
VALUES 
('NAMUSKITA', 3, 'open', (SELECT id FROM areas WHERE name = 'WildWest')),
('LA MINA DEL JOE SACRAMENTO', 4, 'open', (SELECT id FROM areas WHERE name = 'WildWest')),
('EVOLUTION', 6, 'open', (SELECT id FROM areas WHERE name = 'WildWest')),
('BRAVO BULL', 11, 'open', (SELECT id FROM areas WHERE name = 'WildWest')),
('GHOSTI HOTEL', 10, 'open', (SELECT id FROM areas WHERE name = 'WildWest')),
('RIO BRAVO', 8, 'open', (SELECT id FROM areas WHERE name = 'WildWest')),
('VAMVOLARI', 5, 'open', (SELECT id FROM areas WHERE name = 'WildWest')),
('SPLESHI', 5, 'open', (SELECT id FROM areas WHERE name = 'WildWest')),
('TIROLESA', 5, 'open', (SELECT id FROM areas WHERE name = 'WildWest'));

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