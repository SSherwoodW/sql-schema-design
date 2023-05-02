-- in terminal:
-- psql < soccer_league.sql
-- psql soccer_league_db

DROP DATABASE IF EXISTS soccer_league_db;

CREATE DATABASE soccer_league_db;

\c soccer_league_db

CREATE TABLE teams (
    id INT PRIMARY KEY, 
    team_name text NOT NULL
);

CREATE TABLE players (
    id INT PRIMARY KEY,
    name TEXT NOT NULL,
    team INT REFERENCES teams
);

CREATE TABLE referees (
    id INT PRIMARY KEY,
    name TEXT
);

CREATE TABLE seasons (
    id INT PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

CREATE TABLE matches (
    id INT PRIMARY KEY,
    team_1 INT REFERENCES teams NOT NULL,
    team_2 INT REFERENCES teams NOT NULL,
    date DATE,
    location text,
    season_id INT REFERENCES seasons,
    center_referee_id INT REFERENCES referees,
    asst_referee_1_id INT REFERENCES referees,
    asst_referee_2_id INT REFERENCES referees
);

CREATE TABLE goals (
    id INT PRIMARY KEY,
    player_id INT REFERENCES players,
    match_id INT REFERENCES matches,
);

CREATE TABLE results (
    id INT PRIMARY KEY,
    match_id INT REFERENCES matches,
    team_id INT REFERENCES teams,
    result (W, L, D) TEXT
);

