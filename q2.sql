SELECT 
    p.person_id,
    p.name,
    COUNT(DISTINCT COALESCE(sp.session_id, sp_band.session_id)) AS session_count
FROM 
    People p
LEFT JOIN 
    SessionParticipants sp ON p.person_id = sp.person_id
LEFT JOIN 
    BandMembers bm ON p.person_id = bm.person_id
LEFT JOIN 
    SessionParticipants sp_band ON bm.band_id = sp_band.band_id
GROUP BY 
    p.person_id;
