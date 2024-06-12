#Q1
SELECT DISTINCT market
FROM dim_customer
WHERE customer="Atliq Exclusive" AND region="APAC";

#Q2
WITH cte AS(
SELECT COUNT(DISTINCT(product_code)) AS unique_products_2020
FROM fact_sales_monthly
WHERE fiscal_year=2020), 
cte1 AS (SELECT COUNT(DISTINCT(product_code)) AS unique_products_2021
FROM fact_sales_monthly
WHERE fiscal_year=2021)
SELECT *, ROUND((unique_products_2021-unique_products_2020)/unique_products_2020 *100, 2) AS percentage_chg
FROM cte, cte1;

#Q3
SELECT segment, COUNT(product_code) AS product_count
FROM dim_product
GROUP BY segment
ORDER BY product_count DESC;

#Q4
WITH cte1 AS(
SELECT d.segment, COUNT(DISTINCT f.product_code) AS product_count_2020
FROM dim_product d
JOIN fact_sales_monthly f
ON d.product_code=f.product_code
WHERE fiscal_year=2020
GROUP BY d.segment), 
cte2 AS(
SELECT d.segment AS segment_, COUNT(DISTINCT f.product_code) AS product_count_2021
FROM dim_product d
JOIN fact_sales_monthly f
ON d.product_code=f.product_code
WHERE fiscal_year=2021
GROUP BY d.segment), 
cte3 AS(SELECT *, (product_count_2021-product_count_2020) AS difference
FROM cte1 c1
JOIN cte2 c2
ON c1.segment=c2.segment_
ORDER BY difference DESC)
SELECT segment, product_count_2020, product_count_2021, difference
FROM cte3;

#Q5
SELECT d.product_code, d.product, f.manufacturing_cost 
FROM dim_product d
JOIN fact_manufacturing_cost f
ON d.product_code=f.product_code
WHERE manufacturing_cost= (SELECT MAX(manufacturing_cost) AS max_ FROM fact_manufacturing_cost) OR 
manufacturing_cost= (SELECT MIN(manufacturing_cost) AS min_ FROM fact_manufacturing_cost)
ORDER BY manufacturing_cost DESC;

#Q6
SELECT d.customer_code, d.customer , ROUND(AVG(pre_invoice_discount_pct),4) AS average_discount_percentage
FROM dim_customer d
JOIN fact_pre_invoice_deductions f
ON d.customer_code=f.customer_code
WHERE f.fiscal_year=2021 AND d.market="India"
GROUP BY d.customer_code
ORDER BY average_discount_percentage DESC
LIMIT 5;

#Q7
SELECT MONTHNAME(date) AS month_, s.fiscal_year, ROUND(SUM((gross_price*sold_quantity)),2) AS gross_sales_amount
FROM fact_gross_price f
JOIN fact_sales_monthly s
ON f.product_code=s.product_code
JOIN dim_customer d
ON d.customer_code=s.customer_code
WHERE customer="Atliq Exclusive"
GROUP BY s.fiscal_year, month_
ORDER BY s.date;

#Q8
WITH cte AS(
SELECT MONTH(date) AS m_, SUM(sold_quantity) AS tot
FROM fact_sales_monthly
WHERE fiscal_year=2020
GROUP BY m_)
SELECT CASE WHEN m_ IN(9,10,11) THEN "1"
			WHEN m_ IN(12,1,2) THEN "2"
			WHEN m_ IN (3,4,5) THEN "3" ELSE "4" END AS Quarters, SUM(tot) AS total_sold_quantity
FROM cte
GROUP BY Quarters
ORDER BY total_sold_quantity DESC;

#9
WITH cte AS(
SELECT d.channel, ROUND(SUM((f.sold_quantity*g.gross_price))/1000000, 2) AS gross_sales_mln
FROM dim_customer d
JOIN fact_sales_monthly f
ON d.customer_code=f.customer_code
JOIN fact_gross_price g
ON f.product_code=g.product_code
WHERE f.fiscal_year=2021
GROUP BY d.channel
ORDER BY gross_sales_mln DESC)
SELECT *, ROUND(gross_sales_mln/(SELECT SUM(gross_sales_mln) FROM cte)*100, 2) AS percentage
FROM cte;

#10
WITH cte AS (
SELECT d.division, f.product_code, d.product, SUM(f.sold_quantity) AS total_sold_quantity, RANK() OVER (PARTITION BY d.division ORDER BY SUM(f.sold_quantity) DESC) AS rank_order
FROM dim_product d
JOIN fact_sales_monthly f
ON d.product_code = f.product_code
WHERE f.fiscal_year = 2021
GROUP BY d.division, f.product_code, d.product)
SELECT division, product_code, product, total_sold_quantity, rank_order
FROM cte
WHERE rank_order IN (1, 2, 3);