## QUESTIONS TO BE ANSWERED:
### KPIs

 -- 1) Total Revenue (How much money did we make this year?)
 SELECT round(SUM(quantity*price),2) AS "Total Revenue"
 from order_details as o JOIN pizzas as p
 ON o.pizza_id = p.pizza_id
 -- 2) Average Order Value
 SELECT round(SUM(quantity*price)/ COUNT(DISTINCT order_id),2) AS "AVG Order Value"
 from order_details as o JOIN pizzas as p
 ON o.pizza_id = p.pizza_id
 -- 3) Total Pizzas Sold
 SELECT SUM(quantity) as "Total Pizzas Sold"
 from order_details as o JOIN pizzas as p
 ON o.pizza_id = p.pizza_id
 -- 4) Total Orders
 SELECT COUNT(DISTINCT order_id) as "Total Orders"
 from order_details as o JOIN pizzas as p
 ON o.pizza_id = p.pizza_id
 -- 5) Average Pizzas per Order
SELECT round(SUM(quantity)/COUNT(DISTINCT order_id),1) AS "AVG Pizza Per Order"
 from order_details as o JOIN pizzas as p
 ON o.pizza_id = p.pizza_id
### QUESTIONS TO ANSWER 

 -- 1) Daily Trends for Total Orders
 SELECT DAYNAME(date) As DayofWeek,
	COUNT(DISTINCT order_id) as total_order
 from orders
 GROUP BY DAYNAME(date)
 ORDER BY total_order DESC
 -- 2) Hourly Trend for Total Orders
 SELECT HOUR(time) As HOURS,
	COUNT(DISTINCT order_id) as total_order
 from orders
 GROUP BY HOUR(time)
 ORDER BY HOURS ASC
 -- 3) Percentage of Sales by Pizza Category
 SELECT DISTINCT category, SUM(quantity) As total_sales,
 SUM(quantity) * 100/(SELECT SUM(quantity)
                      from pizzas as p2
                      JOIN order_details as o2
                      ON p2.pizza_id = o2.pizza_id) AS percentage_sales
 from pizza_types JOIN pizzas 
 ON pizza_types.pizza_type_id = pizzas.pizza_type_id
 JOIN order_details 
 ON pizzas.pizza_id = order_details.pizza_id
 Group by category
 
 -- Percentage sales revenue
 SELECT DISTINCT category, SUM(quantity * price) As total_revenue,
 round (SUM(quantity * price) * 100/(SELECT SUM(quantity * price)
                      from pizzas as p2
                      JOIN order_details as o2
                      ON p2.pizza_id = o2.pizza_id),2) AS percentage_sales
 from pizza_types JOIN pizzas 
 ON pizza_types.pizza_type_id = pizzas.pizza_type_id
 JOIN order_details 
 ON pizzas.pizza_id = order_details.pizza_id
 Group by category
 -- 4) Percentage of Sales by Pizza Size
 SELECT DISTINCT size, SUM(quantity * price) As total_revenue_bysize, 
 round(SUM (quantity * price) * 100/(SELECT SUM(quantity * price)
                               from pizzas as p2 JOIN order_details as o2
                               ON o2.pizza_id = p2.pizza_id),2) AS percentage_salesbysize
 from pizza_types JOIN pizzas 
 ON pizza_types.pizza_type_id = pizzas.pizza_type_id
 JOIN order_details 
 ON pizzas.pizza_id = order_details.pizza_id
 Group by size
 -- 5) Total Pizzas Sold by Pizza Category
 SELECT DISTINCT category, SUM(quantity) As total_sold,
 SUM(quantity) * 100/(SELECT SUM(quantity)
                      from pizzas as p2
                      JOIN order_details as o2
                      ON p2.pizza_id = o2.pizza_id) AS percentage_sold
 from pizza_types JOIN pizzas 
 ON pizza_types.pizza_type_id = pizzas.pizza_type_id
 JOIN order_details 
 ON pizzas.pizza_id = order_details.pizza_id
 Group by category
 -- 6) Top 5 Best Sellers by Total Pizzas Sold
 
 SELECT name, SUM(quantity) as total_sold from order_details as o
 JOIN pizzas as p ON o.pizza_id = p.pizza_id
 JOIN pizza_types as pt ON p.pizza_type_id = pt.pizza_type_id
 Group by name
 Order by total_sold DESC
 LIMIT 5
 -- 7) Bottom 5 Worst Sellers by Total Pizzas Sold
SELECT name, SUM(quantity) as total_sold from order_details as o
 JOIN pizzas as p ON o.pizza_id = p.pizza_id
 JOIN pizza_types as pt ON p.pizza_type_id = pt.pizza_type_id
 Group by name
 Order by total_sold ASC
 LIMIT 5








