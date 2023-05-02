-- in terminal:
-- psql < craigslist.sql
-- psql craigslist_db

DROP DATABASE IF EXISTS craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db

CREATE TABLE regions (
    id INT PRIMARY KEY,
    region TEXT
);

CREATE TABLE users (
    id INT PRIMARY KEY,
    username varchar(15),
    encrypt_password varchar(15),
    pref_region INT REFERENCES regions(id)
);

CREATE TABLE categories (
    id INT PRIMARY KEY,
    name TEXT
);

CREATE TABLE posts (
    id INT PRIMARY KEY,
    title varchar(50) NOT NULL,
    post_description text,
    location TEXT NOT NULL,
    user_id INT REFERENCES users NOT NULL,
    region_id INT REFERENCES regions,
    category_id INT REFERENCES categories
);