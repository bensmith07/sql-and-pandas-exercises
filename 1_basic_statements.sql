-- Create a new file called select_exercises.sql. 
-- Store your code for this exercise in that file. You should be testing your code in MySQL Workbench as you go.

-- Use the albums_db database.

USE albums_db;
SHOW TABLES;

-- Explore the structure of the albums table.

DESCRIBE albums;

SELECT * 
  FROM albums
  LIMIT 10;

-- a. How many rows are in the albums table?

SELECT COUNT(*)
  FROM albums;

-- b. How many unique artist names are in the albums table?

SELECT COUNT(DISTINCT(artist))
  FROM albums;

-- d. What is the oldest release date for any album 
-- in the albums table? 

SELECT MIN(release_date)
  FROM albums;

-- What is the most recent release date?

SELECT MAX(release_date)
  FROM albums;

-- Write queries to find the following information:

-- a. The name of all albums by Pink Floyd

SELECT name 
  FROM albums
  WHERE artist = 'Pink Floyd';

-- b. The year Sgt. Pepper's Lonely Hearts Club Band was released

SELECT release_date
  FROM albums
  WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";

-- c. The genre for the album Nevermind

SELECT genre
  FROM albums
  WHERE name = 'Nevermind';

-- d. Which albums were released in the 1990s

SELECT name, artist, release_date
  FROM albums
  WHERE release_date LIKE '199%';

-- e. Which albums had less than 20 million certified 
--    sales

SELECT name, artist, sales
  FROM albums
  WHERE sales < 20;

-- f. All the albums with a genre of "Rock". Why do 
-- these query results not include albums with a 
-- genre of "Hard rock" or "Progressive rock"?

USE albums_db;
-- Be sure to add, commit, and push your work.
