CREATE TABLE analytical_sales (
    transaction_id INT PRIMARY KEY,
    product_category VARCHAR(100),
    units_sold INT,
    total_revenue NUMERIC(8,2)
);
INSERT INTO analytical_sales VALUES
(1, 'Electronics', 2, 1199.98),
(2, 'Apparel', 5, 125.00),
(3, 'Electronics', 1, 45.00),
(4, 'Home Goods', 3, 270.00),
(5, 'Apparel', 1, 45.00),
(6, 'Electronics', 4, 2400.00);
select * from analytical_sales;

---1)Calculating global states metrics using AGGREGATE FUNCTIONS
SELECT
SUM(total_revenue) as gross_revenue,
avg(total_revenue) as total_transactions,
count(*) as total_transactions,
min(total_revenue) as lowest_revenue,
max(total_revenue) as highest_revenue
from analytical_sales;

---2)COUNT DISTINTING categories using cont
SELECT
count(distinct product_category) as unique_categories
from analytical_sales;

---3)segment revenue GROUP BY
select
  product_category,
  sum(total_revenue) as category_revenue,
  sum(units_sold) as total_units
from
  analytical_sales
  group by product_category;
  
---4)Ranking categories by revenue
SELECT
product_category,
sum (total_revenue) as highest_revenue
from analytical_sales
group by product_category
order by highest_revenue desc;

---5)Filtering individual records using (where)
select *
from analytical_sales
where units_sold>1;

---6)Filterin aggregated results using (having)
select
product_category,
sum(total_revenue) as gross_revenue
from analytical_sales
group by product_category
having sum(total_revenue)>300
order by gross_revenue desc;

---7)Combining where,group by, and having
select
    product_category,
    SUM(total_revenue) as filtered_category_revenue
FROM
    analytical_sales
WHERE
    units_sold > 1
GROUP BY
    product_category
HAVING
    SUM(total_revenue)>250;
	
---8)sql logical execution order
select
    product_category,
    sum(total_revenue) as filtered_category_revenue
from
  analytical_sales
where
  units_sold >1
group by
       product_category
having
    sum(total_revenue)>250
order by filtered_category_revenue desc
limit 2;

---CRRECTING an aggregation error
select
  product_category,
  transaction_id,
  sum(total_revenue) as category_revenue
from analytical_sales
group by transaction_id;

    
   
