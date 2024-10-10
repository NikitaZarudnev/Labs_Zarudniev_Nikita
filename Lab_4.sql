SELECT name, UPPER(name) AS name_upcase
FROM cities
ORDER BY name
LIMIT 5 OFFSET 5;
Select name, CHAR_LENGTH(name) AS name_length
From cities
WHERE CHAR_LENGTH(name) !=8 AND CHAR_LENGTH(name) !=9 AND CHAR_LENGTH(name) !=10;
SELECT SUM(population) AS sum_population
FROM cities
WHERE region IN ("S", "C");
SELECT AVG(population) AS avg_population
FROM cities
WHERE region IN ("W");
SELECT COUNT(name) AS number_of_cities
FROM cities
WHERE region IN ("E");
