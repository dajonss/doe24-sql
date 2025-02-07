--CLUES:
--"Apparently he owns an entire set of Noah’s collectibles!"
--Man


SELECT name, count(DISTINCT sku) AS NumberOfCollectibles, sku, desc, phone
	FROM customers
	JOIN orders USING (customerid)
	JOIN orders_items USING (orderid)
	JOIN products using (SKU)
	WHERE (sku LIKE 'COL%%')
	GROUP BY name
	ORDER BY NumberOfCollectibles DESC
	LIMIT 1
	;


