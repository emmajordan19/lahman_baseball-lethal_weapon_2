/* 10. Find all players who hit their career highest number of home runs in 2016. 
Consider only players who have played in the league for at least 10 years, and who hit at least one home run in 2016. 
Report the players' first and last names and the number of home runs they hit in 2016. */


SELECT DISTINCT playerid,
	   yearid,
       SUM(hr) OVER(PARTITION BY playerid, yearid) AS max_hr
FROM batting
GROUP BY playerid, yearid, hr
ORDER BY max_hr DESC;

----

WITH query1 AS (SELECT playerid,
	        	  		 yearid,
             	  		 SUM(hr) OVER(PARTITION BY playerid, yearid) AS max_hr
				  FROM batting
	 			  GROUP BY playerid, yearid, hr
	 			  ORDER BY max_hr DESC)
SELECT DISTINCT playerid,
	   MAX(max_hr),
	   yearid				  
FROM query1				  
GROUP BY playerid, yearid
ORDER BY MAX(max_hr) DESC;






