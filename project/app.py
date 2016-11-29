# -*- coding: utf-8 -*-
import os
import datetime
import time
from sqlite3 import dbapi2 as sqlite3
from flask import Flask, request, jsonify, session, g, redirect, url_for, abort, \
     render_template, flash
from flaskext.mysql import MySQL

mysql = MySQL()
app = Flask(__name__)
app.secret_key = 'biscuit'

# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'foreignkeys'
app.config['MYSQL_DATABASE_PASSWORD'] = 'nonosql'
app.config['MYSQL_DATABASE_DB'] = 'filedb'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'

mysql.init_app(app)

def connect_db():
    return mysql.connect()

def get_db():
    """Opens a new database connection if there is none yet for the
    current application context.
    """
    if not hasattr(g, 'mysql_db'):
        g.mysql_db = connect_db()
    return g.mysql_db

@app.teardown_appcontext
def close_db(error):
    """Closes the database again at the end of the request."""
    if hasattr(g, 'sqlite_db'):
        g.mysql_db.close()

def get_tags(cursor):
    cursor.execute('select tag.id, tag.name from tag order by tag.name')
    return cursor.fetchall()

def get_vote_count(cursor, post_id):
    cursor.execute('SELECT COUNT(*) FROM vote where post_id = %s ', (post_id))
    return cursor.fetchone()[0]

def get_questions(cursor, tag, limit, sort_type):
    if(tag is None):
        cursor.execute('''select post.user_id, post.body, question.id, post.id
                       from post, question
                       where question.post_id = post.id order by question.id '''+ sort_type +''' LIMIT %s, 15'''
                       , (int(limit)))
    else:
        cursor.execute('''select post.user_id, post.body, question.id, post.id
                       from post, question, question_tag
                       where question.post_id = post.id
                       and question_tag.question_id = question.id
                       and question_tag.tag_id = %s order by question.id '''+ sort_type +''' LIMIT %s, 15'''
                       , (tag, int(limit)))
    return cursor.fetchall()


@app.route('/', defaults={'page': 0}, methods=['GET', 'POST'])
@app.route('/page/<page>', methods=['GET', 'POST'])
def show_question_list(page):
    tag = None
    page = int(page)
    sort_type = 'DESC'

    if request.method == 'POST':
        if 'tag_id' in request.form:
            tag = int(request.form['tag_id'])
            page = 0
        if 'sort_type' in request.form:
            sort_type = request.form['sort_type']
            page = 0

    limit = page * 15
    db = get_db()
    cur = db.cursor()

    questions = get_questions(cur, tag, limit, sort_type)

    tags = get_tags(cur);
    return render_template('show_entries.html', entries=questions, tags=tags, page=page, tag_id=tag, sort_type=sort_type)


@app.route('/question/<question_id>')
def show_question(question_id):
    db = get_db()
    cur = db.cursor()
    cur.execute('''select answer.id, post.body from question, answer, post
                   where question.id = %s and
                         question.id = answer.question_id and
                          post.id = answer.post_id''', (question_id))
    answers = cur.fetchall()

    cur.execute('''select post.body, question.accepted_answer_id, question.id, question.post_id from question, post
                  where question.id = %s and
                  post.id = question.post_id''', (question_id))
    question = cur.fetchone()

    cur.execute('''select tag.name from question_tag, question, tag
                   where question.id = %s and
                   question.id = question_tag.question_id and tag.id = question_tag.tag_id''', (question_id))
    tags = cur.fetchall()
    q_vote_count = get_vote_count(cur, question[3])

    return render_template('question.html', answers = answers, question = question, tags = tags, q_vote_count = q_vote_count)


@app.route('/add_question', methods=['POST'])
def add_question():
    if not session.get('logged_in'):
        abort(401)

    db = get_db()
    cur = db.cursor()
    cur.execute('''SELECT * FROM post ORDER BY id DESC LIMIT 0, 1''')
    post = cur.fetchone()
    new_post_id = post[0] + 1

    cur.execute('insert into post (id, user_id, body) values (%s, %s, %s)',
               (new_post_id, session['user_id'], request.form['question']))

    cur.execute('insert into question (post_id) values (%s)',
               (new_post_id))


    cur.execute('''SELECT * FROM question ORDER BY id DESC LIMIT 0, 1''')
    question = cur.fetchone()
    inserted_question_id = question[0]

    cur.execute('insert into question_tag (question_id, tag_id) values (%s, %s)',
               (inserted_question_id, request.form['tag']))
    db.commit()

    flash('New question was successfully posted')
    return redirect(url_for('show_question_list'))


