CREATE TABLE players (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    surname TEXT,
    gender INTEGER,
    date_of_birth TEXT,
    country INTEGER,
    club INTEGER,
    FOREIGN KEY(gender) REFERENCES genders(id),
    FOREIGN KEY(country) REFERENCES countries(id),
    FOREIGN KEY(club) REFERENCES clubs(id)
);

CREATE TABLE player_positions (
    player_id INTEGER,
    position_id INTEGER,
    PRIMARY KEY(player_id, position_id)
);

CREATE TABLE genders (
    id INTEGER PRIMARY KEY,
    gender TEXT
);

CREATE TABLE countries (
    id INTEGER PRIMARY KEY,
    country TEXT
);

CREATE TABLE positions (
    id INTEGER PRIMARY KEY,
    country TEXT
);

CREATE TABLE clubs (
    id INTEGER PRIMARY KEY,
    club TEXT
);