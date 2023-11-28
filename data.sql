-- Insert data for People
-- Managers, Recording Engineers, Band Members
INSERT INTO People (person_id, name, certification) VALUES 
(1233, 'Donna Meagle', NULL),
(1234, 'Tom Haverford', NULL),
(1231, 'April Ludgate', NULL),
(1232, 'Leslie Knope', NULL),
(5678, 'Ben Wyatt',  'ABCDEFGH-123I; JKLMNOPQ-456R'),
(9942, 'Ann Perkins', 'SOUND-123-AUDIO'),
(6521, 'Chris Traeger', NULL),
(6754, 'Andy Dwayer', NULL),
(4523, 'Andrew Burlinson', NULL),
(2224, 'Michael Change', NULL),
(7832, 'James Pierson', NULL),
(1000, 'Duke Silver', NULL);

-- Insert data for Studios
INSERT INTO Studios (studio_id, name, address, manager_id) VALUES 
(1, 'Pawnee Recording Studio', '123 Valley spring lane, Pawnee, Indiana', 1233),
(2, 'Pawnee Sound', '353 Western Ave, Pawnee, Indiana', 1233),
(3, 'Eagleton Recording Studio', '829 Division, Eagleton, Indiana', 1232);



-- Insert data for Bands and Band Members
INSERT INTO Bands (band_id, name) VALUES 
(1, 'Mouse Rat');

INSERT INTO BandMembers (band_id, person_id) VALUES 
(1, 6754), (1, 4523), (1, 2224), (1, 7832);

-- Insert data for Recording Sessions
INSERT INTO Sessions (session_id, studio_id, start_time, end_time, fee) VALUES 
(10001, 1, '2023-01-08 10:00:00', '2023-01-08 15:00:00', 1500),
(10002, 1, '2023-01-10 13:00:00', '2023-01-11 14:00:00', 1500),
(10003, 1, '2023-01-12 18:00:00', '2023-01-13 20:00:00', 1500),
(10004, 1, '2023-03-10 11:00:00', '2023-03-10 23:00:00', 2000).
(10005, 1, '2023-03-11 13:00:00', '2023-03-11 15:00:00', 2000),
(10006, 1, '2023-03-13 19:00:00', '2023-03-13 20:00:00', 1000),
(10007, 3, '2023-09-25 11:00:00', '2023-09-26 23:00:00', 1000),
(10008, 3, '2023-09-29 11:00:00', '2023-09-30 23:00:00', 1000);

INSERT INTO SessionParticipants (session_id, person_id, band_id) VALUES 
(10001, 1000, 1),
(10002, 1000, 1),
(10003, 1000, 1),
(10004, NULL, 1),
(10005, NULL, 1),
(10006, 6754, NULL),
(10006, 1234, NULL),
(10007, 6754, NULL),
(10008, 6754, NULL);


-- Insert data for Recording Segments
-- Segment IDs and lengths are examples
INSERT INTO Segments (segment_id, session_id, length, format) VALUES 
-- BAND 1500
(1, 10001, 60, 'WAV'),
(2, 10001, 60, 'WAV'),
(3, 10001, 60, 'WAV'),
(4, 10001, 60, 'WAV'),
(5, 10001, 60, 'WAV'),
(6, 10001, 60, 'WAV'),
(7, 10001, 60, 'WAV'),
(8, 10001, 60, 'WAV'),
(9, 10001, 60, 'WAV'),
(10, 10001, 60, 'WAV'),

-- 5,000 candle *5
(11, 10002, 60, 'WAV'),
(12, 10002, 60, 'WAV'),
(13, 10002, 60, 'WAV'),
(14, 10002, 60, 'WAV'),
(15, 10002, 60, 'WAV'),

-- Catch *4
(16, 10003, 60, 'WAV'),
(17, 10003, 60, 'WAV'),
(18, 10003, 60, 'WAV'),
(19, 10003, 60, 'WAV'),

-- BAND 2000
-- Catch *2
(20, 10004, 120, 'WAV'),
(21, 10004, 120, 'WAV'),
-- 10005 NO SEGMENT

-- ANDY 1000 1
-- 5000 Candle and Catch * 5
(22, 10006, 60, 'WAV'),
(23, 10006, 60, 'WAV'),
(24, 10006, 60, 'WAV'),
(25, 10006, 60, 'WAV'),
(26, 10006, 60, 'WAV'),

-- ANDY 1000 3
-- first 5 no use
(27, 10007, 180, 'AIFF'),
(28, 10007, 180, 'AIFF'),
(29, 10007, 180, 'AIFF'),
(30, 10007, 180, 'AIFF'),
(31, 10007, 180, 'AIFF'),
-- May Song * 2
(32, 10007, 180, 'AIFF'),
(33, 10007, 180, 'AIFF'),
-- The Pit * 2
(34, 10007, 180, 'AIFF'),
(35, 10007, 180, 'AIFF'),
-- Remeber * 2
(36, 10008, 180, 'WAV'),
(37, 10008, 180, 'WAV'),
--The Way * 2
(38, 10008, 180, 'WAV'),
(39, 10008, 180, 'WAV'),
-- Another * 2
(40, 10008, 180, 'WAV'),
(41, 10008, 180, 'WAV');

-- Insert data for Tracks
INSERT INTO Tracks (track_id, name) VALUES 
-- 5000 1
(1, '5,000 Candles in the Wind'),

-- Catch 1
(2, 'Catch Your Dream'),

-- May Song 2
(3, 'May Song'),

-- The Pit 2
(4, 'The Pit'),

-- Remember 2
(5, 'Remember'),

-- The Way 2
(6, 'The Way You Look Tonight'),

-- Another 2
(7, 'Another Song');

-- Insert data for Albums
INSERT INTO Albums (album_id, name, release_date) VALUES 
(1, 'The Awesome Album', '2023-05-25'),
(2, 'Another Awesome Album', '2023-10-29');


-- Linking Tracks to Albums
INSERT INTO AlbumTracks (album_id, track_id) VALUES 
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7);

-- Linking Segments to Tracks
INSERT INTO TrackSegments (track_id, segment_id) VALUES 
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),

(2, 16),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(2, 25),
(2, 26),

(3, 32),
(3, 33),

(4, 34),
(4, 35),

(5, 36),
(5, 37),

(6, 38),
(6, 39),

(7, 40),
(7, 41);
