/*Q6 Find the player who had the most success stealing bases in 2016, 
where success is measured as the percentage of stolen base attempts which are successful. 
(A stolen base attempt results either in a stolen base or being caught stealing.)
Consider only players who attempted at least 20 stolen bases.*/

/*stolen bases + caught stealing = stolen base attempt*/

SELECT namefirst, namelast, (sb::numeric / (sb::numeric + cs::numeric)) AS successful_stolen_base_percentage
FROM batting
LEFT JOIN people
USING(playerid)
WHERE yearid = 2016 AND (sb + cs) > 20
ORDER BY successful_stolen_base_percentage desc
LIMIT 5;

SELECT namefirst, namelast, (sb::numeric / (sb::numeric + cs::numeric)) AS successful_stolen_base_percentage
FROM batting
LEFT JOIN people
USING(playerid)
WHERE yearid = 2016 AND (sb + cs) > 20
ORDER BY successful_stolen_base_percentage desc
LIMIT 1;

/*Chris tried stealng 23 times and was successful 21 times as per website
https://www.baseball-reference.com/players/o/owingch01.shtml*/