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
-- - Note rubric explanation for appropriate use of external resources.

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
--   Hint #1: It's not just a single table that contains everything in the 
--   expected output. There are multiple real world entities and
--   relationships including at least one many-to-many relationship.
--   Hint #2: Do NOT name one of your models/tables “cast” or “casts”; this 
--   is a reserved word in sqlite and will break your database! Instead, 
--   think of a better word to describe this concept; i.e. the relationship 
--   between an actor and the movie in which they play a part.
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
-- 5. Using external resources for help with the assignment (including colleagues, AI, internet search, etc):
-- - Engineers look to colleagues and the internet all the time when building software.
--   You are welcome to do the same. However, the solution you submit must utilize
--   the skills and strategies covered in class. Alternate solutions which do not demonstrate
--   an understanding of the approaches used in class will receive significant deductions.
--   Any concern should be raised with faculty prior to assignment due date.

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

-- Create new tables, according to your domain model
-- TODO!

-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
-- TODO!

-- Prints a header for the movies output


-- The SQL statement for the movies output
-- TODO!

-- Prints a header for the cast output



-- The SQL statement for the cast output
-- TODO!

DROP TABLE IF EXISTS movie_cast;
DROP TABLE IF EXISTS actor;
DROP TABLE IF EXISTS movie;
DROP TABLE IF EXISTS studio;

CREATE TABLE studio (
    studio_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL ) ; 

CREATE TABLE movie (
    movie_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    year_released INTEGER NOT NULL,
    mpaa_rating TEXT NOT NULL,
    studio_id INTEGER NOT NULL,
    FOREIGN KEY (studio_id) REFERENCES studio(studio_id)
);

CREATE TABLE actor (
    actor_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE movie_cast (
    movie_cast_id INTEGER PRIMARY KEY,
    movie_id INTEGER NOT NULL,
    actor_id INTEGER NOT NULL,
    character_name TEXT NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
    FOREIGN KEY (actor_id) REFERENCES actor(actor_id)
);

INSERT INTO studio (studio_id, name) VALUES
(1, 'Warner Bros.');

INSERT INTO movie (movie_id, title, year_released, mpaa_rating, studio_id) VALUES
(1, 'Batman Begins', 2005, 'PG-13', 1),
(2, 'The Dark Knight', 2008, 'PG-13', 1),
(3, 'The Dark Knight Rises', 2012, 'PG-13', 1);

INSERT INTO actor (actor_id, name) VALUES
(1, 'Christian Bale'),
(2, 'Michael Caine'),
(3, 'Liam Neeson'),
(4, 'Katie Holmes'),
(5, 'Gary Oldman'),
(6, 'Heath Ledger'),
(7, 'Aaron Eckhart'),
(8, 'Maggie Gyllenhaal'),
(9, 'Tom Hardy'),
(10, 'Joseph Gordon-Levitt'),
(11, 'Anne Hathaway');

INSERT INTO movie_cast (movie_cast_id, movie_id, actor_id, character_name) VALUES
(1, 1, 1, 'Bruce Wayne'),
(2, 1, 2, 'Alfred'),
(3, 1, 3, 'Ra''s Al Ghul'),
(4, 1, 4, 'Rachel Dawes'),
(5, 1, 5, 'Commissioner Gordon'),
(6, 2, 1, 'Bruce Wayne'),
(7, 2, 6, 'Joker'),
(8, 2, 7, 'Harvey Dent'),
(9, 2, 2, 'Alfred'),
(10, 2, 8, 'Rachel Dawes'),
(11, 3, 1, 'Bruce Wayne'),
(12, 3, 5, 'Commissioner Gordon'),
(13, 3, 9, 'Bane'),
(14, 3, 10, 'John Blake'),
(15, 3, 11, 'Selina Kyle');

.print "Movies"
.print "======"
.print ""

SELECT m.title, m.year_released, m.mpaa_rating, s.name AS studio_name
FROM movie m
JOIN studio s ON m.studio_id = s.studio_id;


.print ""
.print "Movies by Warner Bros."
.print "======================"
.print ""

SELECT m.title, m.year_released, m.mpaa_rating
FROM movie m
JOIN studio s ON m.studio_id = s.studio_id
WHERE s.name = 'Warner Bros.';


.print ""
.print "Top Cast"
.print "========"
.print ""

SELECT m.title, a.name AS actor_name, mc.character_name
FROM movie_cast mc
JOIN movie m ON mc.movie_id = m.movie_id
JOIN actor a ON mc.actor_id = a.actor_id
ORDER BY m.title, mc.movie_cast_id;


.print ""
.print "Movies Featuring Christian Bale"
.print "==============================="
.print ""

SELECT a.name AS actor_name, m.title AS movie_title, mc.character_name
FROM movie_cast mc
JOIN movie m ON mc.movie_id = m.movie_id
JOIN actor a ON mc.actor_id = a.actor_id
WHERE a.name = 'Christian Bale';


