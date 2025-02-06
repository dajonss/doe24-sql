SELECT
  orderid,
  name,
  phone,
  ordered
  FROM orders
  JOIN customers USING (customerid)
  WHERE orderid IN (SELECT
                      orderid
                      from orders_items
                           JOIN products USING (sku)
                     WHERE desc LIKE '%coffee%')
  AND orderid IN (SELECT
                    orderid
                    from orders_items
                         JOIN products USING (sku)
                   WHERE desc LIKE '%clean%')
  AND orderid IN (SELECT
                    orderid
                    from orders_items
                         JOIN products USING (sku)
                   WHERE desc LIKE '%bagel%')
  -- For completeness' sake, not really needed...
  AND ordered LIKE '2017%'
  AND name LIKE 'J% P%'
