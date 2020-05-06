CREATE OR REPLACE VIEW SONGSDATA AS
    SELECT
        ARTISTS.name as artist_name,
        GENRES.name as genre_name,
        SONGS.title,
        SONGS.popularity,
        SONGS.loudness
    FROM
        GENRES
    JOIN
        SONGS
        ON GENRES.genre_id = SONGS.genre_id
    JOIN
        SONGSARTISTS
        ON SONGSARTISTS.song_id = SONGS.song_id
    JOIN
        ARTISTS
        ON ARTISTS.artist_id = SONGSARTISTS.artist_id;