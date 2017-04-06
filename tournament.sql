-- Table definitions for the tournament project.

CREATE database tournament;

\c tournament;

CREATE table players (
    id serial primary key,
    name text
);

CREATE table matches (
    winner integer references players (id),
    loser integer references players (id)
);

-- The two views matches_won and matches_played are used
-- for creating the view standings.

CREATE VIEW matches_won as
    SELECT players.id, players.name, count(matches.winner) as won
    FROM players
    LEFT JOIN matches ON players.id = matches.winner
    GROUP BY players.id;


CREATE VIEW matches_played as
    SELECT players.id, count(matches) as played
    FROM players
    LEFT JOIN matches ON players.id = matches.winner or players.id = matches.loser
    GROUP BY players.id;

CREATE VIEW standings as
    SELECT matches_won.id, matches_won.name, matches_won.won, matches_played.played
    FROM matches_won JOIN matches_played on matches_won.id = matches_played.id
    ORDER BY won DESC;