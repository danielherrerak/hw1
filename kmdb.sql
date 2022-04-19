-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy.
-- - Movie data includes the movie title, year released, MPAA rating,
--   and studio.
-- - There are many studios, and each studio produces many movies, but
--   a movie belongs to a single studio.
-- - An actor can be in multiple movies.
-- - Everything you need to do in this assignment is marked with TODO!

-- User stories
--
-- - As a guest, I want to see a list of movies with the title, year released,
--   MPAA rating, and studio information.
-- - As a guest, I want to see the movies which a single studio has produced.
-- - As a guest, I want to see each movie's cast including each actor's
--   name and the name of the character they portray.
-- - As a guest, I want to see the movies which a single actor has acted in.
-- * Note: The "guest" user role represents the experience prior to logging-in
--   to an app and typically does not have a corresponding database table.


-- Deliverables
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
-- - Insertion of "Batman" sample data into tables.
-- - Selection of data, so that something similar to the sample "report"
--   below can be achieved.

-- Rubric
--
-- 1. Domain model - 6 points
-- - Think about how the domain model needs to reflect the
--   "real world" entities and the relationships with each other. 
--   Hint: It's not just a single table that contains everything in the 
--   expected output. There are multiple real world entities and
--   relationships including at least one many-to-many relationship.
-- 2. Execution of the domain model (CREATE TABLE) - 4 points
-- - Follow best practices for table and column names
-- - Use correct data column types (i.e. TEXT/INTEGER)
-- - Use of the `model_id` naming convention for foreign key columns
-- 3. Insertion of data (INSERT statements) - 4 points
-- - Insert data into all the tables you've created
-- - It actually works, i.e. proper INSERT syntax
-- 4. "The report" (SELECT statements) - 6 points
-- - Write 2 `SELECT` statements to produce something similar to the
--   sample output below - 1 for movies and 1 for cast. You will need
--   to read data from multiple tables in each `SELECT` statement.
--   Formatting does not matter.

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Warner Bros.
-- The Dark Knight        2008           PG-13  Warner Bros.
-- The Dark Knight Rises  2012           PG-13  Warner Bros.

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off

-- Drop existing tables, so you'll start fresh each time this script is run.
-- TODO!
-- run of this script
DROP TABLE IF EXISTS studios;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS cast;

-- Create new tables, according to your domain model
-- TODO!
CREATE TABLE studios (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
);

CREATE TABLE movies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  studio_id INTEGER,
  title TEXT,
  year_released TEXT,
  MPAA_rating TEXT,
);

CREATE TABLE actors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT  
);

CREATE TABLE cast (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    movie_id INTEGER,
    actor_id INTEGER,
    character_name TEXT
);

-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
-- TODO!

UPDATE studios
SET name = "Warner Bros."
WHERE  id= 1;





UPDATE movies
SET studio_id = 1
SET title = "Batman Begins"
SET year_released = "2005"
SET MPAA_rating = "PG-13"
WHERE  id= 1;

UPDATE movies
SET studio_id = 1
SET title = "The Dark Knight"
SET year_released = "2008"
SET MPAA_rating = "PG-13"
WHERE  id= 2;

UPDATE movies
SET studio_id = 1
SET title = "The Dark Knight Rises"
SET year_released = "2012"
SET MPAA_rating = "PG-13"
WHERE  id= 3;





UPDATE actors
SET name = "Christian Bale"
WHERE  id= 1;

UPDATE actors
SET name = "Michael Caine"
WHERE  id= 2;

UPDATE actors
SET name = "Liam Neeson"
WHERE  id= 3;

UPDATE actors
SET name = "Katie Holmes"
WHERE  id= 4;

UPDATE actors
SET name = "Gary Oldman"
WHERE  id= 5;

UPDATE actors
SET name = "Heath Ledger"
WHERE  id= 6;

UPDATE actors
SET name = "Aarton Eckhart"
WHERE  id= 7;

UPDATE actors
SET name = "Maggie Gyllenhaal"
WHERE  id= 8;

UPDATE actors
SET name = "Tom Hardy"
WHERE  id= 9;

UPDATE actors
SET name = "Joseph Gordon-Levitt"
WHERE  id= 10;

UPDATE actors
SET name = "Anne Hathaway"
WHERE  id= 11;


-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle


UPDATE cast
SET movie_id = 1
SET actor_id= 1
SET character_name = "Bruce Wayne"
WHERE  id= 1;

UPDATE cast
SET movie_id = 1
SET actor_id= 2
SET character_name = "Alfred"
WHERE  id= 2;

UPDATE cast
SET movie_id = 1
SET actor_id= 3
SET character_name = "Ra's Al Ghul"
WHERE  id= 3;

UPDATE cast
SET movie_id = 1
SET actor_id= 4
SET character_name = "Rachel Dawes"
WHERE  id= 4;

UPDATE cast
SET movie_id = 1
SET actor_id= 5
SET character_name = "Commissioner Gordon"
WHERE  id= 5;

UPDATE cast
SET movie_id = 2
SET actor_id= 1
SET character_name = "Bruce Wayne"
WHERE  id= 6;

UPDATE cast
SET movie_id = 2
SET actor_id= 6
SET character_name = "Joker"
WHERE  id= 7;

UPDATE cast
SET movie_id = 2
SET actor_id= 7
SET character_name = "Harvey Dent"
WHERE  id= 8;

UPDATE cast
SET movie_id = 2
SET actor_id= 2
SET character_name = "Alfred"
WHERE  id= 9;

UPDATE cast
SET movie_id = 2
SET actor_id= 8
SET character_name = "Rachel Dawes"
WHERE  id= 10;

UPDATE cast
SET movie_id = 3
SET actor_id= 1
SET character_name = "Bruce Wayne"
WHERE  id= 11;

UPDATE cast
SET movie_id = 3
SET actor_id= 5
SET character_name = "Commissioner Gordon"
WHERE  id= 12;

UPDATE cast
SET movie_id = 3
SET actor_id= 9
SET character_name = "Bane"
WHERE  id= 13;

UPDATE cast
SET movie_id = 3
SET actor_id= 10
SET character_name = "John Blake"
WHERE  id= 14;

UPDATE cast
SET movie_id = 3
SET actor_id= 11
SET character_name = "Selina Kyle"
WHERE  id= 15;

-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
-- TODO!

-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""


-- The SQL statement for the cast output
-- TODO!
