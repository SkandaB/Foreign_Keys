import json
import MySQLdb
import dateutil.parser

from slugify import slugify


commentsf = open('comments.txt', 'r')

conn = MySQLdb.connect('127.0.0.1', 'root', charset='utf8mb4')
conn.select_db('filedb')
conn.autocommit(True)
cursor = conn.cursor()

def insert_comment(comment):
    try:
        cursor.execute("INSERT into comment (post_id, user_id, body, created_timestamp) values (%s, %s, %s, %s)",
                   (comment['PostId'], comment['UserId'], comment['Text'], dateutil.parser.parse(comment['CreationDate']).strftime('%Y-%m-%d %H:%M:%S')))
    except MySQLdb.Error, e:
        if e[0] != 1452:
            raise

for line in commentsf:
    comment = json.loads(line)
    insert_comment(comment)

conn.close()
commentsf.close()
