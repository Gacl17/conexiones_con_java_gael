SELECT * from rental r;


-- UNIR LAS TABLAS
select *
	FROM rental r inner join customer c
	on r.customer_id = c.customer_id;


-- left
select *
	FROM rental r LEFT join customer c
	on r.customer_id = c.customer_id
where address_id = 602;

SELECT * from customer c;

select *
	FROM rental r right join customer c
	on r.customer_id = c.customer_id
where address_id = 602;


-- Averiguar cuantas veces ha rentado la persona 1
SELECT count(*) as totalveces
from customer c inner join rental r
	on c.customer_id = r.rental_id 
	where c.customer_id= 1;


-- A--------------------
SELECT c.customer_id, count(*) as total
from customer c inner join rental r
	on c.customer_id = r.rental_id 
GROUP by c.customer_id 
order by total DESC;



SELECT max(r.rental_date) as ultimarenta,
	   min(r.rental_date) as primerarenta
from rental r;

Start transaction

INSERT INTO student (nocontrol, fullname, )