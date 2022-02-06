CREATE TABLE gamers (	
            id Serial  PRIMARY KEY,
            name varchar(50) NOT NULL,
            city varchar(50) NOT NULL,
            age int,
            rating int UNIQUE,
	    platform varchar(50) NOT NULL
)
    
INSERT INTO gamers (name, city, age, rating, platform)
	VALUES      ('Andy', 'Seattle', 21, 9, 'PC'),
	            ('Dough', 'NY', 36, 11, 'PS'),
		    ('Joaquin', 'Orlando', 23, 7, 'PS'),
		    ('Edward', 'Dallas', 17, 3, 'PC'),
		    ('Tyler', 'Vancouver', 39, 1, 'Xbox'),
		    ('Alex', 'Moscow', 19, 2, 'PC'),
		    ('Kate', 'London', 31, 4, 'Mobile'),
		    ('Ann', 'Minsk', 35, 6, 'Xbox'),
		    ('Bob', 'LA', 44, 5, 'Mobile'),
		    ('Helen', 'Toronto', 25, 8, 'PS'),
		    ('Alistair', 'Amsterdam', 43, 10, 'Xbox');
    
SELECT name, city, rating FROM gamers
WHERE rating >= 700 AND rating <= 2500
ORDER BY city DESC, name ASC

SELECT AVG(rating), MIN(age), MAX(age) FROM gamers
WHERE name LIKE 'A%'

SELECT AVG(age) FROM gamers
WHERE rating < 1000

SELECT name FROM gamers
WHERE city ILIKE '%a%'

SELECT COUNT(name) FROM gamers
WHERE platform = 'PC'


