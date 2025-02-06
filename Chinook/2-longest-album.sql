--	2. What's the title of the longest album? (most minutes of music)
SELECT AlbumID, SUM(Milliseconds), Title 
	FROM Album 
	JOIN Track USING (AlbumId) 
	GROUP BY AlbumID 
	ORDER BY SUM(Milliseconds) DESC 
	LIMIT 1;
