-- Creating tournament database and defining it's schema

DROP DATABASE IF EXISTS tournament;

CREATE DATABASE tournament;
\c tournament;

CREATE TABLE players ( 
	name TEXT,
    id SERIAL PRIMARY KEY
);

CREATE TABLE matches ( 
	id SERIAL PRIMARY KEY,
	p1 INTEGER REFERENCES players (id),
	p2 INTEGER REFERENCES players (id),
	winner INTEGER REFERENCES players (id)
);


-- View to retrieve number of matches
-- each player has played.
CREATE VIEW num_matches AS 
SELECT players.id, players.name, COUNT (matches.winner) AS matches
FROM players LEFT JOIN matches
ON players.id = matches.p1
OR players.id = matches.p2
GROUP BY players.id;

-- View to retrieve number of
-- wins each player has.
CREATE VIEW num_wins AS 
SELECT players.id, players.name, COUNT (matches.winner) AS wins
FROM players LEFT JOIN matches
ON players.id = matches.winner
GROUP BY players.id;

-- View to retrieve the current standings
CREATE VIEW standings AS 
SELECT players.id, players.name, COUNT (*) AS wins
FROM players RIGHT JOIN matches
ON players.id = matches.winner
GROUP BY players.id
ORDER BY wins DESC;
