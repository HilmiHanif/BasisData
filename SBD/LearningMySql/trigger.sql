create database procedureTrigger;
use procedureTrigger;

-- Table

create table barang (
kode_brg char(3),
nama_brg varchar(25),
satuan varchar(10),
jml_stok int(5),
primary key(kode_brg)
)engine=InnoDB;


create table jual (
kode_jual char(2),
nama_kons varchar(25),
alamat_kons text,
kota_kons varchar(25),
tgl_jual date,
jml_jual int(4),
kode_brg char(3),
primary key(kode_jual)
)engine=InnoDB;

create table beli (
kode_beli char(2),
nama_supplier varchar(25),
tgl_beli date,
jml_beli int(4),
kode_brg char(3),
primary key(kode_beli)
)engine=InnoDB;

show create table barang;

insert into barang(kode_brg, nama_brg, satuan, jml_stok)
values 	("111", "Sepatu Adidas","Pasang", 30),
		("222", "Sepatu Nike","Pasang", 25),
        ("333", "Jaket Bomber","Buah", 40 );

select * from barang;

-- procedure

Delimiter $$ 
create procedure insertDataJual (
	 xkode_jual char(2),
	 xnama_kons varchar(25),
	 xalamat_kons text,
	 xkota_kons varchar(25),
	 xtgl_jual date,
	 xjml_jual int(4),
     xkode_brg char(3)
) 
begin 
	insert into jual values(
		xkode_jual,
        xnama_kons,
		xalamat_kons,
		xkota_kons,
		xtgl_jual,
		xjml_jual,
        xkode_brg
        );
	select * from jual;
end $$ 
Delimiter ;

call insertDataJual("12", "Hilmi Hanif", "Jl.Mangga","Purwodadi", now(), 5, 111 );

select * from barang;


delimiter $$
create procedure insertDataBeli (
	xkode_beli char(2),
	xnama_supplier varchar(25),
	xtgl_beli date,
	xjml_beli int(4),
	xkode_brg char(3)
)
begin 
	insert into beli
	value (
		xkode_beli,
		xnama_supplier,
		xtgl_beli,
		xjml_beli,
		xkode_brg
	);
    select * from beli;
end$$
delimiter ;

select * from barang;
select * from beli;
call insertDataBeli("22", "Hilmi Hanif", now(), 35, "222");

select * from barang;
call insertDataBeli("21", "Bambang", now(), 10, 222);


-- trigger

delimiter $$
create trigger insertJual 
	after insert
    on jual
    for each row
begin 
	update barang set jml_stok = jml_stok - new.jml_jual where kode_brg=new.kode_brg;
end$$
delimiter ;


select * from barang;

delete from jual where kode_jual = "12";

delimiter $$
create trigger deleteJual 
	after delete
	on jual
	for each row
begin
	update barang 
    set jml_stok = jml_stok + old.jml_jual 
    where kode_brg = old.kode_brg;
end$$
delimiter ;


delimiter $$
create trigger insertBeli
	after insert
    on beli
    for each row
begin 
	update barang 
    set jml_stok = jml_stok + new.jml_beli 
    where kode_brg=new.kode_brg;
end$$
delimiter :


delimiter $$
create trigger deleteBeli
	after delete 
    on beli
    for each row
begin 
	update barang
    set jml_stok = jml_stok - old.jml_beli
    where kode_brg=old.kode_brg;
end$$
delimiter :

         
delimiter $$
create trigger updateBeli
	before update
    on beli
    for each row 
begin 
	update barang
    set jml_stok = (jml_stok + old.jml_beli) - new.jml_beli 
    where kode_brg = old.kode_brg;
end$$
delimiter ;

delimiter $$
create trigger updateJual
	after update 
    on jual
    for each row 
begin
	update barang
    set jml_stok = (jml_stok + old.jml_jual) - new.jml_jual 
    where kode_brg = old.kode_brg;
end$$
delimiter ;

select * from barang;

call insertDataJual("21", "Hilmi Hanif", "Jl.Mangga", "Purwodadi", now(), 10, "333");

update jual
set jml_jual = 30
where kode_jual = "21";


-- alter table barang
-- add column 

select * from beli;

insert into barang 
values 	("111", "Sandal", "Pasang", 30 ),
		("222", "Sepatu", "Pasang", 35 ),
        ("333", "Tas", "Buah", 30);

call insertDataBeli("12", "Bambang", now(), 5, 111);
call insertDataBeli("13", "Yanto", now(), 15, 333);




delete from beli where kode_beli = "22";

select * from barang;

update beli
set jml_beli = 15
where kode_beli = "22";

insert into barang 
values 	("111", "Sepatu", "Pasang", 30),
		("222", "Sandal", "Pasang", 35),
        ("333", "Kaos", "Buah", 20),
        ("444", "Topi", "Buah", 10),
        ("555", "Jaket", "Buah", 25);
	
call insertDataJual("12", "Hilmi Hanif", "Jl.Mangga", "Purwodadi", now(), 5, "111");

call insertDataBeli("21", "Bambang", now(), 10, "222");

delete from jual where kode_jual = "12"; 

select * from barang;

delete from beli where kode_beli = "21";

call insertDataJual("13", "Lidia Suharyanti", "Jl.Pepeya", "Grobogan", now(), 15, "333");
call insertDataBeli("22", "Sumiyanto", now(), 20, "555");

select * from barang;

update barang
set jml_stok = 20
where kode_brg = "333";


update jual
set jml_jual = 5
where kode_jual = "13";

update beli
set jml_beli = 15
where kode_beli = "22"; 

select * from barang;

drop trigger updateBeli;

delimiter $$
create trigger updateBeli
	before update
    on beli
    for each row 
begin 
	update barang
    set jml_stok = (jml_stok - old.jml_beli) + new.jml_beli 
    where kode_brg = old.kode_brg;
end$$
delimiter ;







-- drop trigger insertDataJual;

-- call insertDataJual;



















-- Delimiter $$ 
-- create procedure insertDataJual (
-- 	in xkode_jual char(2),
-- 	in xnama_kons varchar(25),
-- 	in xalamat_kons text,
-- 	in xkota_kons varchar(25),
-- 	in xtgl_jual date,
-- 	in xjml_jual int(4),
--     in xkode_brg char(3)
-- ) 
-- begin 
-- 	insert into jual(
-- 		kode_jual,
--         nama_kons,
-- 		alamat_kons,
-- 		kota_kons,
-- 		tgl_jual,
-- 		jml_jual,
--         kode_brg)
--     values(
-- 		xkode_jual,
--         xnama_kons,
-- 		xalamat_kons,
-- 		xkota_kons,
-- 		xtgl_jual,
-- 		xjml_jual,
--         xkode_brg
--         );
-- 	select * from jual;
-- end $$ 
-- Delimiter ;

