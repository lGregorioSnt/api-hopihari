--nomes

-- Inserindo usuários
INSERT INTO users (id, first_name, last_name, email, password, birth_date, phone, created_at, updated_at) 
VALUES 
(1, 'Rony', 'Silva', 'rony@example.com', '$2b$10$fJtvJpwp6JMiQyetLDiqsOQW8hF3dv3qZcxZXMFH1UtYXugvST/MW', '1990-05-15', '11999990001', NOW(), NOW());

INSERT INTO users (id, first_name, last_name, email, password, birth_date, phone, created_at, updated_at) 
VALUES 
(2, 'Alan', 'Souza', 'alan@example.com', '$2b$10$fJtvJpwp6JMiQyetLDiqsOQW8hF3dv3qZcxZXMFH1UtYXugvST/MW', '1988-08-20', '11999990002', NOW(), NOW());

INSERT INTO users (id, first_name, last_name, email, password, birth_date, phone, created_at, updated_at) 
VALUES 
(3, 'Flaco', 'Oliveira', 'flaco@example.com', '$2b$10$fJtvJpwp6JMiQyetLDiqsOQW8hF3dv3qZcxZXMFH1UtYXugvST/MW', '1995-12-01', '11999990003', NOW(), NOW());



--brinquedos

INSERT INTO rides (id, nome, tempo_espera, status, area) VALUES (1, 'Montanha Russa', 30, 'aberto', 'Aventura');
INSERT INTO rides (id, nome, tempo_espera, status, area) VALUES (2, 'Torre do Medo', 45, 'aberto', 'Terror');
INSERT INTO rides (id, nome, tempo_espera, status, area) VALUES (3, 'Splash', 25, 'manutenção', 'Água');


--filas

INSERT INTO `lines` (users_id, rides_id) VALUES (1, 1);
INSERT INTO `lines` (users_id, rides_id) VALUES (2, 1);

INSERT INTO `lines` (users_id, rides_id) VALUES (1, 2);
INSERT INTO `lines` (users_id, rides_id) VALUES (3, 2);

INSERT INTO `lines` (users_id, rides_id) VALUES (2, 3);
INSERT INTO `lines` (users_id, rides_id) VALUES (3, 3);


		SELECT 
			users.first_name AS Name,
			rides.nome AS Brinquedo,
            users_id, rides_id
		FROM `lines`
		INNER JOIN users ON users.id = `lines`.users_id
		INNER JOIN rides ON rides.id = `lines`.rides_id
		
        
