BEGIN TRANSACTION;
DROP TABLE IF EXISTS tmp_characters;
DROP TABLE IF EXISTS tmp_locations;
DROP TABLE IF EXISTS tmp_script_lines;
DROP TABLE IF EXISTS tmp_episodes;

INSERT INTO migrations VALUES (4);
CREATE TEMP TABLE tmp_characters AS SELECT * FROM characters;
DROP TABLE IF EXISTS characters;
CREATE TABLE IF NOT EXISTS "characters" (
        character_id INTEGER PRIMARY KEY NOT NULL,
        name VARCHAR NOT NULL,
        normalized_name VARCHAR NOT NULL,
        gender VARCHAR
);
INSERT INTO characters SELECT * FROM tmp_characters;

CREATE TEMP TABLE tmp_locations AS SELECT * FROM locations;
DROP TABLE IF EXISTS locations;
CREATE TABLE IF NOT EXISTS "locations" (
        locations_id INTEGER PRIMARY KEY NOT NULL,
        name VARCHAR NOT NULL,
        normalized_name VARCHAR NOT NULL
);
INSERT INTO locations SELECT * FROM tmp_locations;

CREATE TEMP TABLE tmp_script_lines AS SELECT * FROM script_lines;
DROP TABLE IF EXISTS script_lines;
CREATE TABLE IF NOT EXISTS "script_lines" (
        script_lines_id INTEGER PRIMARY KEY NOT NULL,
        episode_id INTEGER NOT NULL,
        number INTEGER NOT NULL,
        raw_text VARCHAR NOT NULL,
        timestamp_in_ms VARCHAR NOT NULL,
        speaking_line VARCHAR NOT NULL,
        character_id INTEGER,
        location_id INTEGER,
        raw_character_text VARCHAR,
        raw_location_text VARCHAR,
        spoken_words VARCHAR,
        normalized_text VARCHAR,
        word_count VARCHAR
);
INSERT INTO script_lines SELECT * FROM tmp_script_lines;

CREATE TEMP TABLE tmp_episodes AS SELECT * FROM episodes;
DROP TABLE IF EXISTS episodes;
CREATE TABLE IF NOT EXISTS "episodes" (
        episodes_id INTEGER PRIMARY KEY NOT NULL,
        image_url VARCHAR,
        imdb_rating FLOAT,
        imdb_votes FLOAT,
        number_in_season INTEGER NOT NULL,
        number_in_series INTEGER NOT NULL,
        original_air_date DATE NOT NULL,
        original_air_year INTEGER NOT NULL,
        production_code VARCHAR NOT NULL,
        season INTEGER NOT NULL,
        title VARCHAR NOT NULL,
        us_viewers_in_millions FLOAT,
        video_url VARCHAR,
        views INTEGER
);
INSERT INTO episodes SELECT * FROM tmp_episodes;
COMMIT;
