insert into users(first_name, last_name, email, password, birth_date, phone) values
("flaco", "lopez", "palmeiras@gmail.com", "$10$EylpY.Qgws0ldA9EP7Qiv.T2sie2/T8Wy0LLki6mIxTfx4uDQZa0C", '2008-08-05', "14997679303"),
("neymar", "santos", "raio3@gmail.com", "$10$bXdL70gyP2sZ/ijiR29PBO3CBHeB1NH5Z2mFn18W1eRwqaAnpAj3O", '2008-06-02', "14997679302"),
("gat", "gay", "do@gmail.com", "$10$J74qVRIZSVF1x7BPj1G8eezRgqm3vNp4WeaevRs30uG93InfxGg6a", '2008-11-10', "14997679301");

insert into rides (name, waiting_time, status, area) values
("Tiroteio", 8, "Normal", "A"),
("minhoca", 20, "Movimentado", "A"),
("alianz", 5, "Normal", "B");

	INSERT INTO `users_has_rides` (users_id, rides_id) VALUES (1, 1);
	INSERT INTO `users_has_rides` (users_id, rides_id) VALUES (2, 1);

	INSERT INTO `users_has_rides` (users_id, rides_id) VALUES (1, 2);
	INSERT INTO `users_has_rides` (users_id, rides_id) VALUES (3, 2);

	INSERT INTO `users_has_rides` (users_id, rides_id) VALUES (2, 3);
	INSERT INTO `users_has_rides` (users_id, rides_id) VALUES (3, 3);

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