-- Rank artists by total sales
SELECT a.artistId, SUM(il.unitprice * quantity) AS total_sales,  
       RANK() OVER (PARTITION BY a.artistId ORDER BY SUM(il.unitprice * quantity) DESC) AS rank  
FROM Artist a  
INNER JOIN album alb ON a.ArtistId = alb.ArtistId  
INNER JOIN track t ON alb.AlbumId = t.AlbumId  
INNER JOIN InvoiceLine il ON t.TrackId = il.TrackId  
GROUP BY a.artistid;

-- Most popular genre by country using ROW_NUMBER()
SELECT c.country, g.name, COUNT(il.Quantity) AS countqty,  
       ROW_NUMBER() OVER (PARTITION BY c.country ORDER BY COUNT(il.Quantity) DESC) AS countryrow  
FROM track t  
INNER JOIN genre g ON t.GenreId = g.GenreId  
INNER JOIN InvoiceLine il ON il.TrackId = t.TrackId  
INNER JOIN invoice i ON il.InvoiceId = i.InvoiceId  
INNER JOIN customer c ON i.CustomerId = c.CustomerId  
GROUP BY c.country, g.name  
ORDER BY countqty DESC;
