create database education
use education

create table teachers(
teacher_id smallint,
teacher_name varchar(30),
sign_up date ,
constraint pk_teacher_id Primary Key (teacher_id) ); 


insert into teachers(teacher_id,teacher_name,sign_up)
values(1243,'Ayesha Malik','2022-05-09'),
(2235,'Ahmed Raza','2022-01-01'),
(1242,'Ali Raza','2022-10-10'),
(0921,'Ehtisham Raza','2022-08-08'),
(7809,'Hassaan Raza','2021-12-31'),
(8099,'Danish Jameel','2021-08-09'),
(1444,'Junaid Khan','2020-09-29'),
(3444,'Ahmed Jamil','2020-01-01')

select * 
from teachers

create table sales(
transaction_id smallint,
payment_date date,
group_id smallint,
paid_amount smallint,
constraint pk_transaction_id primary key (transaction_id),
constraint fk_group_id foreign key (group_id) 
references groupss (group_id))

create table groupss(
group_id smallint,
title varchar(50),
started_at date,
teacher_id smallint,
constraint pk_group_id primary key (group_id),
constraint fk_teacher_id foreign key (teacher_id) references teachers (teacher_id))


insert into sales(transaction_id,payment_date,group_id,paid_amount)
values (3434,'2022-06-09',11,400),
(4040,'2022-10-12',12,500),
(5050,'2022-09-01',11,500),
(7098,'2022-01-01',12,450),
(0909,'2022-01-02',13,560),
(1212,'2022-01-03',12,570),
(3409,'2022-01-09',13,780),
(7809,'2022-06-30',11,790)



insert into groupss(group_id,title,started_at,teacher_id)
values (11,'Programming','2022-01-31',1243),
(12,'R Programming','2021-11-15',2235),
(14,'Python Programming','2022-02-23',1242),
(13,'Machine Learning','2022-03-28',0921),
(15,'Data Science','2022-04-15',0921),
(16,'WordPress','2022-09-09',7809),
(17,'Data Analytics','2022-05-06',8099)


select * 
from sales

select max(paid_amount)
from sales as sa
join groupss as gp
on sa.group_id = gp.group_id
where gp.started_at>'2022-05-31' and gp.started_at <'2022-07-01'
union all 
select min(paid_amount)
from sales as sa
join groupss as gp
on sa.group_id = gp.group_id
where gp.started_at>'2022-05-31' and gp.started_at <'2022-07-01'




select gp.title,max(paid_amount)
from sales as sa
join groupss as gp
on sa.group_id = gp.group_id
group by gp.title
union all 
select gp.title,min(paid_amount)
from sales as sa
join groupss as gp
on sa.group_id = gp.group_id
group by gp.title


select gp.title,min(sa.paid_amount),max(sa.paid_amount)
from sales as sa
join groupss as gp
on sa.group_id = gp.group_id
group by gp.title
order by gp.teacher_id

select gp.title,count(sa.paid_amount)as Max_Quantity,count(distinct gp.group_id) as Min_Quantity
from sales as sa
join groupss as gp
on sa.group_id = gp.group_id
group by gp.title
order by gp.teacher_id




select gp.title,ta.teacher_name,min(sa.paid_amount),max(sa.paid_amount),count(sa.paid_amount)as Max_Quantity,count(distinct gp.group_id) as Min_Quantity
from sales as sa
join groupss as gp
on sa.group_id = gp.group_id
join teachers as ta
on ta.teacher_id = gp.teacher_id
group by gp.title,ta.teacher_name


