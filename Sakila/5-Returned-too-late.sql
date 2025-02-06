--	5. What percentage of the non current rentals have been returned too late?
--	return_date - rental_date > rental_duration = OVERDUE
--	Couldnt figure out how to run a subquery on it.

SELECT title, rental_duration AS 'Tillåtna dagar', DATEDIFF (return_date, rental_date) AS 'Hyrda dagar'
	FROM film 
	JOIN inventory USING(film_id)
	JOIN rental USING (inventory_id) 
	WHERE return_date IS NOT NULL 
	ORDER BY rental_duration ASC 
	LIMIT 10;
