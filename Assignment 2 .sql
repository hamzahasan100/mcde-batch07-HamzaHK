-- 2.1. Write a query that lists every product with its brand name, using production.products and production.brands.
select p.product_name, b.brand_name from production.products p inner join production.brands b on p.brand_id = b.brand_id;

-- 2.2. Using a LEFT JOIN, write a query that finds every store with zero staff currently assigned to it.
select sr.store_name from sales.stores sr left join sales.staffs st on sr.store_id = st.store_id where st.staff_id is Null ;

-- 2.3. Explain, in your own words, why the following query returns every product regardless of stock level, and rewrite it so that it only returns products with fewer than 5 units in stock at store 1:

SELECT p.product_name, s.quantity
FROM production.products AS p
LEFT JOIN production.stocks AS s
   ON p.product_id = s.product_id WHERE (s.quantity < 5 AND s.store_id = 1) order by s.quantity;

-- 2.4. Write a self join on sales.staffs that lists every manager along with a count placeholder column showing 1 for each employee they manage (you will replace this with a real COUNT in Chapter 3); for now, just produce one row per employee-manager pair.
select concat(m.first_name,m.last_name)Manager_name, count(s.staff_id) as Total_Employees
from sales.staffs s inner join sales.staffs m on s.manager_id = m.staff_id
group by m.staff_id,m.first_name,m.last_name;

-- 2.5. Write a three-table join across sales.orders, sales.order_items, and production.products that lists every item in order #1, including product name and quantity.
USE BikeStores;

Select 
    o.order_id,p.product_name,oi.quantity,oi.list_price,oi.discount
from sales.orders o
inner join sales.order_items oi 
ON o.order_id = oi.order_id 
inner join production.products p 
on oi.product_id = p.product_id
where o.order_id = 1;


-- 2.6. A colleague joins orders to order_items and reports "we received 4,658 orders last year." Explain what actually went wrong with that number and how you would find the true order count instead.

SELECT COUNT(*) AS total_orders
FROM sales.orders
