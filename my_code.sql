/* Inner Join */
select a.id id_a, a.fruit fruit_a,
		b.id id_b, b.fruit fruit_b
from basket_a a
inner join basket_b b on a.fruit = b.fruit;

/* Left Join */
select a.id id_a, a.fruit fruit_a,
		b.id id_b, b.fruit fruit_b
		
from basket_a a
left join basket_b b on a.fruit = b.fruit;

/* To get only rows for the left table, we use left outer join*/

select a.id id_a, a.fruit fruit_a,
		b.id id_a, b.fruit fruit_b
from basket_a a left join basket_b b on a.fruit = b.fruit
where b.id is null;

/* right join */
select a.id id_a, a.fruit fruit_a,
		b.id id_b, b.fruit fruit_b
from basket_a a
right join basket_b b on a.fruit = b.fruit;

/* to get only rows from the right table */
select a.id id_a, a.fruit fruit_a,
		b.id id_b, b.fruit fruit_b
from basket_a a right join basket_b b on a.fruit = b.fruit
where a.id is null;

/* full outer join */
select a.id id_a, a.fruit fruit_a,
		b.id id_b, b.fruit fruit_b
from basket_a a 
full outer join basket_b b on a.fruit = b.fruit;

/* to return a set of rows uniqu to the left and right tables */

select a.id id_a, a.fruit fruit_a,
		b.id id_b, b.fruit fruit_b
from basket_a a
full outer join basket_b b on a.fruit = b.fruit
where a.id is null or b.id is null;


/* POSTGRESQL 2 TABLES EXAMPLE OF INNER JOIN
NOW A REAL LIFE APPLICATION USING THE CUSTOMER DATABASE */
select customer.customer_id, first_name, last_name, email, amount, payment_date
from customer inner join payment on payment.customer_id = customer.customer_id;

/* The above code with the ORDER BY clause for sorting */
select customer.customer_id, first_name, last_name, email, amount, payment_date
from customer inner join payment on payment.customer_id = customer.customer_id
order by customer.customer_id;

/* We can also use where to filter a specific customer out */
select customer.customer_id, first_name, last_name, email, amount, payment_date
from customer inner join payment on payment.customer_id = customer.customer_id
where customer.customer_id = 2;

/* POSTGRESQL 3 TABLES EXAMPLE OF USING INNER JOIN */
select customer.customer_id, 
		customer.first_name customer_first_name,
		customer.last_name customer_last_name, 
		customer.email,
		staff.first_name staff_first_name,
		staff.last_name staff_last_name,
		amount, 
		payment_date
from customer
inner join payment on payment.customer_id = customer.customer_id
inner join staff on payment.staff_id = staff.staff_id;

/* USING LEFT JOIN clause to join film table and inventory tables´*/
select film.film_id, film.title, inventory_id
from film 
left join inventory on inventory.film_id = film.film_id;

/* Adding the null operator to sort out rows with null values */

select film.film_id, film.title, inventory_id
from film
left join inventory on inventory.film_id = film.film_id
where inventory.film_id is null;

/* Self-Join Query. I created a new table in my table codes file*/

/* To find who reports to whom in the table created above, 
in the code the top manager is not returned in the from the query */
select e.first_name || ' ' || e.last_name employee,
		m.first_name || ' ' || m.last_name manager
from employee e inner join employee m on m.employee_id = e.manager_id
order by manager;

/* To return the top manager from the query, we use the inner join and  the code is as below */
select e.first_name || ' ' || e.last_name employee,
		m.first_name || ' ' || m.last_name manager
from employee e left join employee m on m.employee_id = e.manager_id
order by manager;

/* finding the pair of filming having the same length in the DVD rental database and joining film to itself */
select f1.title, f2.title, f1.length
from film f1 inner join film f2 on f1.film_id <> f2.film_id
and f1.length = f2.length;

/* USING FULL JOIN */
select * from departments;

select * from employees;

/* USING FULL OUTER JOIN. It returns a set including every employee that belongs to a department
and every department which has an employee and also every employee without a department 
and every department without an employee*/
select employee_name, department_name
from employees e full outer join departments d on d.department_id = e.department_id;

/* To find the department that has no employee using the WHERE clause */
select employee_name, department_name
from employees e full outer join departments d on d.department_id = e.department_id
where employee_name is null;

/* To find an employee without no department using the WHERE clause */
select employee_name, department_name
from employees e full outer join departments d on d.department_id = e.department_id
where department_name is null;
