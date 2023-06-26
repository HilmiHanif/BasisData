create database db_usaha;
use db_usaha;

create table branch (
id_cabang char(4) primary key,
alamat varchar(25) not null,
kota varchar(25) not null,
kodepos char(5) not null
)engine = InnoDB;

create table staf(
nip char(3) primary key,
nama varchar(25) not null,
posisi varchar(25) not null,
tgl_masuk date not null,
gaji int not null
)engine = InnoDB;

alter table staf
add column id_cabang char(4) after nip;

alter table staf
	add constraint  fk_staftobranch 
		foreign key (id_cabang) references branch(id_cabang);
        
        
insert into staf
values 	('A02', 'B002', 'Devi', 'Asisten', '2022-09-24', 3500000),
		('S02', 'B002', 'Leni', 'Supervisor', '2022-10-04', 4000000);


update staf
set id_cabang = 'B001'
where nip = 'A01';


update staf
set id_cabang = 'B001'
where nip = 'M01';


update staf
set id_cabang = 'B001'
where nip = 'S01';

select * from branch;
select * from staf;

-- Latihan

select * from staf where gaji between 3000000 and 8000000;
select * from staf where nip like 'a%';
select * from staf where nip like '%1';
select * from staf where nip like 'a__';
select * from staf where posisi like '%asist%';
select * from staf where nip not like 'a%';
select * from staf where posisi in ('manager', 'asisten');
select * from staf where posisi not in ('manager', 'asisten');
select * from staf order by gaji asc;
select * from staf order by gaji desc;
select * from staf order by posisi, gaji;
select posisi, count(nip) as total_pegawai from staf group by posisi;
select max(gaji) as gaji_tertinggi from staf;
select min(gaji) as gaji_terendah from staf;
select avg(gaji) as rata_rata_gaji from staf;
select count(nip) as total_pegawai from staf;









describe staf;









insert into branch
values	('B001', 'Imam bonjol', 'Semarang', '50131'),
		('B002', 'Laweyan', 'Solo', '57148'),
        ('B003', 'Kaliurang', 'Yogyakarta', '56483');

insert into staf
values	('A01', 'Wahyu', 'Asisten', '2014-08-10', 5000000),
		('M01', 'Budi', 'Manager', '1996-01-01', 10000000),
        ('S01', 'Sari', 'Supervisor', '2000-02-05', 7500000);



select * from staf;
        
select nip, nama, posisi, gaji, (gaji * 12) as gaji_setahun from staf; 		-- Menampilkan Gaji dalam satu tahun 

select nip, nama, posisi, (gaji * 0.2)  as tunjangan from staf;			-- Menampilkan tunjangan dengan rumus 0.2 * gaji

select nip, nama, posisi, (gaji + (gaji * 0.2)) as gaji_total from staf;		-- Menampilkan "Total gaji" dengan gaji + tunjangan

select nama, posisi, tgl_masuk, year(curdate()) - year(tgl_masuk) as masa_kerja from staf;	-- masa kerja pegawai 

select * from staf where posisi = 'manager';		-- Menampilkan data karyawan dengan posisi Manajer.

select *, (gaji * 0.2) as tunjangan from staf having tunjangan > 500000; 	-- data karyawan dengan tunjangan lebih dari 500.000.

select * from staf where posisi != 'manager';		-- Menampilkan data karyawan dengan posisi tidak sama dengan manajer.

select * from staf where posisi = 'manager' or posisi = 'supervisor';	-- Menampilkan data karyawan yang posisinya Manajer atau Supervisor.

select *, year(curdate()) - year(tgl_masuk) as masa_kerja from staf where posisi = 'asisten' having masa_kerja = 8;		--  Asisten dan masa kerja sama dengan 8 tahun.

select * from staf where gaji != 10000000;		-- Menampilkan data karyawan yang gajinya bukan 10.000.000



select nama, posisi from staf where posisi = "manager" or posisi = "supervisor";

select *, year(curdate()) - year(tgl_masuk) as masa_kerja from staf where posisi = "asisten" having masa_kerja >= 8;

select nama, gaji from staf where gaji != 10000000;

select * from staf;


update staf
set nama = "Budi Harjo"
where nip = "M01";

select * from staf;

--     -- no 1
--     select nama, (gaji * 12) as gaji_setahun from staf;
--     
-- 	-- no2
--     select nama, (gaji * 0.2) as tunjangan from staf;
--     
--     alter table staf 
-- 	add column tunjangan int;
--     
--     -- no 3
--     select nama, (gaji + tunjangan) as total_gaji from staf;
--     
--     select nama, (gaji+(gaji * 0.2)) from staf;
--     
--     select nama, posisi from staf
--     where posisi = "manager";
--     
--     select * from staf;
--     
--     insert into staf (tunjangan)
--     values ((gaji * 0.2));
--     
-- 	alter table staf
--     add column gaji_total int;

--     update staf
--     set tunjangan = (gaji * 0.2)
--     where nip in ("A01", "M01", "S01");
--     
--     update staf
--     set gaji_total = (gaji + tunjangan)
--     where nip in ("A01", "M01", "S01");
-- 	
--     select * from staf;
--     
-- 	select * from staf
--     where tunjangan > 5000000;
--     
--     select * from staf
--     where posisi != "manager";
--     
--     select * from staf
--     where posisi = "manager" or posisi = "supervisor";
--     
--     alter table staf
--     modify tgl_masuk date not null;
     
