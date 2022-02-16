-- 2. Find the name and height of the shortest player in the database. 
-- ANSWER: Edward Carl, 43 inches
SELECT namegiven,
	   height
FROM people
WHERE height IN
	  (SELECT MIN(height)
      FROM people);
	  
-- How many games did he play in? 
-- ANSWER: 1
SELECT g_all, namegiven
FROM people INNER JOIN appearances
	 ON people.playerid = appearances.playerid
WHERE height IN
	  (SELECT MIN(height)
      FROM people);
					 
-- What is the name of the team for which he played?
-- ANSWER: St. Louis Browns
SELECT DISTINCT teams.name, people.namegiven
FROM people 
	 INNER JOIN appearances
	 ON people.playerid = appearances.playerid
	 INNER JOIN teams
	 ON teams.teamid = appearances.teamid
WHERE height IN
	  (SELECT MIN(height)
      FROM people)
GROUP BY teams.name, people.namegiven;




