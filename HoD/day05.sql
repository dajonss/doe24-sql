--Clues:
--"I only have 10 or 11 cats"
--"Lives in Staten Island"

SELECT name, count(name) AS köp, desc, citystatezip, phone 
	FROM customers 
	JOIN orders USING (customerid) 
	JOIN orders_items USING (orderid) 
	JOIN products USING(sku) 

	WHERE (DESC LIKE('%Cat food%') 
	AND citystatezip LIKE('%Staten%')) 
	GROUP BY name 
	ORDER BY köp DESC limit 2;
