CREATE DATABASE build_an_app;
\c build_an_app
CREATE TABLE accounts (id SERIAL PRIMARY KEY, username VARCHAR(255), user_email VARCHAR(255), password_hash VARCHAR(255), first_name VARCHAR(255), last_name VARCHAR(255), friends_of_user INTEGER REFERENCES accounts (id));
CREATE TABLE photos (id SERIAL PRIMARY KEY, photo_poster INTEGER REFERENCES accounts (id), photo_tags VARCHAR(255), photo_caption VARCHAR(140));
CREATE TABLE comments (id SERIAL PRIMARY KEY, comment_poster INTEGER REFERENCES accounts (id), photo_posted_to INTEGER REFERENCES photos (id), comment_content VARCHAR(255));
CREATE TABLE somethings (id SERIAL PRIMARY KEY, something_user INTEGER REFERENCES accounts (id), content VARCHAR(255));
CREATE TABLE anothers (id SERIAL PRIMARY KEY, another_user INTEGER REFERENCES accounts (id), another_thing VARCHAR(255));
