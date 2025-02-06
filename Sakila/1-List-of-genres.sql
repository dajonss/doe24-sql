--	1. Show a list of film genres. For each genre show a list of titles of movies belonging to that genre.
SELECT category, GROUP_CONCAT(title) 
	FROM film_list 
	GROUP BY category;
