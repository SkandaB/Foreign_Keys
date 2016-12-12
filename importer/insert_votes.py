import json
import MySQLdb

from slugify import slugify


votesf = open('votes.txt', 'r')

conn = MySQLdb.connect('127.0.0.1', 'root')
conn.select_db('filedb')
conn.autocommit(True)
cursor = conn.cursor()

for line in votesf:
    vote = json.loads(line)
    try:
        cursor.execute("INSERT into vote (user_id, post_id) values (%s, %s)",
                   (vote['UserId'], vote['PostId']))
    except:
        print(cursor._last_executed)
        raise

conn.close()
votesf.close()
