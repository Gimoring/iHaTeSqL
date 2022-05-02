SELECT  u.id, first_name, last_name, street, house_number, c.name AS city_name
FROM  users AS u
INNER JOIN addresses AS a ON a.id = u.address_id
INNER JOIN cities AS c ON c.id = a.city_id
WHERE c.id = 1;