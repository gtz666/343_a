SELECT 
    s.studio_id, 
    p.person_id AS manager_id,
    p.name AS manager_name,
    COUNT(DISTINCT a.album_id) AS number_of_albums_contributed
FROM 
    Studios s
JOIN 
    People p ON s.manager_id = p.person_id
LEFT JOIN 
    Sessions ss ON s.studio_id = ss.studio_id
LEFT JOIN 
    Segments sg ON ss.session_id = sg.session_id
LEFT JOIN 
    TrackSegments ts ON sg.segment_id = ts.segment_id
LEFT JOIN 
    AlbumTracks al ON ts.track_id = al.track_id
LEFT JOIN 
    Albums a ON al.album_id = a.album_id
GROUP BY 
    s.studio_id, p.person_id, p.name;


-- The Result states that the all segment recorded from PRS (studio 1)
-- is for The Awesome Album

-- No contribution for PS (studio 2)

-- ERS (Studio 3) has contribution to the Another Awesome Album