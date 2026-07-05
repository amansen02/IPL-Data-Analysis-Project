/*
====================================================
01. DATA CLEANING
====================================================
*/

-- Step 1: Inspect Dataset
DESCRIBE matches;
DESCRIBE deliveries;

-- Step 2: Rename Columns
ALTER TABLE deliveries
CHANGE COLUMN batter batsman VARCHAR(100);

ALTER TABLE deliveries
CHANGE COLUMN `over` over_number INT;

-- Step 3: Check Missing Values
SELECT * FROM matches
WHERE city = 'NA';

-- Step 4: Handle Missing Values
UPDATE matches
SET player_of_match = NULL
WHERE player_of_match = 'NA';

-- Step 5: Standardize Team Names
UPDATE matches
SET winner = 'Delhi Capitals'
WHERE winner = 'Delhi Daredevils';

-- Step 6: Standardize Venue Names
-- (Tumhari venue update queries)

-- Step 7: Standardize Season Values
UPDATE matches
SET season = '2010'
WHERE season = '2009/10';

-- Step 8: Convert Data Types
ALTER TABLE matches
MODIFY result_margin INT;

-- Step 9: Validate Dataset
SELECT COUNT(*) FROM matches;
SELECT COUNT(*) FROM deliveries;