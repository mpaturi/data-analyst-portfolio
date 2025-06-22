-- Top 10 countries with the most customers
SELECT TOP 10 country, COUNT(CustomerId) AS countcountry  
FROM customer  
GROUP BY country  
ORDER BY countcountry DESC;

-- Total revenue by each customer
SELECT c.CustomerId, SUM(total) AS invtotal  
FROM Customer c  
INNER JOIN invoice i ON c.CustomerId = i.CustomerId  
GROUP BY c.CustomerId  
ORDER BY invtotal DESC;

-- Employee with the most customers assigned
SELECT TOP 1 employeeid, COUNT(customerid) AS numcust  
FROM employee e  
INNER JOIN customer c ON e.EmployeeId = c.SupportRepId  
GROUP BY employeeid  
ORDER BY numcust DESC;
