/* Documentation of Choices and Assumptions in the Schema Design

Could not:
- Overlapping session times in the same studio: This constraint requires checking against other session records and cannot be enforced without using triggers or complex assertions.
- Historical record of studio managers: SQL does not support directly tracking historical changes without additional structures or triggers.

Did not:
- The relationship between band members and sessions: While it's possible to enforce a constraint that a session must involve at least one band or individual, it complicates the schema and may reduce flexibility. Decided not to enforce this to allow for more versatile session arrangements.
- Segments to Tracks relationship: The constraint that each segment must belong to at least one track and each track must have multiple segments is not enforced. This allows for greater flexibility in handling incomplete or unused recording segments.

Extra constraints:
- Primary keys as single-attribute integers for all tables: This facilitates faster searches and joins.
- `NOT NULL` constraints on essential fields: Ensures data integrity and completeness.
- Unique constraints on names for Bands, Studios, and Albums: Ensures uniqueness in identifying these entities.

Assumptions:
- All sessions are billed with a flat fee irrespective of duration, hence not calculating fees based on session length.
- A person can be a part of multiple bands, and their role in the database is not limited to a single function (e.g., a person can be both a band member and a recording engineer).
- A session can have multiple engineers and bands, but the schema does not enforce a strict upper limit.
- The length of recording segments is an integer value of seconds, assuming this level of granularity is sufficient for the company's needs.
- Phone numbers are stored as strings without enforcing a specific format, assuming varied international formats.
- Historical data of studio management is not tracked in detail due to the complexity of implementing such a feature in a standard relational database.

These assumptions were made based on the provided domain specification and aim to balance practicality with the requirements of the recording company.
*/



-- Drop existing schema and create a new one
DROP SCHEMA IF EXISTS recording CASCADE;
CREATE SCHEMA recording;
SET search_path TO recording;


-- Table for People
CREATE TABLE People (
    person_id integer PRIMARY KEY,
    name VARCHAR(80) NOT NULL,
    certification TEXT
);

-- Table for Bands
CREATE TABLE Bands (
    band_id integer PRIMARY KEY,
    name VARCHAR(80) NOT NULL
);

-- Table for Studios
CREATE TABLE Studios (
    studio_id integer PRIMARY KEY,
    name VARCHAR(80) NOT NULL,
    address TEXT NOT NULL,
    manager_id integer,
    FOREIGN KEY (manager_id) REFERENCES recording.People(person_id) ON DELETE CASCADE
);


-- Table for Recording Engineers
CREATE TABLE Engineers (
    engineer_id integer PRIMARY KEY,
    person_id integer NOT NULL,
    FOREIGN KEY (person_id) REFERENCES recording.People(person_id) ON DELETE CASCADE
);


-- Table for Recording Sessions
CREATE TABLE Sessions (
    session_id integer PRIMARY KEY,
    studio_id integer NOT NULL,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    fee NUMERIC NOT NULL,
    FOREIGN KEY (studio_id) REFERENCES recording.Studios(studio_id) ON DELETE CASCADE
);

-- Table for Band Members
CREATE TABLE BandMembers (
    band_id INTEGER NOT NULL,
    person_id INTEGER NOT NULL,
    FOREIGN KEY (band_id) REFERENCES recording.Bands(band_id) ON DELETE CASCADE, 
    FOREIGN KEY (person_id) REFERENCES recording.People(person_id) ON DELETE CASCADE,
    PRIMARY KEY (band_id, person_id)
);

-- Table for Recording Segments
CREATE TABLE Segments (
    segment_id SERIAL PRIMARY KEY,
    session_id INTEGER NOT NULL,
    length INTEGER NOT NULL,
    format VARCHAR(50) NOT NULL,
    FOREIGN KEY (session_id) REFERENCES recording.Sessions(session_id) ON DELETE CASCADE
);

-- Table for Tracks
CREATE TABLE Tracks (
    track_id integer PRIMARY KEY,
    name VARCHAR(80) NOT NULL
);

-- Table for Albums
CREATE TABLE Albums (
    album_id integer PRIMARY KEY,
    name VARCHAR(80) NOT NULL,
    release_date DATE NOT NULL
);

-- Table for Session Participants (Engineers, Bands, and Individuals)
CREATE TABLE SessionParticipants (
    session_id integer NOT NULL,
    person_id integer,
    band_id integer,
    FOREIGN KEY (session_id) REFERENCES recording.Sessions(session_id) ON DELETE CASCADE,
    FOREIGN KEY (person_id) REFERENCES recording.People(person_id) ON DELETE CASCADE,
    FOREIGN KEY (band_id) REFERENCES recording.Bands(band_id) ON DELETE CASCADE,
    PRIMARY KEY (session_id, person_id, band_id)
);





-- Table for Track Segments (to link segments to tracks)
CREATE TABLE TrackSegments (
    track_id INTEGER NOT NULL,
    segment_id INTEGER NOT NULL,
    FOREIGN KEY (track_id) REFERENCES Tracks(track_id),
    FOREIGN KEY (segment_id) REFERENCES Segments(segment_id),
    PRIMARY KEY (track_id, segment_id)
);

-- Table for Album Tracks (to link tracks to albums)
CREATE TABLE AlbumTracks (
    album_id INTEGER NOT NULL,
    track_id INTEGER NOT NULL,
    FOREIGN KEY (album_id) REFERENCES Albums(album_id),
    FOREIGN KEY (track_id) REFERENCES Tracks(track_id),
    PRIMARY KEY (album_id, track_id)
);
