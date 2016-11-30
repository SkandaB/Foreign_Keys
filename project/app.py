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
    cur.execute('''select answer.id, post.body, post.created_timestamp, user.username
                   from question, answer, post, user
                   where question.id = %s and
                         question.id = answer.question_id and
                          user.id = post.user_id and
                          post.id = answer.post_id''', (question_id))
    answers = cur.fetchall()

    cur.execute('''select post.body, question.accepted_answer_id, question.id, question.post_id,
                          post.created_timestamp, user.username
                  from question, post, user
                  where question.id = %s and
                        post.id = question.post_id and
                        user.id = post.user_id''', (question_id))
    question = cur.fetchone()

    cur.execute('''select tag.name from question_tag, question, tag
                   where question.id = %s and
                   question.id = question_tag.question_id and tag.id = question_tag.tag_id''', (question_id))
    tags = cur.fetchall()
    q_vote_count = get_vote_count(cur, question[3])

    cur.execute('''select comment.body, comment.user_id, user.username
                   from comment, user
                   where comment.user_id = user.id and
                         comment.post_id = %s
                   ''', (question[3]))
    comments = cur.fetchall()
    # q_vote_count = get_vote_count(cur, question[3])

    return render_template('question.html',
                            answers = answers,
                            question = question,
                            tags = tags,
                            q_vote_count = q_vote_count,
                            comments = comments
                           )


@app.route('/add_question', methods=['POST'])
def add_question():
    if not session.get('logged_in'):
        abort(401)

    db = get_db()
    cur = db.cursor()

    db.begin()
    cur.execute('insert into post (user_id, body) values (%s, %s)',
               (session['user_id'], request.form['question']))
    new_post_id = cur.lastrowid
    cur.execute('insert into question (post_id) values (%s)',
               (new_post_id))
    inserted_question_id = cur.lastrowid

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
    question_id = request.form['question_id']

    db.begin()
    cur.execute('insert into post (user_id, body) values (%s, %s)',
               (session['user_id'], request.form['answer']))

    new_post_id = cur.lastrowid

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
        cur.execute('''select * from user where username = %s and password = MD5(%s)''',
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


@app.route('/drill', methods=['GET','POST'])
def admin_calendar():

    questions = {}

    year = '2015'
    month = 'January'
    quarter = 'Q1'

    if request.method == 'POST':

        drill_type = request.form['drill_option']
        year = request.form['year']
        month = request.form['month']
        quarter = request.form['quarter']

        db = get_db()
        cur = db.cursor()

        if(drill_type == 'year'):
            cur.execute('''select user.username, post.body, calendar.fulldate, question.id
                   from post, question, calendar, activity, user
                   where activity.calendar_id=calendar.id and activity.post_id=post.id and post.user_id = user.id and question.post_id=post.id
                   and calendar.year=%s group by post.id order by post.created_timestamp''',(year))
            questions = cur.fetchall()
        elif(drill_type == 'quarter'):
            cur.execute('''select user.username, post.body, calendar.fulldate, question.id
                   from post, question, calendar, activity, user
                   where activity.calendar_id=calendar.id and activity.post_id=post.id and post.user_id = user.id and question.post_id=post.id
                   and calendar.year=%s and calendar.quarter=%s group by post.id order by post.created_timestamp''', (year, quarter))
            questions = cur.fetchall()
        elif(drill_type == 'month'):
            cur.execute('''select user.username, post.body, calendar.fulldate, question.id
                   from post, question, calendar, activity, user
                   where activity.calendar_id=calendar.id and activity.post_id=post.id and post.user_id = user.id and question.post_id=post.id
                   and calendar.year=%s and calendar.month=%s group by post.id order by post.created_timestamp'''
                   ,(year, month))
            questions = cur.fetchall()

    return render_template('show_admin_entries.html', entries=questions, year=year, quarter=quarter, month=month)

@app.route('/search', methods=['POST'])
def search():
    print(request.form['search']);
    search_text = '%' + request.form['search'] + '%';
    # page = int(page)
    # limit = page * 15
    db = get_db()
    cur = db.cursor()
    cur.execute('''select post.user_id, post.body, question.id, post.id
                   from post, question
                   where question.post_id = post.id and post.body like %s order by question.id DESC''', (search_text))
    questions = cur.fetchall()

    return render_template('show_search_entries.html', entries=questions)
    # return render_template('question.html', answers = answers, question = question, tags = tags)

# @app.route('/drill', methods=['POST'])
# def drill():

@app.route('/slice', methods=['GET','POST'])
def slice_func():
    questions = {}

    if request.method == 'POST':
      db=get_db()
      cur=db.cursor()
      cur.execute('''select tag.name as tagname,user.username ,calendar.year,count(*)
                   from activity,tag,user,calendar
                   where activity.tag_id=tag.id
                   and activity.user_id=user.id
                   and activity.calendar_id=calendar.id
                   and calendar.year=%s
                   group by user.username,tag.id
                   ORDER BY count(*) DESC''',(request.form['year_id']))
      questions = cur.fetchall()
    # cur.execute('''SELECT tag.name as tagname,user.username ,calendar.year,count(*)
    #     from activity,tag,user,calendar
    #     WHERE activity.tag_id=tag.id
    #     AND activity.user_id=user.id
    #     AND activity.calendar_id=calendar.id
    #     and calendar.year=%s
    #     GROUP BY user.username,tag.id
    #     ORDER BY count(*) DESC''',(request.form['year_id']))
    # questions = cur.fetchall()

    return render_template('show_slice_entries.html', entries=questions,year_num='2014')
    # return render_template('show_slice_entries.html', entries=questions,year_num=request.form['year_id'])

@app.route('/dice', methods=['GET','POST'])
def dice_func():
    db=get_db()
    cur=db.cursor()
    print("Got tag value",request.form['tag_id'])
    cur.execute('''SELECT calendar.month,count(*)
        from activity,calendar,tag
        where activity.calendar_id=calendar.id
        and activity.tag_id=tag.id
        and tag.id=%s
        GROUP by calendar.month;''',(request.form['tag_id']))
    questions = cur.fetchall()

    cur.execute('''SELECT tag.name
        from tag
        where tag.id=%s ;''',(request.form['tag_id']))
    tagname = cur.fetchone()

    return render_template('show_dice_entries.html', entries=questions,tag_name=tagname)

if __name__ == '__main__':
    app.run(debug=True)
