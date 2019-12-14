/* return customers whose firstname start with 'Jen' */
select first_name, last_name from customer
where first_name like 'Jen%';

/* return customers whose firstname contains 'er' */

select first_name, last_name from customer 
where first_name like '%er%';

/*combining percent sign with underscore */
 select first_name, last_name from customer
 where first_name like '_her%';
 
 /* Using the ILIKE Operator*/
 select first_name, last_name from customer
 where first_name ilike 'BAR%';

/* inserts two contacts, one has a phone number and one does not*/
insert into contact(first_name, last_name, email, phone)
values('John', 'Doe', 'john.doe@example.com', NULL),
	('Lily', 'Bush', 'lily.bush@example.com', '(408-234-2764)');

/* To find the contact who does not have a phone number*/
select id, first_name, last_name, email, phone
from contact where phone is null;

/* To find the contact who has a phone number*/
select id, first_name, last_name, email, phone
from contact where phone is not null;

/* Column Alias*/
select first_name || ' ' || last_name as full_name
from customer order by full_name;

