-- Extract year, month, day
SELECT YEAR(InvoiceDate) AS year, MONTH(InvoiceDate) AS month, DAY(InvoiceDate) AS day  
FROM invoice;

-- Calculate days since invoice
SELECT InvoiceId, DATEDIFF(DAY, InvoiceDate, GETDATE()) AS days_since_invoice  
FROM invoice;

-- Monthly sales trend
SELECT DATENAME(YEAR, InvoiceDate) AS year, DATENAME(MONTH, InvoiceDate) AS month,  
       SUM(total) AS monthlysales  
FROM invoice  
GROUP BY DATENAME(YEAR, InvoiceDate), DATENAME(MONTH, InvoiceDate)  
ORDER BY year, month;
