--	4. What's the title of the album with the most songs?
SELECT AlbumID, COUNT(TrackId), Title 
	FROM Album 
	JOIN Track USING (AlbumId) 
	GROUP BY AlbumID 
	ORDER BY COUNT(TrackID) DESC 
	LIMIT 1;
