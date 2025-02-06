	--2(ENDAST MUSIK):
SELECT AlbumID, SUM(Milliseconds), MediaTypeId, Title 
	FROM Album 
	JOIN Track USING (AlbumId) 
	GROUP BY AlbumID 
	ORDER BY SUM(Milliseconds) 
	FILTER (WHERE MediaTypeID IS NOT 3) DESC 
	LIMIT 1;
