/*Which managers have won the TSN Manager of the Year award in both the National League (NL) and the American League (AL)? 
Give their full name and the teams that they were managing when they won the award.*/

SELECT namefirst,namelast, am.yearid,
CASE WHEN am.lgid = 'NL' THEN 'national league' END AS NL,
CASE WHEN am.lgid = 'AL' THEN 'american league' END AS AL
FROM awardsmanagers AS am JOIN people AS ppl ON am.playerid = ppl.playerid
WHERE awardid ILIKE '%TSN%' AND am.lgid ILIKE 'NL'
ORDER BY namelast


SELECT namefirst,namelast, am.yearid,
CASE WHEN am.lgid = 'NL' THEN 'national league' END AS NL,
CASE WHEN am.lgid = 'AL' THEN 'american league' END AS AL
FROM awardsmanagers AS am JOIN people AS ppl ON am.playerid = ppl.playerid
WHERE awardid ILIKE '%TSN%' AND am.lgid ILIKE 'AL'
ORDER BY namelast


SELECT namefirst,namelast, am.yearid,
CASE WHEN am.lgid = 'NL' THEN 'national league' END AS NL,
CASE WHEN am.lgid = 'AL' THEN 'american league' END AS AL
FROM awardsmanagers AS am JOIN people AS ppl ON am.playerid = ppl.playerid
WHERE awardid ILIKE '%TSN%' AND am.lgid ILIKE 'NL' AND am.lgid ILIKE 'AL'
ORDER BY namelast