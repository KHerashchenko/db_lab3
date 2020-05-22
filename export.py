import cx_Oracle
import csv
import pandas as pd

username = 'system'
password = 'orcl'

connection = cx_Oracle.connect(username, password)

cursor = connection.cursor()

tables = ['genres', 'artists', 'songsartists', 'songs']

for table in tables:
    query = "SELECT * FROM {}".format(table)
    cursor.execute(query)
    headers = [header[0] for header in cursor.description]
    data = [row for row in cursor]
    df = pd.DataFrame(data=data, columns=headers)

    df.to_csv('{}.csv'.format(table), index=False, header=True)

cursor.close()
connection.close()
