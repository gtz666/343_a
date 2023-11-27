-- Insert data for Studios
INSERT INTO Studios (name, address, manager_id) VALUES 
('Pawnee Recording Studio', '123 Valley spring lane, Pawnee, Indiana', 1233),
('Pawnee Sound', '353 Western Ave, Pawnee, Indiana', 1233),
('Eagleton Recording Studio', '829 Division, Eagleton, Indiana', 1232);

-- Insert data for People
-- Managers, Recording Engineers, Band Members
INSERT INTO People (person_id, name, email, phone, certification) VALUES 
(1233, 'Donna Meagle', 'dmeagle@email.com', '123-456-7890', NULL),
(1234, 'Tom Haverford', 'thaverford@email.com', '123-456-7891', NULL),
(1231, 'April Ludgate', 'aludgate@email.com', '123-456-7892', NULL),
(1232, 'Leslie Knope', 'lknope@email.com', '123-456-7893', NULL),
(5678, 'Ben Wyatt', 'bwyatt@email.com', '123-456-7894', 'ABCDEFGH-123I; JKLMNOPQ-456R'),
(9942, 'Ann Perkins', 'aperkins@email.com', '123-456-7895', 'SOUND-123-AUDIO'),
(6521, 'Chris Traeger', 'ctraeger@email.com', '123-456-7896', NULL);

-- Insert data for Bands and Band Members
INSERT INTO Bands (band_id, name) VALUES 
(1, 'Mouse Rat');

INSERT INTO BandMembers (band_id, person_id) VALUES 
(1, 6754), (1, 4523), (1, 2224), (1, 7832);

-- Insert data for Recording Sessions
-- Note: Session IDs, Dates, and Times are examples
INSERT INTO Sessions (studio_id, start_time, end_time, fee) VALUES 
(1, '2023-01-08 10:00:00', '2023-01-08 15:00:00', 1500),
(1, '2023-01-10 13:00:00', '2023-01-11 14:00:00', 1500),
(1, '2023-01-12 18:00:00', '2023-01-13 20:00:00', 1500),
(2, '2023-01-15 09:00:00', '2023-01-15 17:00:00', 2000),
(3, '2023-01-20 11:00:00', '2023-01-20 19:00:00', 2500);

INSERT INTO SessionParticipants (session_id, person_id, band_id) VALUES 
(1, 1234, 1), -- Engineer and Band
(2, 1231, NULL), -- Engineer only
(3, NULL, 1); -- Band only

-- Insert data for Recording Segments
-- Segment IDs and lengths are examples
INSERT INTO Segments (session_id, length, format) VALUES 
(1, 120, 'WAV'),
(1, 200, 'MP3'),
(2, 300, 'WAV'),
(3, 400, 'MP3');

-- Insert data for Tracks
INSERT INTO Tracks (track_id, name) VALUES 
(1, 'Catch Your Dream'),
(2, 'The Pit');

-- Insert data for Albums
INSERT INTO Albums (album_id, name, release_date) VALUES 
(1, 'Songs of Pawnee', '2023-02-01'),
(2, 'Eagleton Unplugged', '2023-03-10');

-- Linking Tracks to Albums
INSERT INTO AlbumTracks (album_id, track_id) VALUES 
(1, 1),
(1, 2),
(2, 1);

-- Linking Segments to Tracks
INSERT INTO TrackSegments (track_id, segment_id) VALUES 
(1, 1),
(1, 2),
(2, 3),
(2, 4);

