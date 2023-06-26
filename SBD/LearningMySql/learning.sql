create database belajar_mysql;
use belajar_mysql;

create table barang (
	id varchar(10),
    nama varchar(50) not null,
    deskrpsi text,
    harga int not null,
    jumlah int not null,
    waktu timestamp not null default current_timestamp,
    primary key(id)
) engine=InnoDB;

drop table barang;

describe barang;
show create table barang;

alter table barang
add column deskripsi text;

alter table barang
modify deskripsi text after nama;

alter table barang
drop column deskrpsi;

alter table barang
add column gambar varchar(200) after harga;

alter table barang
drop column gambar;

-- alter table barang
-- rename column nama to nama_baru varchar(50) not null;

alter table barang
modify nama varchar(100) not null;

alter table barang
add column deskripsi varchar(200) not null after nama;

insert into barang (nama, deskripsi, harga, jumlah)
values ("Laptop", "Barang Mahal", 1200, 12);

alter table barang
modify harga int not null default 0;

alter table barang
modify jumlah int not null default 0;

alter table barang
add column waktu timestamp not null default current_timestamp;

select * from barang;

insert into barang(id, nama, deskripsi, harga, jumlah)
values ("P0002", "Mie Ayam Bakso","Mie Ayam Original + Bakso", 15000, 15);

insert into barang(id, nama, harga, jumlah)
values 	("P0003", "Mie Ayam Ceker", 20000, 100),
		("P0004", "Mie Ayam Spesial", 25000, 100),
		("P0005", "Mie Ayam Yamin", 15000, 100);
        
select id, nama, harga from barang;
select nama, harga from barang;
select * from barang where jumlah = 100;

alter table barang
add column kategori enum("Makanan", "Minuman", "Lain-Lain") after nama;

update barang
set kategori = "Makanan"
where id = "P0001";

update barang
set kategori = "Makanan",
	deskripsi = "Mie Ayam + Ceker"
where id = "P0003";

update barang 
set harga = harga - 3000
where id = "P0001";

insert into barang(id, nama, harga, jumlah)
values("P0008", "Tai Kucing", 2000, 15);

delete from barang where id = "P0008"; 


insert into barang (id, nama, kategori, harga, jumlah)
values	("P0006", "Es Teh", "Minuman", 3000, 500),
		("P0007", "Es Jeruk", "Minuman", 4000, 500),
        ("P0008", "Air Putih", "Minuman", 1000, 1000);

insert into barang (id, nama, kategori, harga, jumlah)
values	("P0009", "Kerupuk", "Lain-Lain", 1000, 500),
		("P0010", "Es Krim", "Lain-Lain", 5000, 100),
        ("P0011", "Gorengan", "Lain-Lain", 500, 250);


	
select id, nama, harga 
from barang where harga <= 20000;

select id, nama, harga, kategori
from barang where kategori = "Minuman";

select * from barang where kategori != "Minuman";

select id, nama, harga, kategori
from barang where harga >= 3000 and kategori = "Minuman";

select id, nama, harga, kategori, jumlah
from barang where harga <= 20000 and jumlah <= 100;  

select * from barang where nama like "%mie%";

select * from barang where deskripsi is null;

select * from barang where deskripsi is not null;

select * from barang where harga between 12000 and 	20000;

select * from barang where harga between 1000 and 	5000;

select * from barang where kategori in ("Makanan", "Lain-Lain");

select * from barang where kategori not in ("Makanan", "Minuman");

select * from barang order by harga asc, id desc;

select id, nama, kategori from barang order by kategori desc;

select * from barang order by id desc limit 5;

select * from barang order by id asc limit 5, 5;

update barang
set kategori = "Makanan"
where id = "P0005";

select distinct kategori from barang;

select id, nama, harga, harga div 1000 as "Harga dalam K" from barang;

select id, nama, 
	length(nama) as "Nama Length",
	lower(nama) as "Nama Lower",
    upper(nama) as "Nama Upper"
from barang;

select id, nama, year(waktu) as Tahun, month(waktu) as Bulan, day(waktu) as Tanggal from barang;

select id, nama,
	case kategori
		when "Makanan" then "Enak"
        when "Minuman" then "Segar"
        else "Apa it"
        end as "Kategori"
from barang;


select id, nama, harga,
	if(harga <= 5000, "Murah",
    if (harga <= 15000, "Sedang", "Mahal")
    ) as "Mahal?"
