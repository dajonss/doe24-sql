--	3(ENDAST MUSIK):
SELECT AlbumID, SUM(Milliseconds), MediaTypeId, Title 
	FROM Album 
	JOIN Track USING (AlbumId) 
	GROUP BY AlbumID 
	ORDER BY SUM(Milliseconds) 
	FILTER (WHERE MediaTypeID IS 1 OR 2 OR 4) ASC 
	LIMIT 1;
