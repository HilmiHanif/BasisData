create database sbd1;
use sbd1;

create table buku (
id char(3) primary key,
judul varchar(30)
)engine InnoDB;

create table film(
id char(3) primary key,
judul varchar(30)
)engine InnoDB;


insert into buku
values 	('B01', 'Dilan 1990'),
		('B02', 'Laskar Pelangi'),
        ('B03', 'Ayat-Ayat Cinta'),
        ('B04', 'Pengggantar Basis Data'),
        ('B05', 'Big Data for Dummies');
        
insert into film 
values 	('F01', 'Dilan 1990'),
		('F02', 'Laskar Pelangi'),
        ('F03', 'Ayat-Ayat Cinta'),
        ('F04', 'Pengggantar Basis Data'),
        ('F05', 'Big Data for Dummies');

select * from film;


-- union
select judul from buku union select judul from film;

-- union all
select judul from buku union all select judul from film;

-- minus/expect
-- select judul from buku except select judul from film;

-- instersect
-- select judul from buku intersect select judul from film;


create table kategori (
id_kategori char(3) primary key,
jenis varchar(20)
)engine InnoDB;

create table produk(
id_produk char(3) primary key,
merk varchar(20),
id_kategori char(3),
constraint fk_kategori
	foreign key (id_kategori) references kategori(id_kategori)
)engine InnoDB;

insert into kategori 
values	('001', 'Handphone'),
		('002', 'Laptop'),
        ('003', 'Tablet'),
        ('004', 'Kamera'),
        ('005', 'Gamming');

select * from kategori;

insert into produk
values 	('P01', 'Xiaomi', '001'),
		('P02', 'Samsung', '001'),
        ('P03', 'Asus', '002'),
        ('P04', 'Dell', '002'),
        ('P05', 'Apple', '003'),
		('P06', 'Nikon', '004'),
        ('P07', 'Playstation', null);
        
select * from produk;


		
-- inner join
select * from produk inner join kategori on (produk.id_kategori = kategori.id_kategori);

-- manual inner join
select * from produk, kategori where produk.id_kategori = kategori.id_kategori;

-- natural join (kolom yang sama akan dimunculkan satu kali)
select * from produk natural join kategori;

-- left join kiri(semua data dimunculkan meskipun relasi bernilai null)
select * from produk left outer join kategori on (produk.id_kategori = kategori.id_kategori);

-- left join dengan select satu per satu colom
select produk.id_produk, produk.merk, produk.id_kategori, kategori.jenis from produk left outer join kategori on 
(produk.id_kategori = kategori.id_kategori);

-- right join kanan
select * from produk right outer join kategori on (produk.id_kategori = kategori.id_kategori);

-- left join dengan select satu per satu colom
select produk.id_produk, produk.merk, produk.id_kategori, kategori.jenis from produk right outer join kategori on 
(produk.id_kategori = kategori.id_kategori);

-- cross join (explisit) menggabungkan 2 tabel berupa cartesian produk(kebawah)
select * from produk cross join kategori;
 
--  cross join (implisit)
 select * from produk, kategori; 
 

