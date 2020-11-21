--Display users registered in the online library

select library_readers.r_id,library_readers.r_fname,library_readers.r_lname,online_user.login
from library_readers
full join online_user
on online_user.r_id=library_readers.r_id
where login is not null;

--Display employees with salaries over 400

select library_staff.employee_id,library_staff.employee_fname,library_staff.employee_lname,position.pos_name,position.salary
from library_staff
inner join position
on position.pos_id=library_staff.pos_id
where position.salary>400
order by library_staff.employee_id;

--Display the company that has supplied a particular book

select distinct library_books.book_id,library_books.book_name,library_books.book_author,book_suppliers.comp_name
from library_books
full join location
on location.book_id=library_books.book_id
inner join category
on category.category_id=category.category_id
full join book_suppliers
on category.comp_id=book_suppliers.comp_id
where library_books.book_id=1
order by library_books.book_id

--Display books with a minimum number of copies in the storage location.

select distinct library_books.book_id,library_books.book_name,library_books.book_author,storage.book_count as copies_in_storage
from storage 
right join library_books
on storage.book_id=library_books.book_id and storage.book_count=(select min(storage.book_count) from storage)
where storage.book_count is not null

--Display the sum of salaries for a certain position

select position.pos_id,position.pos_name,count(library_staff.pos_id)*position.salary as budget
from position
inner join library_staff
on position.pos_id=library_staff.pos_id
group by position.pos_id
order by position.pos_id

--Display the average salary of employees hired after January 1, 2019.

select avg(position.salary) as Average
from position 
inner join library_staff
on position.pos_id=library_staff.pos_id
where library_staff.hire_date>'2019-01-01'

--Display the location of the book inside the library by category

select library_books.book_id,library_books.book_name,library_books.book_author,category.category_name as Location
from library_books
inner join location
on library_books.book_id=location.book_id
inner join category
on location.category_id=category.category_id
where library_books.book_id=74

--Display the employees with the highest salary

select library_staff.employee_id,library_staff.employee_fname,library_staff.employee_lname,position.salary
from library_staff
right join position
on library_staff.pos_id=position.pos_id
where position.salary=(select max(salary) from position)
order by library_staff.employee_id

--Display the employee responsible for a certain order

select library_staff.employee_id,library_staff.employee_fname,library_staff.employee_lname,library_books.book_name
from book_orders
full join library_staff
on library_staff.employee_id=book_orders.employee_id
full join library_books
on library_books.book_id=book_orders.book_id
where book_orders.order_id=4

--Display books with damage in a certain category

select books_restoration.book_id,library_books.book_name,books_restoration.damage
from books_restoration
right join library_books
on library_books.book_id=books_restoration.book_id
inner join location
on location.book_id=library_books.book_id
where location.category_id=2 and books_restoration.damage is not null