@app.route('/add_answer', methods=['GET', 'POST'])
def add_answer():
    if not session.get('logged_in'):
        abort(401)

    db = get_db()
    cur = db.cursor()
    cur.execute('''SELECT * FROM post ORDER BY id DESC LIMIT 0, 1''')
    post = cur.fetchone()
    new_post_id = post[0] + 1
    question_id = request.form['question_id']

    cur.execute('insert into post (id, user_id, body) values (%s, %s, %s)',
               (new_post_id, session['user_id'], request.form['answer']))

    cur.execute('insert into answer (post_id, question_id) values (%s, %s)',
               (new_post_id, question_id))

    db.commit()

    flash('New answer was successfully posted')
    return redirect(url_for('show_question',question_id=question_id))


@app.route('/login', methods=['GET', 'POST'])
def login():
    db = get_db()
    cur = db.cursor()
    error = None

    if request.method == 'POST':
        cur.execute('''select * from user where username = %s and password = %s''',
                    (request.form['username'], request.form['password']))
        user = cur.fetchone()
        if cur.rowcount is 0:
            error = 'Invalid username/password'
        else:
            session['logged_in'] = True
            session['user_id'] = user[0]
            flash('You were logged in')
            return redirect(url_for('show_question_list'))

    return render_template('login.html', error=error)


@app.route('/logout')
def logout():
    session.pop('logged_in', None)
    flash('You were logged out')
    return redirect(url_for('show_question_list'))


@app.route('/admin', methods=['GET','POST'])
def admin_calendar():

    questions = {}

    year = '2014'
    month = 'January'
    quarter = 'Q1'

    if request.method == 'POST':
        print(request.form['drill_option'])
        print(request.form['year'])
        print(request.form['month'])
        print(request.form['quarter'])

        drill_type = request.form['drill_option']
        year = request.form['year']
        month = request.form['month']
        quarter = request.form['quarter']

        db = get_db()
        cur = db.cursor()

        if(drill_type == 'year'):
            print 'by year'
            cur.execute('''select user.username, post.body, calendar.fulldate
                   from post, question, calendar, activity, user
                   where activity.calendar_id=calendar.id and activity.post_id=post.id and post.user_id = user.id 
                   and calendar.year=%s group by post.id order by post.created_timestamp''',(year))
            questions = cur.fetchall()
        elif(drill_type == 'quarter'):
            print 'by quarter', year, quarter
            cur.execute('''select user.username, post.body, calendar.fulldate, activity.post_id
                   from post, question, calendar, activity, user
                   where activity.calendar_id=calendar.id and activity.post_id=post.id and post.user_id = user.id 
                   and calendar.year=%s and calendar.quarter=%s group by post.id order by post.created_timestamp''', (year, quarter))
            questions = cur.fetchall()
            print len(questions)
        elif(drill_type == 'month'):
            print 'by month'
            cur.execute('''select user.username, post.body, calendar.fulldate
                   from post, question, calendar, activity, user
                   where activity.calendar_id=calendar.id and activity.post_id=post.id and post.user_id = user.id 
                   and calendar.year=%s and calendar.month=%s group by post.id order by post.created_timestamp'''
                   ,(year, month))
            questions = cur.fetchall()

    return render_template('show_admin_entries.html', entries=questions, year=year, quarter=quarter, month=month)

@app.route('/search', methods=['POST'])
def search_text():
    print(request.form['search']);
    search_text = '%' + request.form['search'] + '%';
    page = int(page)
    limit = page * 15
    db = get_db()
    cur = db.cursor()
    cur.execute('''select post.user_id, post.body, question.id, post.id
                   from post, question
                   where question.post_id = post.id and post.body like %s order by question.id DESC LIMIT %s, 15''', (search_text, (int(limit))))
    questions = cur.fetchall()

    return render_template('show_search_entries.html', entries=questions, page=page)
    # return render_template('question.html', answers = answers, question = question, tags = tags)

# @app.route('/drill', methods=['POST'])
# def drill():



if __name__ == '__main__':
    app.run(debug=True)
