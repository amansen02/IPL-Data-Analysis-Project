/*
====================================================
02. EXPLORATORY DATA ANALYSIS (EDA)
====================================================
*/

-- ====================================================
-- Dataset Overview
-- ====================================================

-- Total Matches
SELECT COUNT(*) AS total_matches
FROM matches;

-- Total Deliveries
SELECT COUNT(*) AS total_deliveries
FROM deliveries;

-- Total Seasons
SELECT COUNT(DISTINCT season) AS total_seasons
FROM matches;

-- Total Teams
SELECT COUNT(DISTINCT winner) AS total_teams
FROM matches;

-- ====================================================
-- Season Analysis
-- ====================================================

-- Matches Played Per Season
SELECT season,
       COUNT(*) AS matches_played
FROM matches
GROUP BY season
ORDER BY season;

-- ====================================================
-- Venue Analysis
-- ====================================================

-- Top Venues by Matches Hosted
SELECT venue,
       COUNT(*) AS matches_hosted
FROM matches
GROUP BY venue
ORDER BY matches_hosted DESC;

-- Matches by City
SELECT city,
       COUNT(*) AS matches_played
FROM matches
GROUP BY city
ORDER BY matches_played DESC;

-- ====================================================
-- Team Analysis
-- ====================================================

-- Matches Won by Team
SELECT winner,
       COUNT(*) AS matches_won
FROM matches
WHERE winner IS NOT NULL
GROUP BY winner
ORDER BY matches_won DESC;

-- Toss Decision Distribution
SELECT toss_decision,
       COUNT(*) AS total_matches
FROM matches
GROUP BY toss_decision;

-- ====================================================
-- Batting Analysis
-- ====================================================

-- Total Runs Scored
SELECT SUM(total_runs) AS total_runs
FROM deliveries;

-- Total Fours
SELECT COUNT(*) AS total_fours
FROM deliveries
WHERE batsman_runs = 4;

-- Total Sixes
SELECT COUNT(*) AS total_sixes
FROM deliveries
WHERE batsman_runs = 6;

-- ====================================================
-- Bowling Analysis
-- ====================================================

-- Total Wickets
SELECT SUM(is_wicket) AS total_wickets
FROM deliveries;

-- ====================================================
-- Awards Analysis
-- ====================================================

-- Player of the Match Awards
SELECT player_of_match,
       COUNT(*) AS awards
FROM matches
WHERE player_of_match IS NOT NULL
GROUP BY player_of_match
ORDER BY awards DESC;