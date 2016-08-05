from flask import Flask, render_template, request, redirect, jsonify # jsonify let's us send JSON back!
# Import MySQLConnector class from mysqlconnection.py
from flask import json
import datetime
from mysqlconnection import MySQLConnector

app = Flask(__name__)
'''
Set variable 'mysql' to be an instance of the MySQLConnector class,
taking our entire application as the first argument and the database
name as the second argument.
'''
mysql = MySQLConnector(app, 'ajax_notes')


@app.route('/posts')
def index():
    query = "SELECT * FROM notes"
    posts = mysql.query_db(query)
    return render_template('index.html', posts=posts)

@app.route('/posts/index_json')
def index_json():
    query = "SELECT * FROM notes"
    posts = mysql.query_db(query)
    response = jsonify(posts=posts)
    return response

@app.route('/posts/index_html')
def index_partial():
    query = "SELECT * FROM notes"
    posts = mysql.query_db(query)
    return render_template('partials/posts.html', posts=posts)

@app.route('/posts/create', methods=['POST'])
def create():
    query = "INSERT INTO notes(title, created_at, updated_at) VALUES('{}','{}','{}')".format(request.form['title'], datetime.datetime.now(), datetime.datetime.now())
    mysql.query_db(query)
    #return_query = "SELECT * FROM notes"
    #posts = mysql.query_db(return_query)
    #return render_template('partials/posts.html', posts=posts)
    return redirect('/posts')

@app.route('/posts/update', methods=['post'])
def update():
    note_id = request.form['update_id']
    print "update id:"
    print request.form['update_id']
    query = "UPDATE notes set description=:description WHERE id = :note_id"
    data = {'note_id': note_id,
            'description': request.form['description']}
    mysql.query_db(query, data)
    return redirect('/posts')

@app.route('/posts/delete', methods=['post'])
def destroy():
    note_id = request.form['delete_id']
    print "delete id:"
    print request.form['delete_id']
    query = "DELETE FROM notes WHERE id = :note_id"
    data = {'note_id': note_id}
    mysql.query_db(query, data)
    return redirect('/posts')

if __name__ == "__main__":
    app.run(debug=True)