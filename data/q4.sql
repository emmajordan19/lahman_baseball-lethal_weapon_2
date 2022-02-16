
/*
4. Using the fielding table, group players into three groups based on their position: 
label players with position OF as "Outfield", those with position
 "SS", "1B", "2B", and "3B" as "Infield", and those with position "P" or "C" as "Battery". 
Determine the number of putouts made by each of these three groups in 2016 */



WITH group_fielding as (SELECT DISTINCT pos, SUM(PO) AS total_po, fielding.yearid,
		CASE WHEN pos = 'OF' then 'Outfield'
			WHEN pos = 'SS' THEN 'Infield'
			WHEN pos = '1B' THEN 'Infield'
			WHEN pos = '2B' THEN 'Infield'
			WHEN pos = '3B' THEN 'Infield'
			WHEN pos = 'P' THEN 'Battery'
			WHEN pos = 'C' THEN 'Battery' END AS fielding_grouped
	FROM fielding 
	WHERE yearid = (2016)
	GROUP BY fielding_grouped, fielding.pos, fielding.yearid
	ORDER BY yearid)
SELECT SUM(total_po), fielding_grouped
FROM group_fielding
GROUP BY fielding_grouped