-- psql -d lab14 -f data/seed.sql
1:48
CREATE DATABASE lab14_normal WITH TEMPLATE lab14;
1:50
CREATE TABLE authors (id SERIAL PRIMARY KEY, name VARCHAR(255));
1:53
INSERT INTO authors(name) SELECT DISTINCT author FROM books;
1:55
INSERT INTO authors(name) SELECT DISTINCT author FROM books;
1:58
ALTER TABLE books ADD COLUMN author_id INT;
2:00
UPDATE books SET author_id=author.id FROM (SELECT * FROM authors) AS author WHERE books.author = author.name;
2:04
ALTER TABLE books DROP COLUMN author;
2:06
ALTER TABLE books ADD CONSTRAINT fk_authors FOREIGN KEY (author_id) REFERENCES authors(id);









