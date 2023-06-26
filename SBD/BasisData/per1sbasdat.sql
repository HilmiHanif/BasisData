create database sistemBasdat;
use sistemBasdat;

create table staf(
nip char(3) primary key,
nama varchar(25) not null,
posisi varchar(25) not null,
tunjangan int not null
)engine = InnoDB;

describe staf;
show columns from staf;
show tables;

insert into staf 
values	("M01", "John", "Manager", 7200000),
		("A01", "Doni", "Asisten", 3600000),
        ("S01", "Susanti", "Supervisor", 5400000);

select * from staf;

select nip, nama, posisi from staf where posisi = "manager";

select nip, nama, posisi, (tunjangan/12) as tunjangan_bulan from staf;

select nip, nama, tunjangan from staf where tunjangan > 4000000;


