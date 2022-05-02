SELECT customer_name, product_name
FROM (
  SELECT * FROM sales WHERE volume > 1000
) AS Kiyomi;
