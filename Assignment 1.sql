-- 1.1. Write a query that selects product_name, list_price, and a calculated column price_in_thousands (list_price divided by 1000) from production.products.

use BikeStores;
select product_name,list_price , (list_price * 1000) as price_in_thousands from production.products 

-- 1.2. Write a query that returns the distinct list of state values from sales.customers.
select distinct (state) from sales.customers;

-- 1.3. Write a query that returns the 5 cheapest products, showing product_name and list_price, sorted appropriately.
select product_name , list_price from production.products order by list_price asc offset 0 rows fetch next 5 rows only;

-- 1.4. Write a query that returns products priced between 200 and 600, where the category is either 1 or 6. Use BETWEEN and IN together.
select product_name , category_id,list_price from production.products where category_id in (1,6) and list_price between '200' and '600' order by list_price asc;

-- 1.5. The following query is meant to find affordable mountain or road bikes (categories 1 and 6) under $1000, but it has a bug. Identify it and rewrite it correctly:
-- corrected query 
SELECT product_name, category_id, list_price
FROM production.products
WHERE (category_id = 6 or category_id = 7) AND list_price < 1000 order by list_price asc;

-- 1.6. Write a query that finds all customers whose email ends in .com and whose last_name starts with the letter "M".
select * from sales.customers where email like '%.com' and last_name like 'M%';

-- 1.7. Write a query that returns the 11th through 20th most expensive products using OFFSET...FETCH.
select product_name , list_price from production.products order by list_price desc offset 10 rows fetch next 10 rows only 

-- 1.8. Think About It: A junior engineer writes WHERE discount <> NULL to find order items with a defined discount, and the query returns zero rows even though the table clearly has non-null discount values. Explain why, using three-valued logic, and write the correct version.

-- Ans: when comparing with null values it will always returned no records since when we use where condition it only returns values when the condition becomes true instead we should use ' is null' or 'is not null' to filter the records.
select order_id , discount from sales.order_items where discount is not null ;