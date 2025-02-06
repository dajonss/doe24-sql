--Clues:
--Shops with coupons.
--Wholesale-cost higher than unitprice

SELECT 
	name, 
	phone, 
	customerid, 
	wholesale_cost, 
	unit_price, 
	sum(wholesale_cost - unit_price) AS totalt 
	FROM customers 
	JOIN orders USING(customerid) 
	JOIN orders_items USING(orderid) 
	JOIN products using(sku) 
WHERE wholesale_cost > unit_price 
GROUP BY customerid 
ORDER BY totalt DESC limit 2;
