# -*- coding: utf-8 -*-
import os
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
app.config['MYSQL_DATABASE_DB'] = 'hw7_db'
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


@app.route('/')
def show_question_list():
    db = get_db()
    cur = db.cursor()
    cur.execute('select post.user_id, post.body from post, question where question.post_id = post.id')
    entries = cur.fetchall()
    return render_template('show_entries.html', entries=entries)

@app.route('/question/<question_id>')
def show_question(question_id):
    db = get_db()
    print question_id
    cur = db.cursor()
    cur.execute('''select answer.accepted, post.body from question, answer, post where question.id = %s and
                  question.id = answer.question_id and post.id = answer.post_id''', (question_id))
    answers = cur.fetchall()

    cur.execute('''select post.body from question, post where question.id = %s and post.id = question.post_id''',
                   (question_id))
    question = cur.fetchone()

    cur.execute('''select tag.name from question_tag, question, tag
                   where question.id = %s and question.id  = question_tag.question_id and
                   tag.id = question_tag.tag_id''',
                   (question_id))
    tags = cur.fetchall()

    return render_template('question.html', answers = answers, question = question, tags = tags)


@app.route('/add_question', methods=['POST'])
def add_entry():
    if not session.get('logged_in'):
        abort(401)
    db = get_db()
    db.execute('insert into entries (title, text) values (?, ?)',
               [request.form['title'], request.form['text']])
    db.commit()
    flash('New entry was successfully posted')
    return redirect(url_for('show_question_list'))


@app.route('/login', methods=['GET', 'POST'])
def login():
    db = get_db()
    cur = db.cursor()
    error = None

    if request.method == 'POST':
        cur.execute('''select * from user where username = %s and password = %s''',
                    (request.form['username'], request.form['password']))
        user = cur.fetchone()
        print cur.rowcount
        if cur.rowcount is 0:
            error = 'Invalid username/password'
        else:
            session['logged_in'] = True
            flash('You were logged in')
            return redirect(url_for('show_question_list'))

    return render_template('login.html', error=error)


@app.route('/logout')
def logout():
    session.pop('logged_in', None)
    flash('You were logged out')
    return redirect(url_for('show_question_list'))


if __name__ == '__main__':
    app.run(debug=True)
