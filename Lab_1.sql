SELECT name, population
From cities
ORDER BY population DESC
LIMIT 10 OFFSET 10;
SELECT name
From cities
ORDER BY name DESC
LIMIT 30;
SELECT name, population, region
From cities
ORDER BY region, population DESC;
SELECT DISTINCT region
From cities
ORDER BY region;
SELECT name, region
From cities
ORDER BY region DESC, name DESC;