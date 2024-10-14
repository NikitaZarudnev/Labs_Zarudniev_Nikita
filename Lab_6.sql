SELECT c.name AS city_name, r.name AS region_name
FROM regions r, cities c
WHERE c.region = r.uuid AND c.population > 350000;
SELECT c.name AS city_name, r.name AS region_name
FROM regions r, cities c
WHERE c.region = r.uuid AND r.name = "Nord";