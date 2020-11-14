CREATE TABLE library_list(
library_id INT PRIMARY KEY NOT NULL,
library_name VARCHAR(64) NOT NULL,
library_address VARCHAR(64) NOT NULL,
library_schedule VARCHAR(255) NOT NULL,
library_books_count INT NOT NULL
);

CREATE TABLE library_books(
book_id INT PRIMARY KEY NOT NULL,
book_name VARCHAR(64) NOT NULL,
book_author VARCHAR(64) NOT NULL,
book_desc VARCHAR NOT NULL,
book_genre VARCHAR(64) NOT NULL,
book_year DATE NOT NULL,
book_language VARCHAR(64) NOT NULL,
library_id INT REFERENCES library_list(library_id),
library_books_copies INT NOT NULL
);

CREATE TABLE book_suppliers(
comp_id INT PRIMARY KEY NOT NULL,
comp_name VARCHAR(64) NOT NULL,
comp_address VARCHAR(64) NOT NULL,
comp_phone VARCHAR(64) NOT NULL,
comp_website VARCHAR(64) NOT NULL,
delivery VARCHAR(64) NOT NULL,
library_id INT REFERENCES library_list(library_id)
);

CREATE TABLE library_online(
book_id INT PRIMARY KEY REFERENCES library_books(book_id),
book_size INT NOT NULL,
book_format VARCHAR(64) NOT NULL);

CREATE TABLE books_restoration(
book_id INT PRIMARY KEY REFERENCES library_books(book_id),
damage VARCHAR(255) NOT NULL,
corrector VARCHAR(64) NOT NULL,
library_id INT REFERENCES library_list(library_id)
);

CREATE TABLE archive(
doc_id INT PRIMARY KEY NOT NULL,
doc_name VARCHAR(64) NOT NULL,
doc_author VARCHAR(64) NOT NULL,
doc_form VARCHAR(64) NOT NULL,
doc_year DATE NOT NULL,
doc_lang VARCHAR NOT NULL,
library_id INT REFERENCES library_list(library_id)
);

CREATE TABLE library_readers(
r_id INT PRIMARY KEY NOT NULL,
r_fname VARCHAR(64) NOT NULL,
r_lname VARCHAR(64) NOT NULL,
r_docnumber VARCHAR(64) NOT NULL,
book_count INT NOT NULL,
book_borrowed_current INT,
book_id INT REFERENCES library_books(book_id),
library_id INT REFERENCES library_list(library_id)
);

CREATE TABLE black_list(
r_id INT PRIMARY KEY REFERENCES library_readers(r_id),
reason TEXT NOT NULL
);

CREATE TABLE rent_books(
book_id INT PRIMARY KEY REFERENCES library_books(book_id),
r_id INT REFERENCES library_readers(r_id),
date_taken DATE,
date_return DATE,
date_deadline DATE
);

CREATE TABLE position(
pos_id INT PRIMARY KEY NOT NULL,
pos_name VARCHAR(64) NOT NULL,
salary DECIMAL NOT NULL
);

CREATE TABLE library_stuff(
employee_id INT PRIMARY KEY NOT NULL,
employee_fname VARCHAR(64) NOT NULL,
employee_lname VARCHAR(64) NOT NULL,
employee_datebirth DATE NOT NULL,
library_id INT REFERENCES library_list(library_id),
pos_id INT REFERENCES position(pos_id),
hire_date DATE NOT NULL
);