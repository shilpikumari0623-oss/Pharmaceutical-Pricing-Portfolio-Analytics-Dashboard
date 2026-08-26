CREATE DATABASE pharmaceutical_pricing_portfolio_analytics;
USE pharmaceutical_pricing_portfolio_analytics;
SELECT COUNT(*) AS Total_Products
FROM pharmaceutical_products;

DESCRIBE pharmaceutical_products;
SELECT *
FROM pharmaceutical_products
LIMIT 10;

/* =====================================================
Query 1: Total Product Portfolio

Business Question:
How many pharmaceutical products are available
in the dataset?

Business Purpose:
To understand the overall size of the pharmaceutical
product portfolio.
===================================================== */

SELECT COUNT(*) AS Total_Products
FROM pharmaceutical_products;

/* 
Query 2: Product Lifecycle Analysis

Business Question:
How many products are currently active versus
discontinued?

Business Purpose:
To understand the product lifecycle status and
overall portfolio health.
 */

SELECT Is_discontinued,
    COUNT(*) AS Product_Count
FROM pharmaceutical_products
GROUP BY Is_discontinued
ORDER BY Is_discontinued;

/* 
Query 3: Manufacturer Portfolio Size

Business Question:
Which manufacturers have the largest product portfolios?

Business Purpose:
To compare manufacturers based on the number of products in their portfolio.
*/

SELECT Manufacturer,
COUNT(*) AS Product_Count
FROM pharmaceutical_products
GROUP BY Manufacturer
ORDER BY Product_Count DESC;

/*
Query 4: Therapeutic Portfolio Distribution

Business Question:
Which therapeutic classes have the largest number
of products?

Business Purpose:
To understand the distribution of the pharmaceutical
portfolio across therapeutic categories.
 */

SELECT Therapeutic_class,
    COUNT(*) AS Product_Count
FROM pharmaceutical_products
GROUP BY Therapeutic_class
ORDER BY Product_Count DESC;

/* 
Query 5: Dosage Form Distribution

Business Question:
Which dosage forms are most common in the product
portfolio?

Business Purpose:
To understand the formulation mix of the pharmaceutical
portfolio.
*/

SELECT Dosage_form,
    COUNT(*) AS Product_Count
FROM pharmaceutical_products
GROUP BY Dosage_form
ORDER BY Product_Count DESC;

/* 
Query 6: Pack Unit Distribution

Business Question:
Which packaging units are most commonly used?

Business Purpose:
To understand packaging patterns across the
product portfolio.
*/

SELECT Pack_unit,
    COUNT(*) AS Product_Count
FROM pharmaceutical_products
GROUP BY Pack_unit
ORDER BY Product_Count DESC;

/* 
Query 7: Average Product Price

Business Question:
What is the average price of pharmaceutical products?

Business Purpose:
To establish a baseline pricing KPI for the
product portfolio.
 */

SELECT
    ROUND(AVG(Price_inr), 2) AS Average_Price_INR
FROM pharmaceutical_products;

/* 
 Query 8: Average Price by Manufacturer

Business Question:
Which manufacturers have the highest average
product prices?

Business Purpose:
To compare pricing levels across manufacturers
and identify relatively premium-priced portfolios. */

SELECT Manufacturer,
    ROUND(AVG(Price_inr), 2) AS Average_Price_INR
FROM pharmaceutical_products
GROUP BY Manufacturer
ORDER BY Average_Price_INR DESC;

/* 
Query 9: Average Price by Therapeutic Class

Business Question:
Which therapeutic classes have the highest average
product prices?

Business Purpose:
To compare pricing patterns across therapeutic
categories. */

SELECT Therapeutic_class,
    ROUND(AVG(Price_inr), 2) AS Average_Price_INR
FROM pharmaceutical_products
GROUP BY Therapeutic_class
ORDER BY Average_Price_INR DESC;

/* Query 10: Average Price by Dosage Form

Business Question:
Which dosage forms have the highest average prices?

Business Purpose:
To identify pricing differences across pharmaceutical
formulations.*/

SELECT Dosage_form,
    ROUND(AVG(Price_inr), 2) AS Average_Price_INR
FROM pharmaceutical_products
GROUP BY Dosage_form
ORDER BY Average_Price_INR DESC;

