-- Overall view of superstore sales dataset --
SELECT
COUNT(order_id) AS Total_oreders,
COUNT(DISTINCT country) AS Total_countries,
COUNT(DISTINCT product_name) AS Total_products,
COUNT(DISTINCT category) AS Total_categories,
COUNT(DISTINCT sub_category) AS Total_subcategories,
COUNT(DISTINCT year) AS Total_years,
SUM(sales) AS Total_sales,
SUM(quantity) AS Total_quantity_sold,
AVG(profit) AS Avg_profit,
AVG(discount) AS Total_discount
FROM Sales_Data

-- sales performance analysis --
Select product_name, category, Total_sales, Total_quantity_sold from
(
Select
product_name,
category,
SUM(sales) AS Total_sales,
SUM(quantity) AS Total_quantity_sold
FROM sales_data
GROUP BY
product_name,
category
ORDER BY 
SUM(sales) DESC
)
where Rownum <= 10
--sales over year --
SELECT 
year,
SUM(sales) AS Total_sales
FROM sales_data
GROUP BY year
ORDER BY SUM(sales) DESC

-- customer segmentation --
SELECT
segment,
COUNT(DISTINCT customer_name) AS Toatl_customers,
SUM(sales) AS Total_sales
FROM Sales_data
GROUP BY segment
ORDER BY SUM(sales) DESC

-- Shipping and order management --
SELECT
ship_mode,
Round(AVG(shipping_cost), 2) AS Avg_shipping_cost,
Round(AVG(profit), 2) AS Avg_profit
FROM sales_data
GROUP BY ship_mode
ORDER BY AVG(profit)

--time analysis --
SELECT
  ship_mode,
  ROUND(AVG(ship_date - order_date), 2) AS avg_time_gap
FROM sales_data
GROUP BY ship_mode;

-- profibility and cost analysis --
SELECT
product_name,
category,
sub_category,
AVG(profit) AS Avg_profit,
AVG(discount) AS Avg_dicount
FROM sales_data
GROUP BY 
product_name,
category,
sub_category
ORDER BY AVG(profit) DESC

-- Global sales and quantity product overview --
SELECT
country,
SUM(sales) AS Total_sales,
SUM(quantity)  AS Total_quantity
FROM sales_data
GROUP BY country
ORDER BY SUM(sales) DESC


-- state level category exploration --
SELECT 
product_name,
category,
SUM(quantity) AS Total_quantity_sold
FROM sales_data
GROUP BY 
product_name,
category
ORDER BY SUM(quantity) DESC

-- Regional subcategory analysis --
SELECT
region,
sub_category,
SUM(quantity) AS Total_quantity_sold
FROM sales_data
GROUP BY region,
sub_category
ORDER BY SUM(quantity) DESC

