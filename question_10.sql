/* 10. Find all players who hit their career highest number of home runs in 2016. 
Consider only players who have played in the league for at least 10 years, and who hit at least one home run in 2016. 
Report the players' first and last names and the number of home runs they hit in 2016. */

SELECT DISTINCT people.playerid,
       people.namefirst,
	   people.namelast,
       MAX(batting.hr) OVER(PARTITION BY batting.playerid, batting.yearid = 2016) AS max_hr,
	   batting.yearid
FROM people
	 INNER JOIN batting
	 ON batting.playerid = people.playerid
WHERE batting.yearid = 2016
ORDER BY max_hr DESC;