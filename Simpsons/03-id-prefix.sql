BEGIN TRANSACTION;
INSERT INTO migrations VALUES (3);
ALTER TABLE characters RENAME COLUMN id TO character_id;
ALTER TABLE episodes RENAME COLUMN id TO episodes_id;
ALTER TABLE locations RENAME COLUMN id TO locations_id;
ALTER TABLE script_lines RENAME COLUMN id TO script_lines_id;
COMMIT;
