DECLARE

    rows_count INT NOT NULL DEFAULT 3;
    
    TYPE arr_names IS VARRAY(5) OF ARTISTS.name%TYPE;

    artists_names arr_names := arr_names();

BEGIN

    artists_names := arr_names('Alex Clare', 'Two feet', 'aiwake', 'Shawn Mendes', 'Anuel AA');
    
    FOR name in 1..rows_count LOOP
    
        INSERT INTO Artists(name)
        VALUES(artists_names(name));
    
    END LOOP;

END;