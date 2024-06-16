# Problem Statement  
Atliq Hardwares, a leading computer hardware manufacturer based in India with a global presence, is seeking to enhance its data analytics capabilities. The management has observed a lack of sufficient insights for making swift, data-driven decisions. To address this, they plan to expand their data analytics team by recruiting several junior data analysts. Tony Sharma, the Data Analytics Director, aims to find candidates proficient in both technical and interpersonal skills. To evaluate these abilities, he has organized a SQL challenge.

## 1. ASK  
Director: Mr. Tony Sharma 

### Questions:  
- Provide the list of markets in which customer "Atliq Exclusive" operates its business in the APAC region.
- What is the percentage of unique product increase in 2021 vs. 2020? The final output contains these fields : unique_products_2020, unique_products_2021 & percentage_chg.
- Provide a report with all the unique product counts for each segment and sort them in descending order of product counts? The final output contains 2 fields: segment & product_count.
- Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? The final output contains these fields: segment, product_count_2020, product_count_2021 & difference.
- Get the products that have the highest and lowest manufacturing costs? The final output should contain these fields: product_code, product & manufacturing_cost.
- Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market. The final output contains these fields: customer_code, customer & average_discount_percentage.
- Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month. This analysis helps to get an idea of low and high-performing months and take strategic decisions. The final report contains these columns: Month, Year & Gross sales Amount.
- In which quarter of 2020, got the maximum total_sold_quantity? The final output contains these fields sorted by the total_sold_quantity, Quarter & total_sold_quantity.
- Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution? The final output contains these fields: channel, gross_sales_mln & percentage.
- Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021? The final output contains these fields: division, product_code, product, total_sold_quantity & rank_order.


## 2. PREPARE  
### Data Storage:
[Resume Project Challenge 04] The public dataset is completely available on the Code basis website platform where it stores and consolidates all available datasets for analysis. The specific individual datasets at hand can be obtained at this link below: https://codebasics.io/challenge/codebasics-resume-project-challenge  

### Data Organized:
The dataset is taken from the AtliQ. Thanks to the AtliQ for providing datasets for public access which is a great learning asset - feel free to explore them here. This dataset contains only gdb023' (atliq_hardware_db) database and 1 text file (meta_data)


## 3. PROCESS  
### Tools Used:
1. MySQL
2. Power BI

### Data Used:
dim_customers, dim_product, fact_gross_price, fact_manufacturing_cost, fact_pre_invoice_deductions, fact_sales_monthly  

### About Data:  
This file provides a comprehensive overview of the tables found in the 'gdb023' (atliq_hardware_db) database. It includes information for six main tables:

1. dim_customer: contains customer-related data
2. dim_product: contains product-related data
3. fact_gross_price: contains gross price information for each product
4. fact_manufacturing_cost: contains the cost incurred in the production of each product
5. fact_pre_invoice_deductions: contains pre-invoice deductions information for each product
6. fact_sales_monthly: contains monthly sales data for each product.

Column Description for dim_customer table:
1. customer_code: The 'customer_code' column features unique identification codes for every customer in the dataset. These codes can be used to track a customer's sales history, demographic information, and other relevant details. For example, the codes could look like '70002017', '90005160', and '80007195' respectively.
2. customer: The 'customer' column lists the names of customers, for example 'Atliq Exclusive', 'Flipkart', and 'Surface Stores' etc.
3. platform: The 'platform' column identifies the means by which a company's products or services are sold. "Brick & Mortar" represents the physical store/location, and "E-Commerce" represents online platforms.
4. channel: The 'channel' column reflects the distribution methods used to sell a product. These methods include "Retailers", "Direct", and "Distributors". Retailers refer to physical or online stores that sell products to consumers. Direct sales refer to sales made directly to consumers through a company's website or other direct means, and distributors refer to intermediaries or middlemen between the manufacturer and retailer or end consumers.
5. market: The 'market' column lists the countries in which the customer is located.
6. region: The 'region' column categorizes countries according to their geographic location, including "APAC" (Asia Pacific), "EU" (Europe), "NA" (North America), and "LATAM" (Latin America).
7. sub_zone: "The 'sub_zone' column further breaks down the regions into sub-regions, such as "India", "ROA" (Rest of Asia), "ANZ" (Australia and New Zealand), "SE" Southeast Asia), "NE" (Northeast Asia), "NA" (North America), and "LATAM" (Latin America)."

Column Description for dim_product table:
1. product_code: The 'product_code' column features unique identification codes for each product, serving as a means to track and distinguish individual products within a database or system.
2. division: The 'division' column categorizes products into groups such as "P & A" (Peripherals and Accessories), "N & S" (Network and Storage) and "PC" (Personal Computer).
3. segment: The 'segment' column categorizes products further within the division, such as "Peripherals" (keyboard, mouse, monitor, etc.), "Accessories" (cases, cooling solutions, power supplies), "Notebook" (laptops), "Desktop" (desktops, all-in-one PCs, etc), "Storage" (hard disks, SSDs, external storage), and "Networking" (routers, switches, modems, etc.).
4. category: The 'category' column classifies products into specific subcategories within the segment.
5. product: The 'product' column lists the names of individual products, corresponding to the unique identification codes found in the 'product_code' column.
6. variant: The "variant" column classifies products according to their features, prices, and other characteristics. The column includes variants such as "Standard", "Plus", "Premium" that represent different versions of the same product.

