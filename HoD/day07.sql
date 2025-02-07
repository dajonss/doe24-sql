--Clues:
--Customerid 4167
--Same item different color
--Same time

SELECT shipped, sku, desc, name, phone
	FROM customers
	JOIN orders USING (customerid)
	JOIN orders_items USING (orderid)
	JOIN products using (SKU)
	WHERE (shipped LIKE '2018-12-31 12:26%' 
		OR shipped LIKE '2020-06-28 11:36%' 
		OR shipped LIKE '2021-10-07 20:15%' 
		OR shipped LIKE '2022-04-23 18:45%')
		AND products.desc like '%(%)%'
	ORDER BY name;


