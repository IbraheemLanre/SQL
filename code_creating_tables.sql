/*create table basket_a (
	id int primary key,
	fruit varchar(100) not null);
	
create table basket_b(
	id int primary key,
	fruit varchar(100) not null);

insert into basket_a(id, fruit)
values (1, 'Apple'), (2, 'Orange'), (3, 'Banana'), (4, 'Cucumber');

insert into basket_b(id, fruit)
values (1, 'Orange'), (2, 'Apple'), (3, 'Watermelon'), (4, 'Pear');

create table employee(
	employee_id int primary key,
	first_name varchar(250) not null,
	last_name varchar(250) not null,
	manager_id int,
	foreign key (manager_id)
	references employee(employee_id)
	on delete cascade);
insert into employee(
	employee_id,
	first_name,
	last_name,
	manager_id)
values(1, 'Windy', 'Hays', null),
		(2, 'Ava', 'Christensen', 1),
		(3, 'Hassan', 'Conner', 1),
		(4, 'Anna', 'Reeves', 2),
		(5, 'Sau', 'Norman', 2),
		(6, 'Kalsie', 'Hays', 3),
		(7, 'Sally', 'Lester', 3),
		(8, 'Tory', 'Goff', 3);
*/
create table if not exists departments(
	department_id serial primary key,
	department_name varchar(255) not null);
	
create table if not exists employees(
	employee_id serial primary key,
	employee_name varchar(255) not null,
	department_id integer);
	
insert into departments(department_name)
values('Sales'),
		('Marketing'),
		('HR'),
		('IT'),
		('Production');
insert into employees(employee_name, department_id)
values('Bette Nicholson', 1),
		('Christian Gable', 1),
		('Joe Swank', 2),
		('Fred Costner', 3),
		('Sandra Kilmer', 4),
		('Julia Mcqueen', null);
		