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
 -- 2) Hourly Trend for Total Orders
 -- 3) Percentage of Sales by Pizza Category
 -- 4) Percentage of Sales by Pizza Size
 -- 5) Total Pizzas Sold by Pizza Category
 -- 6) Top 5 Best Sellers by Total Pizzas Sold
 -- 7) Bottom 5 Worst Sellers by Total Pizzas Sold









