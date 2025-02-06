--Clues:
--"Wow that was years ago"
--"Liked to claim the first pastries that came out of the oven"



SELECT name, sku, desc, phone, ordered, shipped 
	FROM orders JOIN customers USING(customerid) 
	JOIN orders_items USING (orderid) 
	JOIN products USING (sku) 
		WHERE ((sku LIKE 'BKY%') AND (shipped LIKE '% 04:%')) 
	GROUP BY shipped 
	ORDER BY shipped ASC 
	LIMIT 200;

-- 5 Women to choose from, Renee Harmon correct one.
