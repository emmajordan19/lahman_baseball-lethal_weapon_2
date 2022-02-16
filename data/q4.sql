/*

Q1

SELECT MIN(year), MAX(year)
FROM homegames


----

4. Using the fielding table, group players into three groups based on their position: 
label players with position OF as "Outfield", those with position
 "SS", "1B", "2B", and "3B" as "Infield", and those with position "P" or "C" as "Battery". 
Determine the number of putouts made by each of these three groups in 2016 */

SELECT *,
CASE WHEN pos = 'OF' THEN 'outfield'
	WHEN pos IN('SS','1B','2B', '3B') THEN 'infield' 
	WHEN pos IN('P', 'C') THEN 'battery'
END AS position
FROM fielding
WHERE yearid = 2016 