from barang;

select id, nama, ifnull(deskripsi, 'kosong') as Deskripsi from barang;
		
select count(id) as "Total Barang" from barang;
select max(harga) as "Harga Termahal" from barang;
select min(harga) as "Harga Termurah" from barang;
select avg(harga) as "Rata-Rata" from barang;
select sum(harga) as "Total Harga" from barang;
select sum(jumlah) as "Total Barang" from barang;


select count(id) as "Total Barang", kategori from barang group by kategori;

select sum(jumlah) as "Total Minuman", kategori from barang group by kategori;

select min(harga) as "Harga", Kategori from barang group by kategori;
select max(harga) as "Harga", Kategori from barang group by kategori;

select count(id) as "Total", kategori from barang group by kategori having total > 3;


describe barang;
select * from barang;

insert into barang(id, nama, kategori, harga, jumlah)
values("P0012", "Permen", "Lain-Lain", 500, 250);

alter table barang
add constraint harga_cek check (harga >= 200);

insert into barang(id, nama, kategori, harga, jumlah)
values("P0013", "tai", "Lain-Lain", 100, 250);

delete from barang where id = "P0013";

alter table barang
	add fulltext cari_barang (nama, deskripsi);
    
select * from barang 
	where match(nama, deskripsi)
		against("bakso" in natural language mode);	

select * from barang 
	where match(nama, deskripsi)
		against("+mie -yamin" in boolean mode);	



describe barang;
select * from barang;




show create table barang;


create table customer (
id int auto_increment,
nama varchar(50) not null,
email varchar(50) not null,
primary key(id),
unique key email_uniq (email)
) engine=InnoDB;
 
 
describe customer;
 
 insert into customer (nama, email)
 values ("Hilmi Hanif", "hilmi@gmail.com");

 insert into customer (nama, email)
 values ("Ahmad Rajendra", "rajendra@gmail.com");

describe barang;
show create table barang;

create table daftar_barang(
id int auto_increment,
id_barang varchar(10),
deskripsi text,
primary key (id),
constraint fk_daftarBarang_barang
		foreign key (id_barang) references barang (id)
) engine = InnoDB; 



insert into daftar_barang(id_barang, deskripsi)
values 	("P0001", "Makanan Kesukaan"),
		("P0007", "Minuman Kesukaan");
        
show create table customer;

alter table daftar_barang
add column id_customer int after id_barang;

alter table daftar_barang
add constraint fk_daftarBarang_customer
foreign key (id_customer) references customer(id);
 
select * from daftar_barang;

update daftar_barang
set id_customer = 3
where id = 2;

select customer.nama, barang.nama, barang.harga from daftar_barang 
		join barang on (daftar_barang.id_barang = barang.id) 
        join customer on(daftar_barang.id_customer = customer.id);
        
	
select barang.nama, barang.harga from daftar_barang join barang on (daftar_barang.id_barang = barang.id);

create table dompet (
id int auto_increment,
id_customer int not null,
jumlah_uang int not null default 0,
primary key (id),
unique key uk_id_customer (id_customer),
constraint fk_dompet_customer 
	foreign key (id_customer) references customer (id)
) engine=InnoDB;

insert into dompet(id_customer, jumlah_uang)
values (1, 125000);

select * from customer;

select dompet.jumlah_uang, customer.nama  from dompet join customer on (dompet.id_customer = customer.id);

create table kategori (
id varchar(10),
nama varchar(50) not null,
primary key(id)
) engine=InnoDB;

alter table barang
drop column kategori;

alter table barang
add column id_kategori varchar(10);

alter table barang
	add constraint fk_barang_kategori
    foreign key (id_kategori) references kategori (id);

insert into kategori(id, nama)
values 	("C0001", "Makanan"),
		("C0002", "Minuman"),
        ("C0003", "Lain-Lain");

select * from barang;

update barang 
set id_kategori = "C0001"
where id in ("P0001", "P0002", "P0003", "P0004", "P0005");


update barang 
set id_kategori = "C0002"
where id in ("P0006", "P0007", "P0008");

update barang 
set id_kategori = "C0003"
where id in ("P0009", "P0010", "P0011", "P0012");

select Film.judul, Film.sutradara, Produser.namaProduser from Rating join Film on (FID.Rating = FID.Film) join Produser on  (FID.Rating = FID.Produser); 

