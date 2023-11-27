WITH SessionLengths AS (
    SELECT 
        ss.session_id, 
        SUM(sg.length) AS total_length
    FROM 
        Sessions ss
    JOIN 
        Segments sg ON ss.session_id = sg.session_id
    GROUP BY 
        ss.session_id
),
MaxSession AS (
    SELECT 
        session_id
    FROM 
        SessionLengths
    ORDER BY 
        total_length DESC
    LIMIT 1
)
SELECT 
    p.person_id, 
    p.name
FROM 
    SessionParticipants sp
JOIN 
    People p ON sp.person_id = p.person_id
WHERE 
    sp.session_id IN (SELECT session_id FROM MaxSession);
