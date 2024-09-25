CREATE TABLE SALES_DATA(
	Region VARCHAR(50),
	Product VARCHAR(50),
	Sales_Amount INT,
	Year DATETIME
);

INSERT INTO SALES_DATA VALUES('North America', 'Watch', 1500, '2023');
INSERT INTO SALES_DATA VALUES('Europe ', 'Mobile', 1200, '2023');
INSERT INTO SALES_DATA VALUES('Asia', 'Watch', 1800, '2023');
INSERT INTO SALES_DATA VALUES('North America', 'TV', 900, '2024');
INSERT INTO SALES_DATA VALUES('Europe ', 'Watch', 2000, '2024');
INSERT INTO SALES_DATA VALUES('Asia', 'Mobile', 1000, '2024');
INSERT INTO SALES_DATA VALUES('North America', 'Mobile', 1600, '2023');
INSERT INTO SALES_DATA VALUES('Europe ', 'TV', 1500, '2023');
INSERT INTO SALES_DATA VALUES('Asia', 'TV', 1100, '2024');
INSERT INTO SALES_DATA VALUES('North America', 'Watch', 1700, '2024');

--Part – A:
--1. Display Total Sales Amount by Region.
SELECT Region,SUM(Sales_Amount) AS 'TOTAL_AMOUNT' FROM SALES_DATA
GROUP BY Region;

--2. Display Average Sales Amount by Product
SELECT Product,AVG(Sales_Amount) AS 'AVG_AMOUNT' FROM SALES_DATA
GROUP BY Product;

--3. Display Maximum Sales Amount by Year
SELECT Year,MAX(Sales_Amount) AS 'MAX_AMOUNT' FROM SALES_DATA
GROUP BY Year;

--4. Display Minimum Sales Amount by Region and Year
SELECT Region,Year, MIN(Sales_Amount) AS 'MIN_AMOUNT' FROM SALES_DATA
GROUP BY Region , Year;

--5. Count of Products Sold by Region
SELECT Region,COUNT(Product) AS 'COUNT_PRODUCT' FROM SALES_DATA
GROUP BY Region;

--6. Display Sales Amount by Year and Product
SELECT Year,Region,SUM(Sales_Amount) AS 'TOTAL_AMOUNT' FROM SALES_DATA
GROUP BY Year,Region;

--7. Display Regions with Total Sales Greater Than 5000
SELECT Region,SUM(Sales_Amount) AS 'TOTAL_AMOUNT' FROM SALES_DATA
GROUP BY Region
HAVING SUM(Sales_Amount)>5000;

--8. Display Products with Average Sales Less Than 10000
SELECT Product,AVG(Sales_Amount) AS 'AVG_AMOUNT' FROM SALES_DATA
GROUP BY Product
HAVING AVG(Sales_Amount)>1000;

--9. Display Years with Maximum Sales Exceeding 500
SELECT Year,MIN(Sales_Amount) AS 'MIN_AMOUNT' FROM SALES_DATA
GROUP BY Year
HAVING MIN(Sales_Amount)>500;

--10. Display Regions with at Least 3 Distinct Products Sold.
SELECT Region,COUNT(DISTINCT Product) AS 'TOTAL_PRODUCT' FROM SALES_DATA
GROUP BY Region
HAVING COUNT(DISTINCT Product)>=3;

--11. Display Years with Minimum Sales Less Than 1000
SELECT Year,MIN(Sales_Amount) AS 'MAX_AMOUNT' FROM SALES_DATA
GROUP BY Year
HAVING MIN(Sales_Amount)>1000;

--12. Display Total Sales Amount by Region for Year 2023, Sorted by Total Amount
SELECT Region,SUM(Sales_Amount) AS 'TOTAL_AMOUNT' FROM SALES_DATA
WHERE Year='2023'
GROUP BY Region
ORDER BY SUM(Sales_Amount);


--Part – B:
--1. Display Count of Orders by Year and Region, Sorted by Year and Region
SELECT Region,Year, COUNT(Product) AS 'TOTAL_PRODUCT' FROM SALES_DATA
GROUP BY Region , Year
ORDER BY Region , Year;

--2. Display Regions with Maximum Sales Amount Exceeding 1000 in Any Year, Sorted by Region
SELECT Region, MIN(Sales_Amount) AS 'MIN_AMOUNT' FROM SALES_DATA
GROUP BY Region 
HAVING MIN(Sales_Amount)>1000
ORDER BY Region;


--3. Display Years with Total Sales Amount Less Than 1000, Sorted by Year Descending
SELECT Year, SUM(Sales_Amount) AS 'MIN_AMOUNT' FROM SALES_DATA
GROUP BY Year 
HAVING SUM(Sales_Amount)>1000
ORDER BY Year DESC;

--4. Display Top 3 Regions by Total Sales Amount in Year 2024
SELECT TOP 3 Region, SUM(Sales_Amount) AS 'TOTAL_AMOUNT' FROM SALES_DATA
WHERE Year='2024'
GROUP BY Region;


--Part – C:
--1. Display Products with Average Sales Amount Between 1000 and 2000, Ordered by Product Name
SELECT Product, AVG(Sales_Amount) AS 'AVG_AMOUNT' FROM SALES_DATA
GROUP BY Product 
HAVING AVG(Sales_Amount)<2000 AND AVG(Sales_Amount)>1000
ORDER BY Product;

--2. Display Years with More Than 5 Orders from Each Region
SELECT Year,Region, COUNT(Product) AS 'TOTAL_PRODUCT' FROM SALES_DATA
GROUP BY Year, Region
HAVING COUNT(Product)<5;

--3. Display Regions with Average Sales Amount Above 1500 in Year 2023 sort by amount in descending.
SELECT Region, AVG(Sales_Amount) AS 'AVG_AMOUNT' FROM SALES_DATA
WHERE Year='2023'
GROUP BY Region 
HAVING AVG(Sales_Amount)>1500
ORDER BY AVG(Sales_Amount) DESC ;

--4. Find out region wise duplicate product.
SELECT Region,Product, COUNT(Product) AS 'DUPLICATE_PRODUCT' FROM SALES_DATA
GROUP BY Region,Product
HAVING COUNT(Product)>1;

--5. Find out region wise highest sales amount.
SELECT Region,MAX(Sales_Amount) AS 'MAX_AMOUNT' FROM SALES_DATA
GROUP BY Region 