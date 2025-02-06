--	3. What's the title of the 4th most rented movie? How many times has it been rented?
SELECT title, count(film_id) AS rented 
	FROM rental 
	JOIN inventory USING (inventory_id) 
	JOIN film USING (film_id) 
	GROUP BY film_id 
	ORDER BY rented DESC 
	LIMIT 1 
	OFFSET 3;
