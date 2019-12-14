/*using select statement to query data from one column*/
SELECT
	first_name
FROM
	customer;
	
/*using select to query data from multiple columns*/
SELECT
	first_name,
	last_name,
	email
FROM
	customer;

/* using SELECT statement to query data in all columns of a table*/

SELECT
	*
FROM
	customer;

/*using SELECT statement with expressions examples*/

select first_name || ' ' || 
	last_name as full_name, email
from customer;

/*using SELECT statement with only expressios example 
and FROM is skipped because it does not refer to any table*/

select 5 * 3 as result;

/*using ORDER BY to sort rows in ascending (ASC) or descending (DESC) order*/
select first_name, last_name
from customer order by first_name ASC;

select first_name, last_name
from customer order by last_name DESC;

SELECT first_name, last_name
from customer order by first_name ASC, last_name DESC;



/*using DISTINCT to remove duplicate rows*/
/*sample table for using DISTINCT KEYWORD*/

/*inserting rows in t1*/

insert into t1 (bcolor, fcolor)
values ('red', 'red'),
('red', 'red'),
('red', 'null'),
('null', 'red'),
('red', 'green'),
('red', 'blue'),
('green', 'red'),
('green', 'blue'),
('green', 'green'),
('blue', 'red'),
('blue', 'green'),
('blue', 'blue');

/*Querying data from t1 table using select*/
select id, bcolor, fcolor
from t1;

/*using sql DISTINCT on one column example*/

select distinct bcolor from t1
order by bcolor;

/*using DISTINCT on multiple columns*/

select distinct bcolor, fcolor
from t1 order by bcolor, fcolor;

/*DISTINCT on example keeping the first row in the returned set
even when it has a duplicate*/

select distinct on (bcolor) bcolor, fcolor
from t1 order by bcolor, fcolor;


/*using the SELECT statement with the WHERE clause 
combined with the equal(=) boolean expression*/

select last_name, first_name from customer
where first_name = 'Jamie';

/*WHERE clause with the AND operator*/

select last_name, first_name from customer
where first_name = 'Jamie' and last_name = 'Rice';

/*using WHERE clause wuth the OR operator*/

select first_name, last_name from customer
where last_name = 'Rodriguez' or first_name = 'Adam';

/* MATCHING STRINGS IN, LIKE
WHERE clause with the IN operator*/
 
SELECT first_name, last_name from customer
where first_name IN ('Ann', 'Anne', 'Annie');


/*using the SELECT and LIMIT clause to get 
the first five films order by film_id*/

select film_id, title, release_year from film
order by film_id limit 5;

/*to retrieve the 4 films starting from the third one ordered by film_id*/

select film_id, title, release_year from film
order by film_id limit 4 offset 3;

/*to get the number of lowest or highest items in a table
in this example, we're getting the top 10 most expensive films*/

select film_id, title, release_year from film
order by rental_rate DESC limit 10;

/*the LIMIT clause is not an SQL standard keyword to use when
reducing the number of rows. However, we will use the FETCH keyword*/

/* first row display*/
select film_id, title from film order by title
fetch first 1 row only;

/*first five rows display*/
select film_id, title from film order by title
fetch first 5 row only;

/*to return the next five rows after the first five rows*/
select film_id, title from film order by title
offset 5 rows fetch first 5 row only;

/*The IN Operator to display the rental info of customer id 1 and 2*/
select customer_id, rental_id, return_date from rental
where customer_id in (1, 2) order by return_date desc;

/*NOT IN operator to diplay customers not in 1 or 2*/
select customer_id, rental_id, return_date from rental
where customer_id not in (1, 2);

/*to display customers that has rental's return date on 2005-05-27*/
select customer_id from rental 
where cast (return_date as date) = '2005-05-27';

/*using the list of customer_id as the input for the IN Operator*/
select first_name, last_name from customer
where customer_id in (select customer_id from rental
where cast (return_date as date) = '2005-05-27');