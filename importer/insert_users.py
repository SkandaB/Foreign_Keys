import json
import MySQLdb

from slugify import slugify


usersf = open('users.txt', 'r')

conn = MySQLdb.connect('127.0.0.1', 'root', charset='utf8mb4')
conn.select_db('filedb')
conn.autocommit(True)
cursor = conn.cursor()

for line in usersf:
    user = json.loads(line)
    try:
        cursor.execute("INSERT into user (id, name, location, username, password) values (%s, %s, %s, %s, MD5(%s))",
                   (user['Id'], user['DisplayName'], user.get('Location', 'NULL'), slugify(user['DisplayName'], to_lower=True), 'password'))
    except:
        raise
        print(cursor._last_executed)

conn.close()
usersf.close()
