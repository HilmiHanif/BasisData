create database per3sbasdat;
use per3sbasdat;


create table cabang(
id_cabang char(4) primary key,
jalan text not null,
kota varchar(25) not null,
kodepos char(5) unique
)engine= InnoDB;

create table pegawai(
nip char(3) primary key,
nama varchar(25) not null,
posisi varchar(25) not null,
tgl_masuk date not null,
gaji int not null,
id_cabang char(4) not null,
constraint fk_cabang
	foreign key(id_cabang) references cabang(id_cabang)
)engine=InnoDB;


insert into cabang
values 	('B001', 'Jl.Badak', 'Semarang', '50001'),
		('B002', 'Jl.Kartini', 'Kudus', '44076'),
        ('B003', 'Jl.Gajah', 'jepara', '44442'),
        ('B004', 'Jl.Kancil', 'Pati', '44808');
        
insert into pegawai
values 	('a01', 'Wahyu', 'asisten', '2020-01-09', 10000000, 'B001'),
		('a02', 'Devi', 'asisten', '2020-02-09', 15000000, 'B001'),
        ('m01', 'Budi', 'manager', '2020-03-09', 20000000, 'B003'),
        ('s01', 'Sari', 'supervisor', '2020-04-09', 25000000, 'B002');

select pegawai.nip, pegawai.nama, pegawai.id_cabang, cabang.kota from pegawai join cabang on (pegawai.id_cabang = cabang.id_cabang);