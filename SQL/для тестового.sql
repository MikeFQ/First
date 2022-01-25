CREATE TABLE client(	
	id Serial  PRIMARY KEY,
    name varchar(50) NOT NULL,
    contr_name varchar(50) NOT NULL,
    contr_number int UNIQUE,
    amount_of_applications int UNIQUE
)
    
INSERT INTO client(name, contr_name, contr_number, amount_of_applications)
	VALUES  ('Мегафон', 'Баширов К.В.', 785, 3),
			('Даичи', 'Борисов П.Р.', 786, 5),
			('ТНГ_Игрушки', 'Иванов П.С.', 787, 10),
			('Белуга', 'Сидоров А.С.', 788, 2),
			('Интегрита', 'Петров Н.А.', 789, 15);
    
SELECT contr_name, name, amount_of_applications FROM client
WHERE amount_of_applications >= 2 AND amount_of_applications <= 14
ORDER BY contr_name DESC, name ASC

