Assessing the data in each table:

SELECT *
FROM stream
LIMIT 20;

SELECT *
FROM chat
LIMIT 20;


-- Selecting unique game and channel names:

SELECT DISTINCT game
FROM stream;

SELECT DISTINCT channel
FROM stream;



-- Most popular games:

SELECT game, COUNT(*)
FROM stream
GROUP BY game
ORDER BY COUNT(*) DESC;



-- 'League of Legends' viewers and their respective countries:

SELECT country, COUNT(*)
FROM stream
WHERE game = 'League of Legends'
GROUP BY game
ORDER BY COUNT(*) DESC;



-- List of players and their number of streamers:

SELECT player, COUNT(*)
FROM stream
GROUP BY game
ORDER BY COUNT(*) DESC;




-- Created a new column 'genre' and grouped each disinctive game accordingly:

SELECT game,
 CASE
  WHEN game = 'Dota 2'
      THEN 'MOBA'
  WHEN game = 'League of Legends' 
      THEN 'MOBA'
  WHEN game = 'Heroes of the Storm'
      THEN 'MOBA'
    WHEN game = 'Counter-Strike: Global Offensive'
      THEN 'FPS'
    WHEN game = 'DayZ'
      THEN 'Survival'
    WHEN game = 'ARK: Survival Evolved'
      THEN 'Survival'
  ELSE 'Other'
  END AS 'genre',
  COUNT(*)
FROM stream
GROUP BY 1
ORDER BY 3 DESC;



-- Query to see how view count changes over the course of a day in the UK:

SELECT strftime('%H', time),
   COUNT(*)
FROM stream
WHERE country = 'UK'
GROUP BY 1;



-- Joining the two tables
SELECT *
FROM stream
JOIN chat
  ON stream.device_id = chat.device_id;