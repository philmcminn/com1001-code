-- Create a table: ("--" denotes the start of a comment in SQL)
CREATE TABLE players (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    surname TEXT,
    gender TEXT,
    date_of_birth TEXT,
    country TEXT,
    position TEXT,
    club TEXT
);

-- Insert records of data into the database:

INSERT INTO players VALUES(1, "Dominic", "Calvert-Lewin", "M", "1997-03-16", "England", "Forward", "Everton");
INSERT INTO players VALUES(2, "Sam", "Kerr", "F", "1993-09-10", "Australia", "Forward", "Chelsea");
INSERT INTO players VALUES(3, "Harry", "Kane", "M", "1993-07-28", "England", "Forward", "Tottenham Hotspur");
INSERT INTO players VALUES(4, "Rose", "Lavelle", "F", "1995-05-14", "USA", "Midfielder", "Manchester City");
INSERT INTO players VALUES(5, "Son", "Heung-min", "M", "1992-07-08", "South Korea", "Forward", "Tottenham Hotspur");
INSERT INTO players VALUES(6, "Pernille", "Harder", "F", "1992-11-15", "Denmark", "Forward", "Chelsea");
INSERT INTO players VALUES(7, "Bruno", "Fernandes", "M", "1994-09-08", "Portugal", "Midfielder", "Manchester United");
INSERT INTO players VALUES(8, "Hayley", "Raso", "F", "1994-09-05", "Australia",  "Midfielder", "Everton");
INSERT INTO players VALUES(9, "Kevin", "De Bruyne", "M", "1991-06-28", "Belgium", "Midfielder", "Manchester City");
INSERT INTO players VALUES(10, "Vivianne", "Miedema", "F", "1996-07-15", "Netherlands", "Forward", "Arsenal");
INSERT INTO players VALUES(11, "Michael", "Keane", "M", "1993-01-11", "England", "Defender", "Everton");
INSERT INTO players VALUES(12, "Ellie", "Roebuck", "F", "1999-09-23", "England", "Goalkeeper", "Manchester City");

-- These commands perform various operations on the data – read (SELECT), update, and delete:

SELECT * FROM players WHERE id = 1;

UPDATE players SET club = "Everton" WHERE surname = "Kane";

DELETE FROM players WHERE position = "Midfielder";

SELECT COUNT(*) FROM players WHERE country = "England";
