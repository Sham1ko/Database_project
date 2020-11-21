CREATE TABLE library_readers(--Creating table for library readers
r_id INT PRIMARY KEY ,--Readers identificator 
r_fname VARCHAR,--First name of readers
r_lname VARCHAR,--Last name of readers
r_docnumber VARCHAR,--Document number 
book_count INT,--Sum of all books borrowed
book_borrowed_current INT--Current borrowed books
);

CREATE TABLE black_list(--Creating table for black list 
r_id INT PRIMARY KEY REFERENCES library_readers(r_id),--Identificator's of readers that in black list
reason TEXT --Reason to be blacklisted
);

CREATE TABLE online_user(--Creating table for online users
user_id INT PRIMARY KEY,--User's identificator
login VARCHAR,--Login of users
password VARCHAR,--Passwords of users to secure their account 
r_id INT REFERENCES library_readers(r_id)--Readers ID*
);
/*
Users only with physical library subscription can become ONLINE user
*/


CREATE TABLE position(--Creating table with names of positions for employees
pos_id INT PRIMARY KEY,--Position's identificator 
pos_name VARCHAR,--Name of position 
salary DECIMAL--Salary for given position
);

CREATE TABLE library_staff(--Creating table for library staff
employee_id INT PRIMARY KEY,--Employee's identificator
employee_fname VARCHAR,--Employee's first name
employee_lname VARCHAR,--Employee's last name 
employee_datebirth DATE,--Employee's date of birth
pos_id INT REFERENCES position(pos_id),--Employee's position in Library
hire_date DATE--Date on which the library staff started working  
);

CREATE TABLE book_suppliers(--Creating table for book suppliers 
comp_id INT PRIMARY KEY,--Company's identificator
comp_name VARCHAR,--Name of Company
comp_address VARCHAR,--Company's address where it located
comp_phone VARCHAR,--Company's phone number
comp_website VARCHAR,--Company's website
delivery VARCHAR--Name of book delivery service
);

CREATE TABLE category(--Creating a table for literature categories (technical, fictional,etc)
category_id INT PRIMARY KEY,--Category's identificator
category_name VARCHAR,--Category's name
comp_id INT REFERENCES book_suppliers(comp_id),--Each category is supplied by different companies
employee_id INT REFERENCES library_staff(employee_id)--Only a certain employee of the library can be considered in a certain category.
);

CREATE TABLE library_books(--Creating table for books in library
book_id INT PRIMARY KEY,--Identificator of book
book_name VARCHAR,--Name of book
book_author VARCHAR,--Author of book 
book_desc VARCHAR,--Description of book
book_genre VARCHAR,--Book's genre
book_year DATE,--Release date of book
book_language VARCHAR--Language of the book
);

CREATE TABLE location(--Creating table for location for each book
book_id INT PRIMARY KEY REFERENCES library_books(book_id),--Book's identificator
category_id INT REFERENCES category(category_id)--Category in which the book is located
);

CREATE TABLE library_online(--Creating table for online library
book_id INT PRIMARY KEY REFERENCES library_books(book_id),--Book's identificator 
book_size INT,--Size of book	
book_format VARCHAR--Format of book(PDF,EPUB,DJVU,FB2)
);

CREATE TABLE storage(--Creating table for storage of all books
book_id INT PRIMARY KEY REFERENCES library_books(book_id),--Book's identificator
book_count INT--Amount of books in storage
);

CREATE TABLE books_restoration(--Creating table for books that were damaged
book_id INT PRIMARY KEY REFERENCES library_books(book_id),--Damaged book's identificator
damage VARCHAR,--Describe of damage
corrector VARCHAR--Name of company that will correct damaged book
);

CREATE TABLE online_orders(--Creating table for orders that were made online
user_id INT REFERENCES online_user(user_id),--Online library user's ID 
book_id INT REFERENCES library_online(book_id)--Identificator of book
);

CREATE TABLE book_orders(--Creating table for offline orders
order_id INT PRIMARY KEY,--Order's ID
r_id INT REFERENCES library_readers(r_id),--Reader's ID
order_date DATE,--Date of order
book_id INT REFERENCES library_books(book_id),--Book's ID
employee_id INT REFERENCES library_staff(employee_id)--ID of Employee who conducted order
);
