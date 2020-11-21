--Update & Delete for Black list table
update black_list
set penalty=4000
where r_id=2

delete from black_list
where r_id=4
--Update & Delete for Book orders table
update book_orders
set r_id=4
where order_id=2

delete from book_orders 
where order_id=2
----Update & Delete for book_suppliers
update book_suppliers
set delivery='KazPost'
where comp_id=3

delete from book_suppliers
where delivery='KazPost'
--Update & Delete for books_restoration table
update books_restoration
set damage='Several pages were ripped out'
where book_id=91

delete from books_restoration 
where book_id=11
--Update & Delete for Category table
update category
set employee_id=13
where category_name='Comedy'

delete from category
where comp_id=2
--Update & Delete for library_books table
update library_books
set book_language='Kazakh'
where book_id=14

delete from library_books
where book_year<'1970-12-31'
--Update & Delete for library_online table
update library_online
set availability='true'
where book_format='Green'

delete from library_online
where book_format='Blue'
--Update & Delete for library_readers table
update library_readers
set r_docnumber='123456'
where r_fname='Abby'

delete from library_readers
where r_id=14
--Update & Delete for library_staff table
update library_staff
set pos_id=5
where employee_id=14

delete from library_staff
where employee_id=18
--Update & Delete for location table 
update location 
set category_id=1
where book_id 74

delete from location
where category_id=8
--Update & Delete for online_orders table
update online_orders 
set book_id=25
where user_id=1
 
delete from online_orders
where book_id=64
--Update & Delete for online_user table
update online_user
set login='AITU'
where r_id='12'

delete from online_user
where user_id=3
--Update & Delete for position table
update position 
set salary=300
where salary<300

delete from position
where pos_id=3
--Update & Delete for storage table
update storage
set book_count=3
where book_count<2

delete from storage
where book_count=1