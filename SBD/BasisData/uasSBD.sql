create database uas13491;
use uas13491;

drop database test;

create table barang (
id_barang int primary key,
id_kategori smallint not null,
nama_barang varchar(100) not null,
harga_barang int not null,
stok_barang smallint not null
)engine = InnoDB;

describe barang;

create table pelanggan(
id_pelanggan int primary key,
nama_pelanggan varchar(100) not null,
email varchar(100) not null,
no_telp varchar(50) not null
)engine = InnoDB;

describe pelanggan;

create table penjualan(
id_transaksi int primary key,
tanggal_transaksi date not null,
id_pelanggan int not null,
id_barang int not null,
jumlah_jual smallint not null,
constraint fk_pelanggan
	foreign key (id_pelanggan) references pelanggan(id_pelanggan),
constraint fk_barang
	foreign key (id_barang) references barang(id_barang)
)engine = InnoDB;


describe penjualan;


insert into barang
values 	(1, 1, 'RAM', 500000, 10),
		(2, 1, 'Mainboard', 1500000, 5),
        (3, 1, 'Mouse', 100000, 10),
        (4, 1, 'Mousepad', 80000, 8),
        (5, 1, 'Hardisk', 1250000, 4),
        (6, 2, 'Flashdisk', 150000, 10);
        
        
 select * from barang;       
        
insert into pelanggan
values	(1, 'Anang', 'anang@yahoo.com', '0811000001'),
		(2, 'Beny', 'beny@gmail.com', '0815000001'),
        (3, 'Caca', 'caca@gmail.com', '0811000034'),
        (4, 'Dharma', 'dharma@gmail.com', '0811000036');

select * from pelanggan;

insert into penjualan
values	(1, '2022-10-03', 1, 1, 2),
		(2, '2022-10-3', 1, 3, 2),
        (3, '2022-10-04', 2, 2, 1),
        (4, '2022-10-04', 2, 3, 3),
        (5, '2022-10-05', 1, 1, 3),
        (6, '2022-10-05', 4, 3, 10);
        
use uas13491;

select * from penjualan;

select penjualan.id_transaksi, pelanggan.id_pelanggan, pelanggan.nama_pelanggan, 
format((barang.harga_barang * penjualan.jumlah_jual),0) as total_penjualan from penjualan join 
pelanggan on (penjualan.id_pelanggan = pelanggan.id_pelanggan) join barang 
on (penjualan.id_barang=barang.id_barang) group by id_pelanggan having total_penjualan > 3000000;

Delimiter $$
create procedure SP1(in kyid_pelanggan int, in upnama_pelanggan varchar(100))
begin
	update pelanggan
    set nama_pelanggan = upnama_pelanggan
    where id_pelanggan = kyid_pelanggan;
end$$
Delimiter ;

select * from pelanggan;

call SP1(1, "Anang");


describe pelanggan;

Delimiter $$
create procedure insert_pelanggan_upper(
	kyid_pelanggan int,
	in_nama_pelanggan varchar(100),
	in_email varchar(100),
	in_no_telp varchar(50)
)
begin
	insert into pelanggan
	values (kyid_pelanggan, upper(in_nama_pelanggan), upper(in_email), in_no_telp);
end$$
Delimiter ;

select * from pelanggan;

drop procedure insert_pelanggan_upper;

call insert_pelanggan_upper(5, 'hilmi', 'hilmi@gmail.com', '1234567');

use uas13491;

create user 'agus'@'localhost' identified by 'agus123';
create user 'joko'@'localhost' identified by 'joko123';

grant all privileges on uas13491.* to 'agus'@'localhost';
grant select on uas13491.barang to 'joko'@'localhost';

revoke select on uas13491.barang from 'Joko'@'localhost';

drop user 'Joko'@'localhost';

create database test;