Column Description for fact_gross_price table:
1. product_code: The 'product_code' column features unique identification codes for each product.
2. fiscal_year: The 'fiscal_year' column contains the fiscal period in which the product sale was recorded. A fiscal year is a 12-month period that is used for accounting purposes and often differs from the calendar year. For Atliq Hardware, the fiscal year starts in September. The data available in this column covers the fiscal years 2020 and 2021.
3. gross_price: The 'gross_price' column holds the initial price of a product, prior to any reductions or taxes. It is the original selling price of the product.

Column Description for fact_manufacturing_cost:
1. product_code: The 'product_code' column features unique identification codes for each product
2. cost_year: The "cost_year" column contains the fiscal year in which the product was manufactured.
3. manufacturing_cost: The "manufacturing_cost" column contains the total cost incurred for the production of a product. This cost includes direct costs like raw materials, labor, and overhead expenses that are directly associated with the production process.

Column Description for fact_pre_invoice_deductions:
1. customer_code: The 'customer_code' column features unique identification codes for every customer in the dataset. These codes can be used to track a customer's sales history, demographic information, and other relevant details. For example, the codes could look like '70002017', '90005160', and '80007195' respectively.
2. fiscal_year: The "fiscal_year" column holds the fiscal period when the sale of a product occurred.
3. pre_invoice_discount_pct: The "pre_invoice_discount_pct" column contains the percentage of pre-invoice deductions for each product. Pre-invoice deductions are discounts that are applied to the gross price of a product before the invoice is generated, and typically applied to large orders or long-term contracts.

Column Description for fact_sales_monthly:
1. date: The "date" column contains the date when the sale of a product was made, in a monthly format for 2020 and 2021 fiscal years. This information can be used to understand the sales performance of products over time.
2. product_code: The "product_code" column contains a unique identification code for each product. This code is used to track and differentiate individual products within a database or system.
3. customer_code: The 'customer_code' column features unique identification codes for every customer in the dataset. These codes can be used to track a customer's sales history, demographic information, and other relevant details. For example, the codes could look like '70002017', '90005160', and '80007195' respectively.
4. sold_quantity: The "sold_quantity" column contains the number of units of a product that were sold. This information can be used to understand the sales volume ofproducts and to compare the sales volume of different products or variants.
5. fiscal_year: The "fiscal_year" column holds the fiscal period when the sale of a product occurred.


### Data Cleaning & Transformation:
- In PowerBI, Replace Newzealand with New Zealand.
- Performing data validation of all the datasets.

## 4. ANALYZE  
Data Analyzing  
MySQL was used to analyze data.  

-- KPI’s REQUIREMENT --  
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
WITH cte AS(        
SELECT d.division, f.product_code, d.product, SUM(f.sold_quantity) AS total_sold_quantity, RANK() OVER (PARTITION BY d.division ORDER BY SUM(f.sold_quantity) DESC) AS rank_order        
FROM dim_product d        
JOIN fact_sales_monthly f        
ON d.product_code = f.product_code        
WHERE f.fiscal_year = 2021        
GROUP BY d.division, f.product_code, d.product)        
SELECT division, product_code, product, total_sold_quantity, rank_order        
FROM cte        
WHERE rank_order IN (1, 2, 3);        


## 5. SHARE	
![Screenshot (105)](https://github.com/iankitnegi/SQL_AdHoc_Analysis_Project/assets/132642567/0d2cf631-79c4-4f59-8270-c869f39f7720)
![Screenshot (106)](https://github.com/iankitnegi/SQL_AdHoc_Analysis_Project/assets/132642567/c08b0324-fab1-493d-bcad-a57406b74cb5)



## 6. ACT
### Insights:
- AtliQ Exclusive operates its business in eight countries within the APAC region are as follows: India, Indonesia, Japan, Philiphines, South Korea, Australia, New Zealand, Bangladesh.
- In the fiscal year 2020, we had a total of 245 products, which increased to 334 in the fiscal year 2021, marking a 36% growth.
- Notebooks, Accessories, and Peripherals are the three top segments.
- The Accessories segment had the most unique products in 2021 compared to 2020.
- The AQ HOME Allin1 Gen 2 has the highest manufacturing cost, while the AQ Master wired x1 MS has the lowest manufacturing cost.
- Flipkart, Viveks, Ezone, Croma, and Amazon offered the highest average discount percentages in the Indian market for the fiscal year 2021.
- In 2019, September was the lowest performing month, while November saw the highest performance. For 2020, March was the lowest performing month, with November again being the highest.
- The first quarter of 2020 (September, October, November) saw the highest number of products sold.
- The retailer channel significantly boosted gross sales in the fiscal year 2021, contributing 73.23%.
- The top-selling products in the fiscal year 2021 were as follows: N&S Division: AQ Pen Drive 2 in 1, AQ Pen Drive DRC, P&A Division: AQ Gamers MS, AQ Maxima MS, PC Division: AQ Digit, AQ Velocity


### Recommendations:
- Maximize Online Discounts: Work with Flipkart, Viveks, Ezone, Croma, and Amazon for exclusive online deals.
- Boost March and September: Implement special offers to improve sales during these low months.
- Cost Reduction: Reduce manufacturing costs for the AQ HOME Allin1 Gen 2.
- Replicate Q1 Success: Analyze and replicate strategies that boosted first-quarter sales in 2020.

Thank you for reading and evaluating my repo :)














