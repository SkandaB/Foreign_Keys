import MySQLdb
import time
import random
import calendar
from datetime import timedelta, date
from faker import Faker
fake = Faker()

db = MySQLdb.connect(host="127.0.0.1",    # your host, usually localhost
                     user="foreignkeys",         # your username
                     passwd="nonosql",  # your password
                     db="hw7_db")        # name of the data base

cur = db.cursor()

#Vote table
for i in range(10, 101):
    try:
        post_id = random.randint(1,350)
        user_id = random.randint(1,100)
        cur.execute('''INSERT into vote (id, user_id, post_id)
                      values ( %s, %s, %s)''',
                      (i, user_id, post_id))
        db.commit()
    except:
       db.rollback()

db.close()
