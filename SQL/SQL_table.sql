CREATE TABLE candidates (	
            id Serial  PRIMARY KEY,
            name varchar(50) NOT NULL,
            city varchar(50) NOT NULL,
            age int UNIQUE,
            rating int UNIQUE
)
    
INSERT INTO candidates (name, city, age, rating)
	VALUES      ('Andy', 'Seattle', 41, 1892),
	            ('Dough', 'NY', 36, 834),
		    ('Joaquin', 'Orlando', 33, 2471),
		    ('Edward', 'Dallas', 47, 859),
		    ('Tyler', 'Vancouver', 39, 934);
    
SELECT name, city, rating FROM candidates
WHERE rating >= 700 AND rating <= 2500
ORDER BY city DESC, name ASC