select barang.id, barang.nama,  barang.harga, kategori.id, kategori.nama from barang join kategori on(kategori.id = barang.id_kategori);

describe dompet;

create table orders (
id int auto_increment,
total int not null,
order_date timestamp not null default current_timestamp,
primary key(id) 
) engine=InnoDB; 

insert into orders (total)
values (50000);

create table orders_detail (
id_barang varchar(10),
id_order int,
harga int not null,
jumlah int not null,
primary key(id_barang, id_order)
) engine=InnoDB;


alter table orders_detail 
	add constraint fk_orders_detail_barang
    foreign key (id_barang) references barang (id);
    
alter table orders_detail
	add constraint fk_orders_detail_orders
    foreign key(id_order) references orders (id);

insert into orders_detail(id_barang, id_order, harga, jumlah)
values 	("P0001", 1, 25000, 1),
		("P0002", 1, 25000, 1);
        
insert into orders_detail(id_barang, id_order, harga, jumlah)
values 	("P0003", 2, 25000, 1),
		("P0004", 3, 25000, 1);       

select * from kategori;
show create table barang;
use belajar_mysql;

select * from kategori left join barang on (barang.id_kategori = kategori.id);

select * from barang where harga > (select avg(harga) from barang);
select avg(harga) as "Rata-Rata" from barang;

select max(harga) from (select harga from kategori join barang on (barang.id_kategori = kategori.id)) as cp;

create table bukutamu (
id int auto_increment,
email varchar(100) not null,
judul varchar(100) not null,
konten text,
unique key email_uniq (email),
primary key(id)
) engine=InnoDB;

describe bukutamu;

use belajar_mysql;

select distinct email from bukutamu 
union
select distinct email from customer;

insert into bukutamu(email, judul, konten)
values 	("hilmi@gmail.com", "Hallo", "Hallo"),
		("rejendra@gmail.com", "Hallo", "Hallo"),
        ("random@gmail.com", "Hallo", "Hallo");

update bukutamu
set email = "salsabila@gmail.com"
where id = 2;

select * from customer;

insert into customer(nama, email)
values ("Salsabla Aisy", "salsabila@gmail.com");


select email from bukutamu
union 
select email from customer;

select distinct email from bukutamu
union all
select distinct email from customer;

use belajar_mysql;

select * from barang;

insert into barang (id,nama,harga, jumlah, id_kategori)
values ("P0013", "Telur Dadar", 3000, 100, "C0003");

select * from barang;



start transaction;

insert into bukutamu(email, judul, konten)
values 	("wildan@gmail.com","Hallo", "Hallo"),
		("lidia@gmail.com", "Hallo", "Hallo"),
        ("hanun@gmail.com", "Hallo", "Halo");

select * from bukutamu;

commit;

start transaction;

update bukutamu
set email = "lidasuahrayanti@gmail.com"
where id = 8;

select * from bukutamu;

rollback;


start transaction;

select * from bukutamu;

update bukutamu
set judul = "Ini diubah oleh oleh Hilmi"
where id = 1;

commit;

start transaction;

select * from bukutamu;

update bukutamu
set judul = "Ini diubah oleh oleh Hilmi2"
where id = 1;

commit;




start transaction;

select * from barang;

select * from barang where id = "P0001" for update;

update barang 
set jumlah = jumlah - 5
where id = "P0001";

commit;

select * from barang;

start transaction;

select * from barang where id = "P0001" for update;

update barang
set jumlah = jumlah - 5
where id = "P0001";

commit;

select * from barang;




-- user management

create user 'Hilmi'@'localhost';
create user 'Hanif'@'%';

drop user 'Hilmi'@'localhost';
drop user 'Hanif'@'%';

grant select on belajar_mysql.* to  'Hilmi'@'localhost';
grant select, insert, update, delete on belajar_mysql.* to 'Hanif'@'%';

show grants for 'Hilmi'@'localhost';
show grants for 'Hanif'@'%';

REVOKE DELETE, UPDATE ON contacts FROM 'smithj'@'localhost'

-- REVOKE SELECT ON belajar_mysql.* from 'Hilmi'@'localhost';

-- revoke select, insert, update, delete, on belajar_mysql from 'Hanif'@'%';

-- revoke select on belajar.mysql.* from 'Hilmi'@'localhost';


