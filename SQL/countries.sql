/*
The biggest part of the data is taken from https://www.worldometers.info
*/

USE GeographyDB
GO

DROP TABLE IF EXISTS countries
DROP TABLE IF EXISTS economy
DROP TABLE IF EXISTS Nuclear_Power_Production_by_Country
GO


CREATE TABLE countries 
(
id INT, 
country_name VARCHAR(50) NULL,
capital VARCHAR(50) NULL,
land_area_km2 BIGINT NULL,
population BIGINT NULL,
region VARCHAR(50) NULL,
isLandlocked BIT NOT NULL,
CONSTRAINT PK_Country_Id NOT NULL PRIMARY KEY CLUSTERED(id)
);

CREATE TABLE economy
(
country_id INT NOT NULL,
GDP_nominal BIGINT NULL,
GDP_per_capita INT NULL,
CONSTRAINT FK_economy FOREIGN KEY(country_id)
REFERENCES countries(id)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE Nuclear_Power_Production_by_Country
(
ID_country INT NOT NULL,
Number_of_Operating_Reactors INT NULL,
Nuclear_Electricity_Supplied_GWh INT NULL,
CONSTRAINT FK_Nuclear_Power_Production_by_Country FOREIGN KEY(ID_country)
REFERENCES countries(id)
ON DELETE CASCADE
ON UPDATE CASCADE
);




INSERT INTO countries
VALUES 
(1, 'USA', 'Washington', 9147420, 331002651, 'North America', 0),
(2, 'China', 'Beijing', 9388211, 1453715794, 'Asia', 0),
(3, 'United Kingdom', 'London', 241930, 68812730, 'Europe', 0),
(4, 'Uzbekistan', 'Tashkent', 425400, 34760432, 'Asia', 1),
(5, 'South Africa', 'Pretoria', 1213090, 61289459, 'Africa', 0),
(6, 'Switzerland', 'Bern', 39516, 8819982, 'Europe', 1),
(7, 'Russia', 'Moscow', 16376870, 146095074, 'Eurasia', 0),
(8, 'Brazil', 'Brasilia', 8358140, 216504976, 'South America', 0),
(9, 'Afghanistan', 'Kabul', 652860, 41312335, 'Asia', 1),
(10, 'France', 'Paris', 547557, 65645936, 'Europe', 0),
(11, 'Japan', 'Tokyo', 364555, 125491513, 'Asia', 0),
(12, 'India', 'Delhi', 2973190, 1415684947, 'Asia', 0),
(13, 'Germany', 'Berlin', 348560, 84476479, 'Europe', 0),
(14, 'Turkey', 'Ankara', 769630, 86731497, 'Eurasia', 0),
(15, 'South Korea', 'Seoul', 97230, 51382561, 'Asia', 0),
(16, 'Canada', 'Ottawa', 9093510, 38610007, 'North America', 0),
(17, 'Nigeria', 'Abuja', 910770, 220117734, 'Africa', 0),
(18, 'Saudi Arabia', 'Riyadh', 2149690, 36261279, 'Asia', 0),
(19, 'Australia', 'Canberra', 7682300, 26281568, 'Australia', 0),
(20, 'Ukraine', 'Kyiv', 579320, 43070343, 'Europe', 0),
(21, 'New Zealand', 'Wellington', 263310, 4924781, 'Oceania', 0),
(22, 'United Arab Emirates', 'Abu Dhabi', 83600, 10206515, 'Asia', 0),
(23, 'Israel', 'Jerusalem', 21640, 9016963, 'Asia', 0),
(24, 'Argentina', 'Buenos Aires', 2736690, 46284599, 'South America', 0),
(25, 'Indonesia', 'Jakarta', 1811570, 281144851, 'Asia', 0),
(26, 'Luxembourg', 'Luxembourg', 2590, 653216, 'Europe', 1),
(27, 'Italy', 'Rome', 294140, 60234732, 'Europe', 0),
(28, 'Spain', 'Madrid', 498800, 46801257, 'Europe', 0),
(29, 'Kazakhstan', 'Nur-Sultan', 2699700, 19370661, 'Asia', 1),
(30, 'Mexico', 'Mexico City', 1943950, 132501560, 'North America', 0),
(31, 'Bangladesh', 'Dhaka', 130170, 169006754, 'Asia', 0),
(32, 'Liechtenstein', 'Liechtenstein', 160, 38411, 'Europe', 1),
(33, 'Pakistan', 'Islamabad', 770880, 232462222, 'Asia', 0),
(34, 'Ethiopia', 'Addis Ababa', 1000000, 122755949, 'Africa', 1),
(35, 'Philippines', 'Manila', 298170, 113452562, 'Asia', 0),
(36, 'Thailand', 'Bangkok', 510890, 70252046, 'Asia', 0),
(37, 'Serbia', 'Belgrade', 87460, 8648039, 'Europe', 1),
(38, 'Nepal', 'Kathmandu', 143350, 30545109, 'Asia', 1),
(39, 'Poland', 'Warsaw', 306230, 37740606, 'Europe', 0),
(40, 'Vietnam', 'Hanoi', 310070, 97338579, 'Asia', 0),
(41, 'DR Congo', 'Kinshasa', 2267050, 97127536, 'Africa', 0),
(42, 'Iran', 'Tehran', 1628550, 86842900, 'Asia', 0),
(43, 'Tanzania', 'Dodoma', 885800, 64437326, 'Africa', 0),
(44, 'Netherlands', 'Amsterdam', 33720, 17232656, 'Europe', 0),
(45, 'Mongolia', 'Ulan Bator', 1553560, 3419461, 'Asia', 1),
(46, 'Austria', 'Vienna', 82409, 9140138, 'Europe', 1),
(47, 'Cuba', 'Havana', 106440, 11308914, 'Caribbean region', 0),
(48, 'Croatia', 'Zagreb', 55960, 4041354, 'Europe', 0),
(49, 'Armenia', 'Yerevan', 28470, 2977515, 'Eurasia', 1),
(50, 'Greece', 'Athens', 128900, 10294103, 'Europe', 0),
(51, 'Sweden', 'Stockholm', 410340, 10263474, 'Europe', 0),
(52, 'Belgium', 'Brussels', 30280, 11720509, 'Europe', 0),
(53, 'Norway', 'Oslo', 365268, 5532235, 'Europe', 0),
(54, 'Czechia', 'Prague', 77240, 10760217, 'Europe', 1);


INSERT INTO economy
VALUES
(1, 19485394000000, 59939),
(2, 12237700479375, 8612),
(11, 4872415104315, 38214),
(13, 3693204332230, 44680),
(12, 2650725335364, 1980),
(3, 2637866340434, 39532),
(10, 2582501307216, 39827),
(8, 2053594877013, 9881),
(27, 1943835376342, 32038),
(16, 1647120175449, 44841),
(7, 1578417211937, 10846),
(15, 1530750923149, 29958),
(19, 1323421072479, 53831),
(28, 1314314164402, 28175),
(30, 1150887823404, 9224),
(25, 1015420587285, 3837),
(14, 851549299635, 10498),
(44, 830572618850, 48796),
(18, 686738400000, 20747),
(6, 678965423322, 80296),
(24, 637430331479, 14508),
(51, 535607385506, 54075),
(39, 526465839003, 13871),
(52, 494763551891, 43325),
(36, 455302682986, 6579),
(42, 454012768724, 5628),
(46, 416835975862, 47261),
(53, 399488897844, 75428),
(22, 382575085092, 40325),
(17, 375745486521, 1969);

INSERT INTO Nuclear_Power_Production_by_Country
VALUES
(1, 96, 789919),
(2, 50, 344748),
(10, 58, 338671),
(7, 39, 201821),
(15, 24, 152583),
(16, 19, 92166),
(20, 15, 71550),
(13, 6, 60918),
(28, 7, 55825),
(51, 7, 47362),
(3, 15, 45668),
(11, 33, 43099),
(12, 22, 40374),
(52, 7, 32793),
(54, 6, 28372);

--UPDATE #countries SET name = 'Türkiye' WHERE id = 14;

--SELECT * FROM #countries;

--SELECT TOP(10) * FROM countries ORDER BY population DESC;

/*
SELECT
	TOP(25) *
 FROM
	countries c
	LEFT JOIN economy e ON e.country_id = c.id
 WHERE
	c.isLandlocked <> 0 AND e.GDP_per_capita > 25000
 ORDER BY
	e.GDP_per_capita DESC;
*/

--SELECT
--	c.region AS Region,
--	ISNULL(COUNT(c.name), 0) AS Amount_of_countries
-- FROM
--	countries c
--	LEFT JOIN economy e ON e.country_id = c.id
--	LEFT JOIN Nuclear_Power_Production_by_Country ppc ON ppc.ID_country = c.id
-- WHERE
--	e.GDP_per_capita > 10000 
--	AND c.isLandlocked = 1
--	AND ppc.Number_of_Operating_Reactors > 3
-- GROUP BY
--	c.region;
	
