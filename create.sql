-- Generated by Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   at:        2020-05-06 15:52:23 EEST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE TABLE artists (
    artist_id  INTEGER NOT NULL AUTO_INCREMENT,
    name       CHAR(20)
)
LOGGING;

ALTER TABLE artists ADD CONSTRAINT artist_pk PRIMARY KEY ( artist_id );

CREATE TABLE genres (
    genre_id  INTEGER NOT NULL AUTO_INCREMENT,
    name      CHAR(20)
)
LOGGING;

ALTER TABLE genres ADD CONSTRAINT genre_pk PRIMARY KEY ( genre_id );

ALTER TABLE genres ADD CONSTRAINT genres__un UNIQUE ( name );

CREATE TABLE songs (
    song_id        INTEGER NOT NULL AUTO_INCREMENT,
    title          CHAR(20),
    genre_id       INTEGER NOT NULL,
    beats_per_min  INTEGER DEFAULT 0,
    energy         INTEGER DEFAULT 0,
    danceability   INTEGER DEFAULT 0,
    loudness       INTEGER DEFAULT 0,
    liveness       INTEGER DEFAULT 0,
    valence        INTEGER DEFAULT 0,
    length         INTEGER DEFAULT 0,
    acousticness   INTEGER DEFAULT 0,
    speechiness    INTEGER DEFAULT 0,
    popularity     INTEGER DEFAULT 0
)
LOGGING;

ALTER TABLE songs ADD CONSTRAINT song_pk PRIMARY KEY ( song_id );

CREATE TABLE songsartists (
    artist_id  INTEGER NOT NULL,
    song_id    INTEGER NOT NULL
)
LOGGING;

ALTER TABLE songsartists ADD CONSTRAINT song_artist_pk PRIMARY KEY ( artist_id,
                                                                     song_id );

ALTER TABLE songs
    ADD CONSTRAINT songs_genres_fk FOREIGN KEY ( genre_id )
        REFERENCES genres ( genre_id )
    NOT DEFERRABLE;

ALTER TABLE songsartists
    ADD CONSTRAINT songsartists_artists_fk FOREIGN KEY ( artist_id )
        REFERENCES artists ( artist_id )
    NOT DEFERRABLE;

ALTER TABLE songsartists
    ADD CONSTRAINT songsartists_songs_fk FOREIGN KEY ( song_id )
        REFERENCES songs ( song_id )
    NOT DEFERRABLE;



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             0
-- ALTER TABLE                              8
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
