/*Q7 From 1970 – 2016, what is the largest number of wins for a team that did not win the world series? 7A
What is the smallest number of wins for a team that did win the world series? 7B
Doing this will probably result in an unusually small number of wins for a world series champion – determine why this is the case. 
Then redo your query, excluding the problem year. 7C
How often from 1970 – 2016 was it the case that a team with the most wins also won the world series? 7D
What percentage of the time? 7E */

--From 1970 – 2016, what is the largest number of wins for a team that did not win the world series? 7A

SELECT teamid, yearid, w, wswin
FROM teams
WHERE yearid >= 1970
AND wswin = 'N'
ORDER BY w DESC;
--7A: SEA 201 116 wins and no world series win


/*What is the smallest number of wins for a team that did win the world series? 7B
Doing this will result in an unusually small number of wins for a world series champion–determine why this is the case.
Then redo your query, excluding the problem year.7C*/

SELECT teamid, yearid, w, wswin
FROM teams
WHERE yearid >= 1970
AND wswin = 'Y'
ORDER BY w ASC;
--7B: LAN 1981 63 wins and world series win
/*1981 there was a strike from june 12- july-31 over free agent compensation resulting in the season being cut in half 
and several teams missing out on playoff berths 
(https://www.usatoday.com/story/sports/mlb/2020/03/15/1981-mlb-season-coronavirus-delay-baseball/5054780002/)*/

SELECT teamid, yearid, w, wswin
FROM teams 
WHERE yearid <> 1981
AND yearid >= 1970
AND wswin = 'Y'
ORDER BY w;
--7C: SLN 2006 83 wins and a world series win


--How often from 1970 – 2016 was it the case that a team with the most wins also won the world series? 7D

WITH max_wins AS (SELECT MAX (w) AS max_w, yearid
		FROM teams
		WHERE yearid >= 1970
		GROUP BY teams.yearid
		ORDER BY yearid DESC)
SELECT max_w, teams.yearid, wswin, name
FROM max_wins
INNER JOIN teams ON teams.yearid = max_wins.yearid AND max_wins.max_w = teams.w
WHERE teams.yearid >= 1970
ORDER BY teams.yearid DESC;
/* 7D: year 1994 has no world series winner due to another strike over a salery cap 
the last pat of the regualr season and the post season was cancelled*/


--What Percent of the time? 7E

WITH win_percentage AS (SELECT yearid, name, wswin, 
	(CASE WHEN w = MAX(w) OVER(PARTITION BY yearid) AND wswin = 'Y' THEN 1 ELSE 0 END) AS max_wins
			FROM teams
			WHERE yearid >= 1970 AND yearid <> 1981)
SELECT Round(SUM(max_wins)::decimal / COUNT(wswin) * 100, 1) AS max_win_perc
FROM win_percentage
WHERE wswin = 'Y';
--7E: 26.7%