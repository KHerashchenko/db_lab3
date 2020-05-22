import cx_Oracle
import pandas as pd

username = 'system'
password = 'orcl'

connection = cx_Oracle.connect(username, password)

cursor = connection.cursor()

data = pd.read_csv('top50_clear.csv', delimiter=',',encoding='latin-1')
print(data.head())
print(data.columns)
genres_id = {}
for i,genre in enumerate(data["Genre"].unique()):
    genres_id[genre] = i
    query = "INSERT INTO Genres(genre_id, name) VALUES({}, '{}')".format(i+4, genre)
    cursor.execute(query)
    connection.commit()
    print(query)
print(genres_id)

for i, artist in enumerate(data["Artist.Name"].unique()):
    query = "INSERT INTO Artists(artist_id, name) VALUES({}, '{}')".format(i+4, artist)
    cursor.execute(query)
    connection.commit()
    print(query)
import numpy as np

for song in np.array(data[['Track.Name', 'Genre','Beats.Per.Minute',
       'Energy', 'Danceability', 'Loudness', 'Liveness', 'Valence', 'Length',
       'Acousticness', 'Speechiness', 'Popularity','Id']]):
    Track = song[0]
    Genre = song[1]
    Genre_id = genres_id[Genre]
    Beats = song[2]
    Energy = song[3]
    Danceability = song[4]
    Loudness = song[5]
    Liveness = song[6]
    Valence = song[7]
    Length = song[8]
    Acousticness = song[9]
    Speechiness = song[10]
    Popularity = song[11]
    id = song[12]
    query = """INSERT INTO Songs(song_id,title,genre_id,beats_per_min,energy,danceability,
    loudness,liveness,valence,length,acousticness,speechiness,popularity)
     VALUES({}, '{}',{},{},{},{},{},{},{},{},{},{},{})""".format(id, Track,Genre_id+1,Beats,Energy,Danceability,Loudness,Liveness,Valence,Length,Acousticness,
                                Speechiness,Popularity)
    print(query)
    cursor.execute(query)
    connection.commit()
    print(query)

import random
for song in range(6,27):
    query = "INSERT INTO SongsArtists(artist_id, song_id) VALUES({}, {})".format(song, random.randint(1,24))
    cursor.execute(query)
    connection.commit()
    print(query)

cursor.close()

connection.close()
