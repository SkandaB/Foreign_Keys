import json
import MySQLdb
import dateutil.parser

from slugify import slugify


questionsf = open('questions.txt', 'r')
answersf = open('answers.txt', 'r')

post_answer = {}
post_question = {}

conn = MySQLdb.connect('127.0.0.1', 'root', charset='utf8mb4')
conn.select_db('filedb')
conn.autocommit(True)
cursor = conn.cursor()
#cursor.execute("SET unique_checks=0")
#cursor.execute("SET foreign_key_checks=0")

def insert_post(post):
    cursor.execute("INSERT into post (id, body, user_id, created_timestamp) values (%s, %s, %s, %s)",
                   (post['Id'], post['Body'], post['OwnerUserId'], dateutil.parser.parse(post['CreationDate']).strftime('%Y-%m-%d %H:%M:%S')))

def insert_question(post):
    cursor.execute("INSERT into question (post_id) values (%s)",
                   (post['Id'],))
    return cursor.lastrowid

def insert_answer(post, question_id):
    cursor.execute("INSERT into answer (post_id, question_id) values (%s, %s)",
                   (post['Id'], question_id))
    return cursor.lastrowid

for line in questionsf:
    post = json.loads(line)
    insert_post(post)
    post_question[post['Id']] = insert_question(post)

for line in answersf:
    post = json.loads(line)
    if not post_question.get(post['ParentId']):
        continue
    insert_post(post)
    post_answer[post['Id']] = insert_answer(post, post_question[post['ParentId']])

#conn.commit()
questionsf.seek(0)
# answersf.seek(0)

for line in questionsf:
    post = json.loads(line)
    if post.get("AcceptedAnswerId") and post_answer.get(post["AcceptedAnswerId"]):
        cursor.execute("UPDATE question SET accepted_answer_id=%s WHERE post_id=%s", (post_answer[post['AcceptedAnswerId']], post['Id']))

#conn.commit()
conn.close()
answersf.close()
questionsf.close()
