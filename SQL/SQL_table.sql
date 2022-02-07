CREATE TABLE gamers (	
            id Serial  PRIMARY KEY,
            name VARCHAR(50) NOT NULL,
            city VARCHAR(50) NOT NULL,
            age INT NOT NULL,
            rating INT UNIQUE,
	    platform VARCHAR(50) NOT NULL,
	    id_games INT
)
    
INSERT INTO gamers (name, city, age, rating, platform, id_games)
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

SELECT name FROM gamers
WHERE city ILIKE '%a%'

SELECT COUNT(name) FROM gamers
WHERE platform = 'PC'


CREATE TABLE games (
	     id Serial PRIMARY KEY,
	     game VARCHAR(50) UNIQUE,
	     producer VARCHAR(50) NOT NULL
)

INSERT INTO games (game, producer)
       VALUES     ('World Of WarCraft', 'Blizzard'),
                  ('CS:GO', 'Valve'),
		  ('Dota2', 'Valve'),
		  ('Call Of Duty', 'Activision'),
		  ('Dying Light 2', 'Techland'),
		  ('Watch Dogs Legion', 'Ubisoft'),
		  ('GTA 6', 'Rockstar'),
		  ('Apex Legends', 'EA'),
		  ('Fortnite', 'Epic Games'),
		  ('PUBG', 'Krafton'),
		  ('League Of Legends', 'Riot Games'),
		  ('Path Of Exile', 'Grinding Gear Games');
		  
SELECT name, game FROM gamers JOIN games ON gamers.id_games = games.id
WHERE producer = 'Valve'

SELECT producer FROM games JOIN gamers ON games.id = gamers.id_games
GROUP BY producer
HAVING COUNT(name) > 2




