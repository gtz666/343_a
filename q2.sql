SELECT 
    p.person_id,
    p.name,
    COUNT(DISTINCT sp.session_id) AS session_count
FROM 
    People p
LEFT JOIN 
    SessionParticipants sp ON p.person_id = sp.person_id
GROUP BY 
    p.person_id;
