CREATE TABLE gamers (	
            id Serial PRIMARY KEY,
            name VARCHAR(50) NOT NULL,
            city VARCHAR(50) NOT NULL,
            age INT NOT NULL,
            rating INT UNIQUE,
	    platform VARCHAR(50) NOT NULL,
	    id_game INT
)
    
INSERT INTO gamers (name, city, age, rating, platform, id_game)
        VALUES      ('Andy', 'Seattle', 21, 9, 'PC', 10),
	            ('Dough', 'NY', 36, 22, 'PS', 5),
		    ('Joaquin', 'Orlando', 23, 7, 'PS', 2),
		    ('Edward', 'Dallas', 17, 20, 'PC', 9),
		    ('Tyler', 'Vancouver', 39, 1, 'Xbox', 4),
		    ('Alex', 'Moscow', 19, 2, 'PC', 9),
		    ('Kate', 'London', 31, 4, 'Mobile', 11),
		    ('Ann', 'Minsk', 35, 6, 'Xbox', 2),
		    ('Bob', 'LA', 44, 5, 'Mobile', 6),
		    ('Helen', 'Toronto', 25, 8, 'PS', 12),
		    ('Alistair', 'Amsterdam', 43, 10, 'Xbox', 1),
		    ('Azamat', 'Tashkent', 24, 12, 'PC', 7),
		    ('Tanya', 'Kyiv', 18, 15, 'PC', 3),
		    ('Chu Hua', 'Beijing',28, 13, 'PC', 10),
		    ('Dae', 'Seoul', 26, 14, 'Mobile', 5),
		    ('Andrew', 'Adelaide', 21, 16, 'Xbox', 4),
		    ('Ishaan', 'Mumbai', 31, 17, 'PC', 1),
		    ('Alexey', 'Bryansk', 28, 3, 'PC', 7),
		    ('Maxim', 'Vologda', 34, 18, 'PC', 9),
		    ('Sophia', 'Barcelona', 27, 19, 'PS', 3);
    
SELECT name, city, rating FROM gamers
WHERE rating >= 3 AND rating <= 15
ORDER BY city DESC, name ASC

SELECT AVG(rating), MIN(age), MAX(age) FROM gamers
WHERE name LIKE 'A%'

SELECT AVG(age) FROM gamers
WHERE rating < 7

SELECT MAX(rating) FROM gamers
WHERE platform = 'Xbox' OR platform = 'PS'

SELECT name FROM gamers
WHERE city LIKE '%a%'

SELECT COUNT(name) FROM gamers
WHERE platform = 'PC'


CREATE TABLE games (
	     id INT,
	     game VARCHAR(50) UNIQUE,
	     producer VARCHAR(50) NOT NULL
       FOREIGN KEY(id) REFERENCES gamers(id_game)
)

INSERT INTO games (id, game, producer)
       VALUES     (1, 'World Of WarCraft', 'Blizzard'),
                  (2, 'CS:GO', 'Valve'),
		  (3, 'Dota2', 'Valve'),
		  (4, 'Call Of Duty', 'Activision'),
		  (5, 'Dying Light 2', 'Techland'),
		  (6, 'Watch Dogs Legion', 'Ubisoft'),
		  (7, 'GTA 6', 'Rockstar'),
		  (8, 'Apex Legends', 'EA'),
		  (9, 'Fortnite', 'Epic Games'),
		  (10, 'PUBG', 'Krafton'),
		  (11, 'League Of Legends', 'Riot Games'),
		  (12, Path Of Exile', 'Grinding Gear Games');
		  
SELECT name, game FROM gamers JOIN games ON gamers.id_game = games.id
WHERE producer = 'Valve'


-- Вывести издателей, у которых больше чем 2 игрока в рейтинге:

SELECT producer FROM games JOIN gamers ON games.id = gamers.id_game
GROUP BY producer
HAVING COUNT(name) > 2

UPDATE gamers SET name = 'Valentine', city = 'Rotterdam', age = 33, id_game = 3
WHERE id = 11

DELETE FROM games
WHERE game = 'Call Of Duty'




