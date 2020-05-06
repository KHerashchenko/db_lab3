import cx_Oracle
import pandas as pd

username = 'system'
password = 'orcl'

connection = cx_Oracle.connect(username, password)

cursor = connection.cursor()


def execute_query_via_pd(query):
    SQL_Query = pd.read_sql_query(query, connection)
    return SQL_Query

def execute_query_via_cur(query):
    cursor.execute(query)
    data = pd.DataFrame(cursor.fetchall())
    return data


query1 = '''
select count(*) as num_of_songs, trim(genre_name) as genre_name
from SONGSDATA
group by genre_name
'''
print(query1)
data1 = execute_query_via_pd(query1)
print(data1)

# data = execute_query_via_cur(query1)
# data.columns = ['NUM_OF_SONGS', 'GENRE_NAME']
# print(data)


query2 = '''
select trim(artist_name) as artist_name,
    round( count(*)*100/(select count(*) from SONGSDATA), 2) as songs_percentage
from SONGSDATA
group by artist_name
'''
print(query2)
data2 = execute_query_via_pd(query2)
print(data2)

# data = execute_query_via_cur(query2)
# data.columns = ['NUM_OF_SONGS', 'GENRE_NAME']
# print(data)


query3 = '''
 select loudness, round(avg(popularity),2) as popularity
 from SONGSDATA
 group by loudness
 order by loudness
'''
print(query3)
data3 = execute_query_via_pd(query3)
print(data3)

# data = execute_query_via_cur(query3)
# data.columns = ['NUM_OF_SONGS', 'GENRE_NAME']
# print(data)

cursor.close()

connection.close()