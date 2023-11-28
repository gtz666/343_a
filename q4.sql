WITH AlbumSessions AS (
    SELECT 
        a.album_id, 
        a.name AS album_name,
        COUNT(DISTINCT sg.session_id) AS session_count
    FROM 
        Albums a
    JOIN 
        AlbumTracks at ON a.album_id = at.album_id
    JOIN 
        Tracks t ON at.track_id = t.track_id
    JOIN 
        TrackSegments ts ON t.track_id = ts.track_id
    JOIN 
        Segments sg ON ts.segment_id = sg.segment_id
    GROUP BY 
        a.album_id
),
MaxSessionsAlbum AS (
    SELECT 
        album_id, 
        album_name, 
        session_count
    FROM 
        AlbumSessions
    ORDER BY 
        session_count DESC
    LIMIT 1
),
PeopleInAlbum AS (
    SELECT 
        DISTINCT sp.person_id
    FROM 
        SessionParticipants sp
    JOIN 
        Segments sg ON sp.session_id = sg.session_id
    JOIN 
        TrackSegments ts ON sg.segment_id = ts.segment_id
    JOIN 
        AlbumTracks at ON ts.track_id = at.track_id
    WHERE 
        at.album_id IN (SELECT album_id FROM MaxSessionsAlbum)
    UNION
    SELECT 
        DISTINCT bm.person_id
    FROM 
        BandMembers bm
    JOIN 
        SessionParticipants sp ON bm.band_id = sp.band_id
    JOIN 
        Segments sg ON sp.session_id = sg.session_id
    JOIN 
        TrackSegments ts ON sg.segment_id = ts.segment_id
    JOIN 
        AlbumTracks at ON ts.track_id = at.track_id
    WHERE 
        at.album_id IN (SELECT album_id FROM MaxSessionsAlbum)
)
SELECT 
    m.album_id, 
    m.album_name, 
    m.session_count, 
    COUNT(p.person_id) AS unique_participant_count
FROM 
    MaxSessionsAlbum m
LEFT JOIN 
    PeopleInAlbum p ON m.album_id = (SELECT album_id FROM MaxSessionsAlbum WHERE album_id = m.album_id)
GROUP BY 
    m.album_id, m.album_name, m.session_count;
