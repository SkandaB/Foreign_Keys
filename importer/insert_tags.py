import json
import MySQLdb
import dateutil.parser

from slugify import slugify


postsf = open('questions.txt', 'r')

tags = {
}

last_tag = 0

conn = MySQLdb.connect('127.0.0.1', 'root')
conn.select_db('filedb')
conn.autocommit(True)
cursor = conn.cursor()

def add_tag_to_question(question, tag):
    pass

def insert_tag(comment):
    try:
        cursor.execute("INSERT into comment (post_id, user_id, body, created_timestamp) values (%s, %s, %s, %s)",
                   (comment['PostId'], comment['UserId'], comment['Text'], dateutil.parser.parse(comment['CreationDate']).strftime('%Y-%m-%d %H:%M:%S')))
    except MySQLdb.Error, e:
        if e[0] != 1452:
            raise

def get_tags(text):
    return text[1:-1].split('><')

def add_tag(tag):
    global last_tag
    if tag in tags:
        return tags[tag]
    last_tag += 1
    tags[tag] = last_tag
    cursor.execute("INSERT INTO tag (id, name) values (%s, %s)", (tags[tag], tag))
    return tags[tag]

def get_tag_ids(post):
    if post.get('Tags'):
        return [add_tag(tag) for tag in get_tags(post.get('Tags'))]
    return []

def get_question_id_from_post(post):
    cursor.execute('select id from question where post_id=%s', (post['Id'], ))
    return cursor.fetchone()[0]

def add_question_tags(post, tag_ids):
    question_id = get_question_id_from_post(post)
    for tag_id in tag_ids:
        cursor.execute('insert into question_tag (question_id, tag_id) values (%s, %s)', (question_id, tag_id))

for line in postsf:
    post = json.loads(line)
    tag_ids = get_tag_ids(post)
    add_question_tags(post, tag_ids)

conn.close()
postsf.close()
print 'done'
