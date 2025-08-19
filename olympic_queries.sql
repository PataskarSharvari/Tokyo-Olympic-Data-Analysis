--You can run these queries in Azure Synapse and get the insights and visualize them using charts, as I have done it and shown them in the screenshots/pictures attached in my GitHub repository.

-- Count the number of athletes from each country
SELECT Country, COUNT(*) AS TotalAthletes
FROM Athletes
GROUP BY Country
ORDER BY TotalAthletes DESC;

-- Calculate total medals won by each country
SELECT TeamCountry, 
       SUM(Gold)   AS TotalGold, 
       SUM(Silver) AS TotalSilver, 
       SUM(Bronze) AS TotalBronze
FROM Medals
GROUP BY TeamCountry
ORDER BY TotalGold DESC;

-- Calculate the average number of entries by gender for each discipline
SELECT Discipline, 
       AVG(Female) AS Avg_Female, 
       AVG(Male)   AS Avg_Male
FROM EntriesGender
GROUP BY Discipline
ORDER BY Discipline;

--Find top 10 countries by Gold medals
SELECT 
    TeamCountry, 
    SUM(Gold) AS TotalGold
FROM Medals
GROUP BY TeamCountry
ORDER BY TotalGold DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

--Coaches distribution by discipline
SELECT 
    Discipline, 
    COUNT(Name) AS TotalCoaches
FROM Coaches
GROUP BY Discipline
ORDER BY TotalCoaches DESC;

--List all teams that participated in Basketball events
SELECT 
    TeamName, 
    Country, 
    Event
FROM Teams
WHERE Discipline = 'Basketball';

--Discipline with maximum female athletes (from EntriesGender)
SELECT TOP 1
    Discipline, 
    Female
FROM EntriesGender
ORDER BY Female DESC;

--Countries with the highest overall participation (Athletes + Teams + Coaches)
SELECT 
    A.Country, 
    COUNT(DISTINCT A.PersonName) AS TotalAthletes,
    COUNT(DISTINCT T.TeamName) AS TotalTeams,
    COUNT(DISTINCT C.Name) AS TotalCoaches,
    (COUNT(DISTINCT A.PersonName) + COUNT(DISTINCT T.TeamName) + COUNT(DISTINCT C.Name)) AS OverallParticipation
FROM Athletes A
LEFT JOIN Teams T ON A.Country = T.Country
LEFT JOIN Coaches C ON A.Country = C.Country
GROUP BY A.Country
ORDER BY OverallParticipation DESC;





