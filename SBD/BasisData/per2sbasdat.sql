create database olshop;
use olshop;

create table produk (
id_produk char(5) primary key,
nama varchar(35) not null,
merk varchar(35) not null,
satuan varchar(35) not null,
harga int not null
)engine = InnoDB;

insert into produk 
values 	('ATK01', 'Kertas Fotocopy A4 70gr', 'Sidu', 'Rim', 30000),
		('COM01', 'Speaker N730', 'Advance', 'Buah', 250000),
        ('MEB01', 'Rak 4 Pintu', 'Universe', 'Buah', 200000);

select * from produk;

alter table produk
add column id_kategori int;

alter table produk 
add column id_penjual int;
 
alter table produk
change nama nama_produk varchar(35) not null;

alter table produk
modify nama_produk varchar(200);

alter table produk
change harga harga_satuan int not null; 

alter table produk
drop column merk;

select * from produk;


create table branch(
branchNo char(4) primary key,
street varchar(25) not null,
city varchar(25) not null,
postcode char(7) not null
)engine = InnoDB;


create table staf(
staffNo varchar(5) primary key,
fName varchar(25) not null,
lName varchar(25) not null,
positionn varchar(25) not null,
sex char(1) not null,
dob date not null,
salary int not null,
branchNo char(4),
constraint fk_branch
	foreign key(branchNo) references branch(branchNo)
)engine = InnoDB;





