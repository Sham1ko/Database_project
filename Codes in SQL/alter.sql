--ADD

alter table black_list
add column penalty int;

alter table book_orders
add column deadline date;

alter table online_user
add column status varchar;

alter table online_orders
add column logs date;

alter table library_online
add column availability

--DROP

alter table black_list
drop column penalty int;

alter table book_orders
drop column deadline date;

alter table online_user
drop column status varchar;

alter table online_orders
drop column logs date;

alter table library_online
drop column availability