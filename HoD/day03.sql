-- Clues:
-- Same neighborhood
-- Cancer born in year of rabbit

--Year of the rabbit:
--1927, 1939, 1951, 1963, 1975, 1987, 1999, 2011, 2023

--Month of cancer:
--22/6 - 22/7


SELECT name, phone, birthdate 
	FROM customers 
	WHERE (birthdate LIKE '%-06-%' OR birthdate LIKE '%-07-%') 
	AND citystatezip LIKE '%11435';
	
-- Robert Morton only relevant person
