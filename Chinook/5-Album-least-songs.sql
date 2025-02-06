--	5. What's the title of the album with the fewest songs?
SELECT AlbumID, COUNT(TrackId), Title 
	FROM Album 
	JOIN Track USING (AlbumId) 
	GROUP BY AlbumID 
	ORDER BY COUNT(TrackID) ASC 
	LIMIT 1;