SELECT CASE                                                                             -- Query 11: Price Segmentation : 
        WHEN Price_inr = 0 THEN '₹0'                            -- Business Question: How are products distributed across different price ranges?
		WHEN Price_inr <= 100 THEN '₹1-100'
        WHEN Price_inr <= 500 THEN '₹101-500'                   -- Business Purpose: To understand the portfolio's pricing segments.
        WHEN Price_inr <= 1000 THEN '₹501-1000'
        WHEN Price_inr <= 5000 THEN '₹1001-5000'
        ELSE 'Above ₹5000'
END AS Price_Band, COUNT(*) AS Product_Count FROM pharmaceutical_products
GROUP BY CASE
        WHEN Price_inr = 0 THEN '₹0'
        WHEN Price_inr <= 100 THEN '₹1-100'
        WHEN Price_inr <= 500 THEN '₹101-500'
        WHEN Price_inr <= 1000 THEN '₹501-1000'
        WHEN Price_inr <= 5000 THEN '₹1001-5000'
        ELSE 'Above ₹5000' END 
ORDER BY MIN(Price_inr);

/* Query 12: Top 20 Highest-Priced Products

Business Question:
Which products have the highest listed prices?

Business Purpose:
To identify products positioned at the premium
end of the dataset. */

SELECT Product_id, Brand_name, Manufacturer, Price_inr, Dosage_form, Therapeutic_class
FROM pharmaceutical_products
ORDER BY Price_inr DESC
LIMIT 20;

/* Query 13: Top Active Ingredients

Business Question:
Which active ingredients appear most frequently
in the portfolio?

Business Purpose:
To identify the most frequently represented
molecules in the dataset. */

SELECT Primary_ingredient, COUNT(*) AS Product_Count FROM pharmaceutical_products
WHERE Primary_ingredient IS NOT NULL
AND Primary_ingredient <> ''
GROUP BY Primary_ingredient
ORDER BY Product_Count DESC
LIMIT 20;


/* Query 14: Active Ingredient Count Distribution

Business Question:
How many products contain one, two, or multiple
active ingredients?

Business Purpose:
To understand the composition and complexity
of pharmaceutical formulations. */

SELECT Num_active_ingredients, COUNT(*) AS Product_Count
FROM pharmaceutical_products
GROUP BY Num_active_ingredients
ORDER BY Num_active_ingredients;

/* Query 15: Common Combination Formulations
Business Question:
Which combinations of active ingredients occur
most frequently?
Business Purpose:
To identify commonly represented combination
formulations in the portfolio. */

SELECT Active_ingredients, COUNT(*) AS Product_Count
FROM pharmaceutical_products
WHERE Num_active_ingredients > 1
  AND Active_ingredients IS NOT NULL
  AND Active_ingredients <> ''
GROUP BY Active_ingredients
ORDER BY Product_Count DESC
LIMIT 20;

/* Query 16: Ingredient and Therapeutic Analysis

Business Question:
Which active ingredients are most represented
within each therapeutic class?

Business Purpose:
To connect molecule-level composition with
therapeutic portfolio structure.*/

SELECT Therapeutic_class, Primary_ingredient, COUNT(*) AS Product_Count
FROM pharmaceutical_products
WHERE Primary_ingredient IS NOT NULL
  AND Primary_ingredient <> ''
GROUP BY Therapeutic_class, Primary_ingredient
ORDER BY Therapeutic_class, Product_Count DESC;

/*Query 17: Manufacturer Therapeutic Coverage

Business Question:
Which manufacturers have the widest therapeutic coverage?

Business Purpose:
To compare manufacturer diversification across therapeutic categories. */

SELECT Manufacturer,
COUNT(DISTINCT Therapeutic_class) AS Therapeutic_Class_Count
FROM pharmaceutical_products
WHERE Manufacturer IS NOT NULL
GROUP BY Manufacturer
ORDER BY Therapeutic_Class_Count DESC;

/* Query 18: Manufacturer Portfolio and Pricing

Business Question:
Which manufacturers combine large product portfolios
with higher average prices?

Business Purpose:
To compare portfolio breadth and pricing position together. */

SELECT Manufacturer,
COUNT(*) AS Product_Count,
ROUND(AVG(Price_inr), 2) AS Average_Price_INR
FROM pharmaceutical_products
GROUP BY Manufacturer
ORDER BY Product_Count DESC;

/* Query 19: Manufacturer Pricing Benchmark
Business Question:
How do manufacturers compare against the overall average product price?
Business Purpose:
To identify manufacturers whose average portfolio price is above or below the dataset benchmark. */

