SELECT region, SUM(population) AS regions_population
FROM cities
GROUP BY region;
SELECT region, SUM(population) AS regions_population
FROM cities
GROUP BY region
HAVING COUNT(*) >=10;
SELECT name, population
FROM cities
WHERE region IN(SELECT uuid
                FROM regions
                WHERE area_quantity >= 5)
ORDER BY population DESC
LIMIT 5 OFFSET 10;
SELECT r.name, SUM(c.population) AS sum_people
FROM regions r, cities c
WHERE (c.population>300000) AND (c.region=r.uuid)
GROUP BY r.name;
SELECT name, population, region
FROM cities
WHERE (population<150000 || population> 500000) AND (region IN (SELECT uuid 
                  FROM regions
                  WHERE area_quantity<=5));