-- 5. Find the average number of strikeouts per game by decade since 1920. Round the numbers you report to 2 decimal places. 
-- Do the same for home runs per game. Do you see any trends?

SELECT SUM(pitching.so::float) / SUM(appearances.gs) AS avg_so,
       CASE
	     WHEN appearances.yearid BETWEEN 1920 AND 1929 THEN '1920s'
		 WHEN appearances.yearid BETWEEN 1930 AND 1939 THEN '1930s'
		 WHEN appearances.yearid BETWEEN 1940 AND 1949 THEN '1940s'
		 WHEN appearances.yearid BETWEEN 1950 AND 1959 THEN '1950s'
		 WHEN appearances.yearid BETWEEN 1960 AND 1969 THEN '1960s'
		 WHEN appearances.yearid BETWEEN 1970 AND 1979 THEN '1970s'
		 WHEN appearances.yearid BETWEEN 1980 AND 1989 THEN '1980s'
		 WHEN appearances.yearid BETWEEN 1990 AND 1999 THEN '1990s'
		 WHEN appearances.yearid BETWEEN 2000 AND 2009 THEN '2000s'
		 ELSE '2010s' END AS decade
FROM appearances 
	 INNER JOIN people
	 ON people.playerid = appearances.playerid
	 INNER JOIN pitching
	 ON pitching.playerid = people.playerid
GROUP BY decade;
	 

