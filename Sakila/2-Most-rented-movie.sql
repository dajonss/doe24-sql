--	2. What's the title of the most rented movie? How many times has it been rented?
SELECT film_id, count(film_id), title 
	FROM rental 
	JOIN inventory USING (inventory_id) 
	JOIN film USING (film_id) 
	GROUP BY film_id 
	ORDER BY count(film_id) DESC 
	LIMIT 1;
