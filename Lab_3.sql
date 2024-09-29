Select name
From cities
Where name Like "%ськ";
Select name
From cities
Where name Like "%донец%";
Select Concat(name, " (",region,")")
From cities
Where population > 100000
Order By name;
Select name, population, population*100/40000000 AS Percentage_of_Ukraine_population
From cities
Where population > 100000
Order By population Desc
Limit 10;
Select Concat(name, "-", population*100/40000000, "%")
From cities
Where (population*100/40000000) >= 0.1
Order By population*100/40000000 Desc;