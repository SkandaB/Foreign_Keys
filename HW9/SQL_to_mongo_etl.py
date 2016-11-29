import MySQLdb
import MySQLdb.cursors

from pymongo import MongoClient
mongo_client = MongoClient()
mongodb = mongo_client.foreign_keys
questions_coll = mongodb.questions
users_coll = mongodb.users


from pprint import pprint

conn = MySQLdb.connect('127.0.0.1', 'root','password', cursorclass=MySQLdb.cursors.DictCursor)
conn.select_db('filedb')
conn.autocommit(True)

def get_questions():
    cursor = conn.cursor()
    cursor.execute("""
        select
            question.id as id, question.id as _id, post_id, accepted_answer_id, user_id, body, created_timestamp
        from question, post
        where question.post_id = post.id
    """)
    res = cursor.fetchone()
    while res:
        yield res
        res = cursor.fetchone()


def get_tags(question_id):
    cursor = conn.cursor()
    cursor.execute("""
        select name
        from tag, question_tag
        where question_tag.question_id=%s and tag.id=question_tag.tag_id
    """, (question_id,))
    return [row['name'] for row in cursor.fetchall()]

def get_answers(question_id):
    cursor = conn.cursor()
    cursor.execute("""
        select answer.id as id, answer.id as _id, post_id, user_id, created_timestamp, question_id
        from answer, post
        where answer.question_id=%s and answer.post_id = post.id
    """, (question_id,))
    return cursor.fetchall()

def get_comments(post_id):
    cursor = conn.cursor()
    cursor.execute('select * from comment where post_id=%s', (post_id,))
    return cursor.fetchall()

def attach_comments(post):
    post['comments'] = get_comments(post['post_id'])
    return post

def populate_questions():
    ret = []
    for q in get_questions():
        q['tags'] = get_tags(q['id'])
        q['answers'] = [attach_comments(post) for post in get_answers(q['id'])]
        attach_comments(q)
        ret.append(q)
    return ret

def populate_users():
    cursor = conn.cursor()
    cursor.execute('select id as _id, name, username, location from user')
    return cursor.fetchall()

questions_coll.insert_many(populate_questions())
users_coll.insert_many(populate_users())
conn.close()
