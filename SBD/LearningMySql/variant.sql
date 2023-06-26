create table products (
id varchar(10) not null,
nama varchar(100) not null,
description text,
price int unsigned not null,
quantity int unsigned not null default 0,
created_at timestamp not null default current_timestamp
) engine = InnoDB;

show tables;
describe products;

insert into products (id, nama, price, quantity)
values ('P0001', 'Mie Ayam', 15000, 100); 

insert into products (id, nama, description, price, quantity)
values ('P0002', 'Mie Ayam Bakso', 'Mie Ayam + bakso', 20000, 100); 

insert into products (id, nama, price, quantity)
values ('P0003', 'Mie Ayam Ceker', 18000, 100),
('P0004', 'Mie Ayam Spesial', 25000, 100),
('P0005', 'Mie Ayam Yamin', 22000, 100);

alter table products 
add primary key (id);

select * from products where price = 15000;
select * from products where quantity = 100;
select * from products where nama = 'Mie Ayam Bakso';

alter table products
add column category enum ('Makanan', 'minuman', 'lain-lain')
after nama;

select * from products;

select * from products where id = 'P0001';
 
update products
set category = 'Makanan'
where id = 'P0001';

update products
set category = 'Makanan', description = 'Mie Ayam + Ceker'
where id = 'P0003';

update products
set category = 'Makanan', description = 'Mie Ayam + Ceker + Bakso'
where id = 'P0004';

update products
set category = 'Makanan', description = 'Mie Ayam Original', price = price - 3000
where id = 'P0001';

update products
set category = 'Makanan'
where id = 'P0002';
 
 update products
 set category = 'Makanan', description = 'Mie Ayam disajikan Terpisah'
 where id = 'P0005';
 
insert into products (id, nama, price, quantity)
values ('P0006', 'Mie Ayam', 15000, 100); 

delete from products 
where id = 'P0006';

select * from products;

select id as Kode, category as Kategori, price as Harga, quantity as Stok, description as deskripsi
from products;

insert into products (id, category,  nama, price, quantity)
values ('P0006', 'Makanan', 'Bakso Ayam', 20000, 100),
('P0007', 'Makanan', 'Bakso Sapi', 25000, 100),
('P0008', 'Makanan', 'Bakso Telur', 15000, 100),
('P0010', 'minuman', 'Es Teh', 3000, 200),
('P0011', 'minuman', 'Es Jeruk', 4000, 200),
('P0012', 'minuman', 'Es Degan', 10000, 150),
('P0013', 'lain-lain', 'kerupuk', 1000, 500),
('P0014', 'lain-lain', 'Keripik udang', 2000, 500),
('P0015', 'Minuman', 'Es Krim', 15000, 200);

select * from products where quantity < 300;
select * from products where quantity > 100;
select * from products where category != 'Makanan';
select * from products where category <> 'minuman';
select * from products where category = 'Makanan' and price >= 15000;
select * from products where nama like 'e%';
select * from products where nama like '%mie%';
select * from products where nama like '%bakso%';
select * from products where description is not null;
select * from products where description is null;
select * from products where price between 15000 and 25000;
select * from products where category = 'Makanan' and price not between 15000 and 20000;
select * from products where category in ('Makanan', 'minuman');
select * from products where nama not in ('Es Teh', 'Es Jeruk');
select nama, id, category, price from products order by category asc, price desc;
select * from products order by id limit 5;
select * from products order by price desc limit 5;
select * from products order by id limit 5, 5;
select * from products where category = 'Makanan' limit 3;
select distinct category from products;
select nama, id, price div 1000 as 'Price in k' from products; 
select id, lcase(nama) as 'name lower case', length(nama) as 'name lenght' from products;
select id, upper(nama) as ' name uppper' from products;

select id, nama, created_at, year(created_at), month(created_at), day(created_at) from products;

select id, category,
	case category
		when 'Makanan' then 'Wenak'
		when 'minuman' then 'Segar'
		else 'Apa itu'
		end as 'category' 
from products; 

select * from products;

select id, nama,
	price, 
		if(price <= 10000, 'Murah', if(price <= 15000, 'standart', 'Mahal')) as 'jenis'
from products;

select id, nama, ifnull(description, 'nothing') from products;

select count(id) as 'total barang' from products;
select max(price) as 'Harga Tertingi' from products;
select min(price) as 'harga Terendah' from products; 
select avg(price) as 'Rata Rata' from products;
select sum(quantity) as 'Total Stok' from products;


select count(id) as 'Total produk', category from products group by category;
select sum(quantity) as 'total stock', category from products group by category;
select max(price) as 'Harga Tertinggi', category from products group by category; 
select min(price) as 'Harga Terendah', category from products group by category;

select price, count(id) as total from products group by price having total > 1;
select category, count(id) as total from products group by category having total > 1;
select nama, sum(price) as total from products group by nama having total > 1000;

select * from products;

insert into products (id, nama, category , price, quantity)
values ('P0016', 'Permen', 'lain-lain', 500, 1000);

insert into products (id, nama, category, price, quantity)
values ('P0017', 'gorengan', 'Makanan', 500, 200);

select * from products;

update products
set price = '5000'
where id = 'P0013';

update products
set price = '2000'
where id = 'P0016';

update products
set price = '2000'
where id = 'P0017';

show create table products;

alter table products 
add constraint price_check check (price >= 1000);

insert into products (id, nama, category, price, quantity)
values ('P0018', 'jajan', 'Makanan', 500, 200);

alter table products
add fulltext fulltext_products (nama, description);
describe products;





