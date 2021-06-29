from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from werkzeug.utils import secure_filename
import json
from flask_mail import Mail
from datetime import datetime
import os
import math

local_server = True
with open("config.json", "r") as c:
    params = json.load(c)["params"]

local_server = True
app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = params['upload_location']
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params['gmail-user'],
    MAIL_PASSWORD=params['gmail-passw']
)
mail = Mail(app)
if local_server:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:@localhost/avalanche_gaming'
db = SQLAlchemy(app)


class Contacts(db.Model):
    """
    Sr.no Name Phone Message Date Email
    """
    sr_no = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    phone = db.Column(db.String(12), nullable=False)
    message = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    email = db.Column(db.String(20), nullable=False)


class Posts(db.Model):
    """
    Sr.no title slug content Date
    """
    sr_no = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    sub_heading = db.Column(db.String(100), nullable=False)
    slug = db.Column(db.String(12), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    img_file = db.Column(db.String(12), nullable=False)


@app.route('/')
def funchome():
    # Pagination logic
    # First - previous='#'and Next ='page+1'
    # Middle -previous = 'page-1' and Next ='page+1'
    # Last - previous = 'page-1' and Next='#'
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts) / int(params['no_of_posts']))
    page = request.args.get('page')
    if not str(page).isnumeric():
        page = 1
    page = int(page)
    posts = posts[(page - 1) * int(params['no_of_posts']):(page - 1) * int(params['no_of_posts']) + int(
        params['no_of_posts'])]
    if page == 1:
        prevp = '#'
        nextp = "/?page=" + str(page + 1)
    elif page == last:
        prevp = "/?page=" + str(page - 1)
        nextp = "#"
    else:
        prevp = "/?page=" + str(page - 1)
        nextp = "/?page=" + str(page + 1)

    return render_template('index.html', params=params, posts=posts, prevp=prevp, nextp=nextp)


@app.route('/about')
def funcabout():
    return render_template('about.html', params=params)


@app.route('/dashboard', methods=["GET", "POST"])
def funcdashboard():
    if 'user' in session and session['user'] == params['admin-user']:
        posts = Posts.query.all()
        return render_template('dashboard.html', params=params, posts=posts)
    if request.method == 'POST':
        username = request.form.get('uname')
        user_pass = request.form.get('pass')
        if (username == params['admin-user']) and (user_pass == params['admin-passw']):
            session['user'] = username
            posts = Posts.query.all()
            return render_template('dashboard.html', params=params, posts=posts)

    return render_template('login.html', params=params)


@app.route("/edit/<string:sr_no>", methods=["GET", "POST"])
def funcedit(sr_no):
    if 'user' in session and session['user'] == params['admin-user']:
        if request.method == 'POST':

            # < !-- title subheading slug content img_file -->

            box_title = request.form.get('title')
            box_subheading = request.form.get('subheading')
            box_slug = request.form.get('slug')
            box_content = request.form.get('content')
            box_img_file = request.form.get('img_file')

            if sr_no == '0':
                """
                    sr_no title sub_heading slug content img_file Date
                """
                post = Posts(
                    title=box_title,
                    sub_heading=box_subheading,
                    slug=box_slug,
                    content=box_content,
                    date=datetime.now(),
                    img_file=box_img_file

                )
                db.session.add(post)
                db.session.commit()

            else:
                post = Posts.query.filter_by(sr_no=sr_no).first()
                post.title = box_title,
                post.sub_heading = box_subheading,
                post.slug = box_slug,
                post.content = box_content,
                post.img_file = box_img_file,
                post.date = datetime.now()
                db.session.commit()
                return redirect('/edit/' + sr_no)
        post = Posts.query.filter_by(sr_no=sr_no).first()
        return render_template('edit.html', params=params, post=post , sr_no=sr_no)


@app.route("/delete/<string:sr_no>")
def funcdelete(sr_no):
    if 'user' in session and session['user'] == params['admin-user']:
        post = Posts.query.filter_by(sr_no=sr_no).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')


@app.route("/uploader", methods=["GET", "POST"])
def funcuploader():
    if 'user' in session and session['user'] == params['admin-user']:
        if request.method == 'POST':
            f = request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
        return "UPLOADED SUCCESSFULLY!!!"


@app.route("/logout")
def funclogout():
    session.pop('user')
    return redirect('/dashboard')


@app.route("/contact", methods=["GET", "POST"])
def funccontact():
    if request.method == 'POST':
        """
        add entry to the database
        """
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        """
        entry = Contacts(database variable = html variable)
        """
        entry = Contacts(
            name=name,
            phone=phone,
            message=message,
            email=email,
            date=datetime.now()
        )
        db.session.add(entry)
        db.session.commit()
        mail.send_message(
            'New message from ' + name + " to Avalanche_gaming",
            sender=email,
            recipients=[params['gmail-user']],
            body=message + "\n" + phone
        )

    return render_template('contact.html', params=params)


@app.route("/post/<string:post_slug>", methods=['GET'])
def funcpost(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params=params, post=post)


app.run(debug=True)
