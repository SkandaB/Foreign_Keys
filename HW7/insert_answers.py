import MySQLdb
import time
import random
import calendar
from datetime import timedelta, date
from faker import Faker
fake = Faker()

db = MySQLdb.connect(host="127.0.0.1",    # your host, usually localhost
                     user="root",         # your username
                     db="hw7_db")        # name of the data base

cur = db.cursor()

questions_with_accepted_answers = set()


for i in range(6, 340):
    flag = False
    while flag == False:
        try:
            question_id = random.randint(1,39)
            post_id = random.randint(1,350)
            accepted = random.randint(1,100)
            if(post_id % 10 != 0):
                if accepted > 55 and question_id not in questions_with_accepted_answers:
                    accepted = 1
                    questions_with_accepted_answers.add(question_id)
                else:
                    accepted = 0
                body = fake.sentence(nb_words=5, variable_nb_words=True)
                #SQL query to INSERT a record into the table FACTRESTTBL.
                cur.execute('''INSERT into answer (id, post_id, question_id, accepted)
                            values ( %s, %s, %s, %s)''',
                            (i, post_id, question_id, accepted))
                db.commit()
                print "inserted", i
                flag = True
        except:
            db.rollback()
