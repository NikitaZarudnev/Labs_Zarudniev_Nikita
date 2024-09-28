SELECT name, population
FROM cities
WHERE population >= 1000000;
SELECT name, population, region
FROM cities
WHERE region IN ("E", "W")
ORDER BY population DESC;
SELECT name, population, region
FROM cities
WHERE region IN ("S", "C", "N") AND population >=500000; //Примітка: я встановив населення більше 500 тисяч, бо якщо встановити 50 тисяч результат однаков, що с командою після AND, що без неї, бо немає жодного міста з населенням меньше 50 тисяч
SELECT name, population, region
FROM cities
WHERE region IN ("E", "W", "N") AND population >=150000 AND population <=350000
ORDER BY name
Limit 20;
SELECT name, population, region
FROM cities
WHERE NOT region IN ("E", "W") 
ORDER BY population DESC
Limit 10 OFFSET 10;