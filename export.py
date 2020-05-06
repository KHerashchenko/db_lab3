import cx_Oracle
import csv

username = 'system'
password = 'orcl'

connection = cx_Oracle.connect(username, password)

cursor = connection.cursor()

tables = ['genres', 'artists', 'songsartists', 'songs']

for table in tables:

    with open("{}.csv".format(table), 'w', newline="") as f:
        query = "SELECT * FROM {}".format(table)
        cursor.execute(query)

        headers = list(map(lambda header: header[0], cursor.description))
        csv_write = csv.writer(f, delimiter = ',')

        csv_write.writerow(headers)

        for row_result in cursor:
            csv_write.writerow(row_result)

cursor.close()
connection.close()