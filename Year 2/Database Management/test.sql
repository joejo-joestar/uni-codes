use 20220019db;

drop table salesman;
create table salesman (
	salesid int primary key,
    sname char(20),
    city char(20),
    commission float(2)
);

alter table salesman
add	createddate date,
add createdby varchar(30);

insert into salesman 
values 	(5001, 'James Hoog', 'New York', 0.15),
		(5002, 'Nail Knite', 'Paris', 0.13),
		(5005, 'Pit Alex', 'London', 0.11),
		(5006, 'Mc Lyon', 'Paris', 0.14),
		(5003, 'Lauson Hen', NULL, 0.12),
		(5007, 'Paul Adam', 'Rome', 0.13);

select * from salesman
order by salesid;

drop table customer;
create table customer (
	custid int primary key,
    cname char(20),
    city char(20),
    grade int,
    salesid int,
    foreign key (salesid) references salesman (salesid) on delete cascade
);

insert into customer 
values 	(3002, 'Nick Rimando', 'New York', 100, 5001),
		(3005, 'Graham Zusi', 'California', 200, 5002),
		(3001, 'Brad Guzan', 'London', NULL, 5005),
		(3004, 'Fabian Johns', 'Paris', 300, 5006),
		(3007, 'Brad Davis', 'New York', 200, 5001),
		(3009, 'Geoff Camero', 'Berlin', 100, 5003),
		(3008, 'Julian Green', 'London', 300, 5002),
		(3003, 'Jozy Altidor', 'Moscow', 200, 5007);

select city, count(city) from customer
group by city
order by city desc;

select * from customer;

create table tab1 (
	custid int primary key,
	city char(20)
);

-- triggers
delimiter $$
create trigger tg1 before
update on customer for each row
	begin
		insert into tab1
        values (old.custid, old.city);
	end;

$$ delimiter ;

drop trigger tg1;

select * from tab1;

update customer
set city = 'London'
where city is NULL;

truncate customer;

-- triggers
delimiter $$
create trigger tg2 before
insert on salesman for each row
	begin
		declare vuser varchar(30);
        select user() into vuser;
        set new.createddate = sysdate();
        set new.createdby = vuser;
    end;

$$ delimiter ;

insert into salesman (salesid, sname, city, commission)
values 	(5011, 'Hello Wkb', 'New York', 0.20),
		(5010, 'Knif Keor', 'California', 0.19);

create table deletedsalesman (
	deletedby varchar(20),
    deletedon date,
    salesid int
);
-- triggers
delimiter $$
create trigger tg3 after delete
on salesman for each row
	begin
		declare vuser varchar(30);
        select user() into vuser;
        insert into deletedsalesman
        values (vuser, sysdate(), old.salesid);
    end;
 $$ delimiter ;
 
 delete from salesman
 where salesid = 5011;
 
 select * from deletedsalesman;
 
 --  functions
 drop function gettotsales;
 delimiter $$
 create function gettotsales()
 returns int
 reads sql data
	begin
		declare totalsales int;
        select count(*) into totalsales from salesman;
        return totalsales;
	end$$
delimiter ;

select gettotsales();
select * from salesman;

-- procs
drop procedure addcustname;
delimiter $$
create procedure insertcust(in pcustid int, pcity char(30))
	begin
		insert into customer (custid, city) value (pcustid, pcity);
    end $$
delimiter ;

delimiter $$
create procedure addcustname(in pcustid int, pname char(30))
	begin
		update customer 
        set cname = pname
        where custid = pcustid;
    end $$
delimiter ;

call insertcust(3010, 'Paris');

select * from customer;

call addcustname(3010, 'Kanye Omari West');
call insertcust(3011, 'Paris');
call addcustname(3011, 'Shawn Corey Carter');

use 20220019db;

create table booth (
	bid int primary key,
    binch char(20),
	bloc char(20)
);

create table voter (
	vid int primary key,
    vname char(30),
    bid int,
    vgender char(1),
    checkv int check(checkv in (0, 1)),
    foreign key (bid) references booth (bid)
);

insert into booth values
	(1, 'agarwaal', 'delhi'),
	(2, 'aarwaal', 'kerala'),
	(3, 'agawaal', 'china'),
	(4, 'agaraal', 'dehi'),
	(5, 'agarwal', 'deli');
    
insert into voter values
	(1, 'feswf', 1, 'm', 0),
	(2, 'fswf', 3, 'm', 0),
	(3, 'fsf', 1, 'm', 0),
	(4, 'fewf', 2, 'm', 0),
	(5, 'few', 1, 'm', 0),
	(6, 'fef', 2, 'm', 0),
	(7, 'ff', 2, 'm', 0),
	(8, 'eswf', 1, 'm', 0),
	(9, 'swf', 1, 'm', 0);

update voter
set checkv = 0
where vid = 5;

select bid, binch
from booth
where bid = (
	select bid
	from (
		select v.bid, count(v.bid)
        from voter v
        group by v.bid
        order by count(v.bid) desc limit 1
	) x
);

delimiter $$
create function getperc(fbid int)
returns decimal (5, 2)
reads sql data
begin
	declare totalvoter int;
    declare totalvoted int;
    declare avgvoter decimal(5, 2);
    select count(vid) into totalvoter from voter
    where bid = fbid;
    
    select count(vid) into totalvoted from voter
    where checkv = 1
    and bid = fbid;
    
    set avgvoter = (totalvoted/totalvoter) * 100;
    return avgvoter;
end $$
delimiter ;
drop function getperc;

show triggers;

-- declare perc decimal(5,2)
select getperc(2);

drop table updatevoter;

create table updatevoter (
	vuser varchar(30),
    vtime date
);

create table test (
	vuser varchar(30),
    vtime date,
    vid int,
    bfrup int,
    aftup int
);

select * from test;

drop trigger tg4;

delimiter $$
create trigger tg4 after update
on voter for each row
	begin
		declare vuser varchar(30);
        select user() into  vuser;
        insert into updatevoter values (vuser, sysdate());
    end $$
delimiter ;

select * from updatevoter;

drop trigger tg5;

delimiter $$
create trigger tg5 before update
on voter for each row
	begin
		declare vuser varchar(30);
        select user() into  vuser;
        insert into test values (vuser, sysdate(), old.vid, old.checkv, new.checkv);
    end $$
delimiter ;

update voter
set checkv = 0
where vid = 5;

select * from test;

delimiter $$
create procedure p1 (in pvid int, pvgen char(1))
begin
	update voter
    set vgender = pvgen
    where vid = pvid;
end$$
delimiter ;

call p1(1, 'f');

select * from voter;

delimiter $$
create function retavg (fbid int)
returns boolean
reads sql data
begin
	delete from voter
    where bid = fbid;
    return true;
end $$
delimiter ;
select * from voter;

select retavg(1);