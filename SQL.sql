create table admin_signup(
    user_id int not null auto_increment primary key,
    first_name varchar(40) not null,
    last_name varchar(40) not null,
	username varchar(40) not null,
    email varchar(60) not null,
    password varchar(100) not null
);

create table products(
    id int primary key auto_increment,
    pro_image varchar(255),
	pro_name varchar(40) not null,
	quantity int not null,
	price double not null,
	description varchar(100) not null
);

data LONGBLOB,



const getProducts = (req, res) => {
	if(!req.file){
		console.log('No products were uploded!');
	}else{
		console.log(req.file.filename)
		
	}
    connection.query('select * from products;', (err, rows) => {
        if (err) throw err
      
        res.json(rows);
      })
}

const getoneProduct = (req, res) => {
	if(!req.file){
		console.log('Specific product were not loaded!');
	}else{
		console.log(req.file.filename)
		
	}
    connection.query('select * from products where id=?;',[req.params.id] (err, rows) => {
        if (err) throw err
      
        res.json(rows);
      })
}



const deleteProduct = (req, res) => {
    connection.query('delete from products where id=?;',[req.params.id], (err, rows) => {
        if (err) throw err
  
        res.json(rows);
      })
}

const updateProduct = (req, res) => {
    connection.query('update from products where id=?;',[req.params.id], (err, rows) => {
        if (err) throw err
  
        res.json(rows);
      })
}


create table user_signup(
    user_id int not null auto_increment primary key,
    username varchar(40) not null,
    email varchar(60) not null,
    password varchar(100) not null
);

create table user_address(
    userAddress_id int not null auto_increment primary key,
	first_name varchar(40),
    last_name varchar(40),
    Unit_number varchar(40) not null,
    addressline_1 varchar(60) not null,
    addressline_2 varchar(60) not null,
    phone_number varchar(40) not null,
	city varchar(40) not null,
	zip varchar(40) not null,
	province varchar(40) not null
);

alter table user_address add user_id int;

alter table user_address
add foreign key(user_id)
references user_signup(user_id)
on delete set null;



create table orders (
    order_id int auto_increment primary key,
    order_id_prefix char(5) not null default 'SC10',
    user_id int not null,
    order_date timestamp default current_timestamp,
    total_amount decimal(10, 2) not null,
    payment_method varchar(50) not null,
    shipping_address varchar(255) not null,
    status enum('pending', 'processing', 'shipped', 'delivered', 'cancelled')
);

alter table orders
add foreign key(user_id)
references user_signup(user_id);


create table order_items (
    order_item_id int auto_increment primary key,
    order_id int,
    product_id int,
    quantity int,
    unit_price decimal(10, 2),
    total_price decimal(10, 2)
);

alter table order_items
add foreign key(order_id)
references orders(order_id);




create table shipments (
    shipment_id int auto_increment primary key,
    order_id int,
    shipment_date timestamp default current_timestamp,
    carrier varchar(50),
    tracking_number varchar(100),
    status enum('pending', 'in transit', 'delivered', 'cancelled')
);

-- top order items analysis

-- select
--     product_id,
--     sum(quantity) as total_quantity,
--     sum(total_price) as total_revenue
-- from
--     order_items
-- group by
--     product_id
-- order by
--     total_quantity desc
-- limit 10; -- adjust the limit to get the top n products


create table product_reviews (
    review_id int auto_increment primary key,
    product_id int,
    customer_id int,
	email varchar(40),
    rating int,
    description varchar(100),
    review_date date  
);

alter table product_reviews
add foreign key(product_id)
references products(id);

alter table product_reviews
add foreign key(customer_id)
references user_signup(user_id);

alter table product_reviews drop column review_date;
alter table product_reviews add review_date timestamp default current_timestamp;
