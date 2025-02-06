BEGIN TRANSACTION;
INSERT INTO migrations VALUES (1);
ALTER TABLE simpsons_episodes rename TO episodes;
ALTER TABLE simpsons_script_lines rename TO script_lines;
ALTER TABLE simpsons_characters rename TO characters;
ALTER TABLE simpsons_locations rename TO locations;
COMMIT; 
