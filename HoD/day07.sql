--Clues:
--Customerid 4167
--Same item different color
--Same time

select
  orders.shipped,
  sku,
  products.desc
  from orders
       join orders_items using (orderid)
       join products using (sku)
 where customerid = 4167
   and products.desc like '%(%)%'
       ;


