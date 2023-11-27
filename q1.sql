SELECT 
    s.studio_id, 
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
    AlbumTracks at ON ts.track_id = at.track_id
LEFT JOIN 
    Albums a ON at.album_id = a.album_id
GROUP BY 
    s.studio_id, p.name;