SELECT Manufacturer,ROUND(AVG(Price_inr), 2) AS Average_Price_INR,
    ROUND(
        AVG(Price_inr) -
        (SELECT AVG(Price_inr)
         FROM pharmaceutical_products),
        2
    ) AS Difference_From_Overall_Average
FROM pharmaceutical_products GROUP BY Manufacturer
ORDER BY Difference_From_Overall_Average DESC;

/*Query 20: Manufacturer by Therapeutic Portfolio

Business Question:
How many products does each manufacturer have across therapeutic classes?

Business Purpose:
To understand manufacturer presence across
different therapeutic categories. */

SELECT Manufacturer, Therapeutic_class,COUNT(*) AS Product_Count
FROM pharmaceutical_products
GROUP BY Manufacturer,Therapeutic_class
ORDER BY Manufacturer,Product_Count DESC;

/*Query 21: Manufacturer Ranking

Business Question:
How do manufacturers rank based on product portfolio size?

Business Purpose:
To benchmark manufacturers using ranking logic.*/

SELECT Manufacturer,COUNT(*) AS Product_Count,
RANK() OVER (
        ORDER BY COUNT(*) DESC
    ) AS Portfolio_Rank
FROM pharmaceutical_products
GROUP BY Manufacturer
ORDER BY Portfolio_Rank;

WITH Manufacturer_Therapy AS (                                                    -- Query 22:Top 3 Manufacturers by Therapeutic Class --
SELECT Therapeutic_class, Manufacturer, COUNT(*) AS Product_Count                 -- Business Question: --
FROM pharmaceutical_products                                                      -- Who are the top three manufacturers within each therapeutic class? --
GROUP BY Therapeutic_class, Manufacturer                                          -- Business Purpose: --
),                                                                              -- To identify leading manufacturers within individual therapeutic segments. --
Ranked_Manufacturers AS (
SELECT Therapeutic_class, Manufacturer, Product_Count,
RANK() OVER (
PARTITION BY Therapeutic_class
ORDER BY Product_Count DESC
            ) AS Manufacturer_Rank FROM Manufacturer_Therapy
)
SELECT Therapeutic_class, Manufacturer, Product_Count, Manufacturer_Rank
FROM Ranked_Manufacturers
WHERE Manufacturer_Rank <= 3 ORDER BY Therapeutic_class, Manufacturer_Rank;

/* Query 23: Products Above Average Price

Business Question:
Which products are priced above the overall portfolio average?

Business Purpose:
To identify products positioned above the dataset-wide pricing benchmark.*/

SELECT Product_id, Brand_name, Manufacturer, Price_inr, Therapeutic_class
FROM pharmaceutical_products
WHERE Price_inr > (
SELECT AVG(Price_inr)
FROM pharmaceutical_products
)
ORDER BY Price_inr DESC;

/*Query 24: Therapeutic Class Pricing Rank
Business Question:
How do therapeutic classes rank based on average product price?
Business Purpose:
To benchmark therapeutic categories based on their average pricing. */

SELECT Therapeutic_class, ROUND(AVG(Price_inr), 2) AS Average_Price_INR,
RANK() OVER (
	ORDER BY AVG(Price_inr) DESC
) AS Price_Rank
FROM pharmaceutical_products
GROUP BY Therapeutic_class
ORDER BY Price_Rank;

SELECT COUNT(*) AS Total_Products,                                    -- Query 25: Portfolio Executive Summary --
COUNT(DISTINCT Manufacturer) AS Total_Manufacturers,                  -- Business Question: --
COUNT(DISTINCT Therapeutic_class) AS Total_Therapeutic_Classes,       -- What are the key portfolio, pricing and lifecycle metrics in one summary?--
COUNT(DISTINCT Dosage_form) AS Total_Dosage_Forms,                    -- Business Purpose:--
SUM(CASE                                                              -- To create an executive-level summary of the major portfolio KPIs.--
WHEN Is_discontinued = 0 THEN 1
ELSE 0
END) AS Active_Products,
SUM(CASE
WHEN Is_discontinued = 1 THEN 1
ELSE 0
END) AS Discontinued_Products,
ROUND(AVG(Price_inr), 2) AS Average_Price_INR, MIN(Price_inr) AS Minimum_Price_INR,
MAX(Price_inr) AS Maximum_Price_INR
FROM pharmaceutical_products;