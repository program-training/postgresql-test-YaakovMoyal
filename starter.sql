-- Active: 1694601270164@@127.0.0.1@8200@northwind@public


-- 1
SELECT * FROM employees

-- 2
SELECT COUNT(product_id) FROM products


-- 3
-- SELECT  first_name || ' ' || last_name AS employee_name, city
-- FROM employees
-- WHERE country ILIKE 'USA'
-- AND city NOT ILIKE 'Seattle'


-- 4
SELECT * FROM products
WHERE supplier_id = 2
ORDER BY unit_price DESC
LIMIT 3


-- 5
-- SELECT category_id 
-- -- , COUNT(category_id)
-- FROM products
-- GROUP BY category_id
-- HAVING COUNT(category_id) > 10
-- -- ORDER BY category_id


-- 6
SELECT categories.category_name
-- ,products.category_id 
FROM products
INNER JOIN categories
ON products.category_id = categories.category_id
GROUP BY categories.category_name
-- ,products.category_id
HAVING COUNT(products.category_id) > 10


-- 8
SELECT  first_name || ' ' || last_name || ' living in ' || territory_description AS employee_territories
FROM employees INNER JOIN employee_territories
ON employees.employee_id = employee_territories.employee_id
INNER JOIN territories
ON employee_territories.territory_id = territories.territory_id

-- 8 ללא חיבור הטבלאות
SELECT  first_name, last_name , territory_description
FROM employees INNER JOIN employee_territories
ON employees.employee_id = employee_territories.employee_id
INNER JOIN territories
ON employee_territories.territory_id = territories.territory_id


-- 9
SELECT  'sum orders of '|| first_name || ' ' || last_name || ' is ' || COUNT(orders.employee_id) AS total
FROM employees
INNER JOIN orders
ON employees.employee_id = orders.employee_id
GROUP BY last_name, first_name
HAVING COUNT(orders.employee_id) > 100
-- ORDER BY total

-- 9 ללא חיבור הטבלאות
SELECT  first_name, last_name, COUNT(orders.employee_id) AS total
FROM employees
INNER JOIN orders
ON employees.employee_id = orders.employee_id
GROUP BY last_name, first_name
HAVING COUNT(orders.employee_id) > 100
-- ORDER BY total
