--Display history of orders of reader with ID 13 

select * from book_orders 
where r_id=13

--Display information of reader with ID 34

select * from library_readers
where r_id=34

--Display information about a particular book

select * from library_books
where book_id=45

--Display a company that supplies a certain category

select category.category_id,category.category_name,book_suppliers.comp_name
from category
inner join book_suppliers
on category.comp_id=book_suppliers.comp_id
where category_id=2

--Display the damage to a particular book that needs to be repaired

select * from books_restoration
where book_id=11