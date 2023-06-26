create database uts_sistem_basdat;
use uts_sistem_basdat;

create table barang (
id_barang int primary key,
id_kategori smallint not null,
nama_barang varchar(100) not null,
harga_barang int not null,
stok_barang smallint not null
)engine = InnoDB;

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


describe barang;

insert into barang
values 	(1, 1, 'RAM', 500000, 10),
		(2, 1, 'Mainboard', 1500000, 5),
        (3, 1, 'Mouse', 100000, 10),
        (4, 1, 'Mousepad', 80000, 8),
        (5, 1, 'Hardisk', 1250000, 4),
        (6, 2, 'Flashdisk', 150000, 10);
        
select * from barang;

describe pelanggan;

insert into pelanggan
values	(1, 'Anang', 'anang@yahoo.com', '0811000001'),
		(2, 'Beny', 'beny@gmail.com', '0815000001'),
        (3, 'Caca', 'caca@gmail.com', '08511000034'),
        (4, 'Dharma', 'dharma@gmail.com', '0811000036');

describe penjualan;

insert into penjualan
values	(1, '2022-10-03', 1, 1, 2),
		(2, '2022-10-3', 1, 3, 2),
        (3, '2022-10-04', 2, 2, 1),
        (4, '2022-10-04', 2, 3, 3),
        (5, '2022-10-05', 1, 1, 3),
        (6, '2022-10-05', 4, 3, 10);
        
describe barang;        

alter table barang
change stok_barang stok smallint not null; 

select * from  barang where harga_barang > 1000000 and stok > 5;

select nama_pelanggan, no_telp from pelanggan where nama_pelanggan like '%a';

select penjualan.id_transaksi, penjualan.tanggal_transaksi, pelanggan.id_pelanggan, pelanggan.nama_pelanggan, 
(barang.harga_barang * penjualan.jumlah_jual) as total_penjualan from penjualan join pelanggan on penjualan.id_pelanggan = pelanggan.id_pelanggan 
join barang on penjualan.id_barang=barang.id_barang having total_penjualan > 1000000;

select penjualan.id_transaksi, penjualan.tanggal_transaksi, pelanggan.id_pelanggan, pelanggan.nama_pelanggan, 
format(sum(barang.harga_barang * penjualan.jumlah_jual), 0) as total_penjualan from penjualan join pelanggan on penjualan.id_pelanggan = pelanggan.id_pelanggan 
join barang on penjualan.id_barang=barang.id_barang group by id_pelanggan;

select sum(barang.harga_barang * penjualan.jumlah_jual) as total_penjualan from penjualan 
join barang on penjualan.id_barang=barang.id_barang; 



select * from penjualan;












