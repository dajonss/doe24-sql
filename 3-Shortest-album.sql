--3. What's the title of the shortest album? (fewest minutes of music)
SELECT AlbumID, SUM(Milliseconds), Title 
	FROM Album 
	JOIN Track USING (AlbumId) 
	GROUP BY AlbumID 
	ORDER BY SUM(Milliseconds) ASC 
	LIMIT 1;
