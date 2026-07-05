/*
====================================================
03. DATA ANALYSIS
Objective:
Perform business-focused SQL analysis to generate
meaningful insights from IPL match and ball-by-ball data.
=========================================================
*/


-- 1. Top 10 Run Scorers
SELECT batsman,
       SUM(batsman_runs) AS total_runs
FROM deliveries
GROUP BY batsman
ORDER BY total_runs DESC
LIMIT 10;

-- 2. Top 10 Wicket Takers                           
SELECT bowler,
       COUNT(*) AS total_wickets
FROM deliveries
WHERE is_wicket = 1 
AND dismissal_kind NOT IN ('run out','retired hurt','obstructing the field')
GROUP BY bowler
ORDER BY total_wickets DESC
LIMIT 10;


-- 3. Players with Most Player of the Match Awards
SELECT player_of_match,
       COUNT(*) AS awards
FROM matches
WHERE player_of_match IS NOT NULL
GROUP BY player_of_match
ORDER BY awards DESC
LIMIT 10;

-- 4. Top 10 Players by Dot Balls Faced
SELECT batsman,
       COUNT(*) AS dot_balls
FROM deliveries
WHERE total_runs = 0
GROUP BY batsman
ORDER BY dot_balls DESC
LIMIT 10;

-- 5. Teams Winning Most Tosses
SELECT toss_winner,
       COUNT(*) AS toss_wins
FROM matches
GROUP BY toss_winner
ORDER BY toss_wins DESC;

-- 6. Highest Successful Run Chase
SELECT winner,
       target_runs,
       result_margin
FROM matches
WHERE result = 'wickets'
ORDER BY target_runs DESC
LIMIT 10;

-- 7. Top 10 Venues Hosting Most Matches
SELECT venue,
       COUNT(*) AS matches_hosted
FROM matches
GROUP BY venue
ORDER BY matches_hosted DESC
LIMIT 10;

-- 8. Powerplay Runs by Team
SELECT batting_team,
       SUM(total_runs) AS powerplay_runs
FROM deliveries
WHERE over_number <= 6
GROUP BY batting_team
ORDER BY powerplay_runs DESC;

-- 9. Death Over Runs by Team
SELECT batting_team,
       SUM(total_runs) AS death_over_runs
FROM deliveries
WHERE over_number >= 16
GROUP BY batting_team
ORDER BY death_over_runs DESC;

-- 10. Runs Scored in Each Season
SELECT season,
       SUM(total_runs) AS season_runs
FROM deliveries d
JOIN matches m
ON d.match_id = m.match_id
GROUP BY season
ORDER BY season;


 -- 11. Average Team Score (Subquery)
SELECT
    batting_team,
    ROUND(AVG(team_score),2) AS average_score
FROM
(
    SELECT
        match_id,
        batting_team,
        SUM(total_runs) AS team_score
    FROM deliveries
    GROUP BY match_id, batting_team
) AS scores
GROUP BY batting_team
ORDER BY average_score DESC;


 -- 12. Powerplay vs Middle vs Death Overs
SELECT
CASE
    WHEN over_number <= 6 THEN 'Powerplay'
    WHEN over_number BETWEEN 7 AND 15 THEN 'Middle Overs'
    ELSE 'Death Overs'
END AS phase,
SUM(total_runs) AS total_runs
FROM deliveries
GROUP BY phase;

