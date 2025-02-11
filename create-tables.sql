

-- DROP SCHEMA IF EXISTS petshop;
-- CREATE SCHEMA petshop;
-- USE petshop;



--
-- Create structure for table 'users'
--

CREATE TABLE users (
    user_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    email_confirm BOOLEAN NOT NULL,
    billing_address VARCHAR(100) NOT NULL,
    shipping_address VARCHAR(100) NOT NULL,

    PRIMARY KEY(user_id) 
); 

--
-- Create structure for table 'pets'
--

CREATE TABLE pets (
    pet_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    species VARCHAR(100) NOT NULL, --fk species_id (species)
    pet_name VARCHAR(100) NOT NULL,
    pet_dob DATETIME NOT NULL,
    pet_desc VARCHAR(350),
    owner_id INT UNSIGNED NOT NULL --fk user_id (users)

    PRIMARY KEY(pet_id)
);

--
-- Create structure for table 'pets'
--

CREATE TABLE species (
    species_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    common_name VARCHAR(100) NOT NULL, -- ANTINGEN ELLER
    latin_name VARCHAR(100),           -- ANTINGEN ELLER

    PRIMARY KEY(species_id)
);


--
-- Create structure for table 'products'
--

CREATE TABLE products (
    product_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    sku VARCHAR (45) NOT NULL,
    product_name VARCHAR NOT NULL,
    manufacturer_id INT UNSIGNED NOT NULL, --fk manufacturer_id (manufacturer)
    buying_price INT UNSIGNED NOT NULL,
    selling_price INT UNSIGNED NOT NULL

    PRIMARY KEY(product_id)
);

--
-- Create structure for table 'manufacturer'
--

CREATE TABLE manufacturer (
    manufacturer_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    company_name VARCHAR NOT NULL,
    company_address VARCHAR NOT NULL,

    PRIMARY KEY(manufacturer_id)
);

--
-- Create structure for table 'contact'
--

CREATE TABLE contact (
    contact_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    company_id INT UNSIGNED NOT NULL, --fk company_name(manufacturer)
    primary_contact BOOLEAN NOT NULL, --
    contact_name VARCHAR NOT NULL,
    contact_phone VARCHAR NOT NULL, --??
    contact_email VARCHAR NOT NULL, --??

    PRIMARY KEY (contact_id)
);

--
-- Create structure for table 'orders'
--

CREATE TABLE orders (
    order_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    customer_id INT UNSIGNED NOT NULL, --fk user_id? (users)
    order_status VARCHAR NOT NULL, -- AWAITING, FULLFILLED, CANCELLED
    warehouse_id INT UNSIGNED NOT NULL, --fk warehouse_id (warehouse)

    PRIMARY KEY(order_id);
);

--
-- Create structure for table 'ordered_products'
--

CREATE TABLE ordered_products (
    ordered_products_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    order_id INT UNSIGNED NOT NULL, --fk order_id (orders)
    product_id INT UNSIGNED NOT NULL, --fk product_id (products)
    qty INT UNSIGNED NOT NULL,

    PRIMARY KEY (ordered_products_id)
);

--
-- Create structure for table 'warehouse'
--

CREATE TABLE warehouse (
    warehouse_id INT UNSIGNED NOT NULL,
    warehouse_city VARCHAR NOT NULL,

    PRIMARY KEY (warehouse_id);
)

--
-- Create structure for table 'inventory'
--

CREATE TABLE inventory (
    inventory_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    warehouse_id INT UNSIGNED NOT NULL --fk warehouse_id(warehouse)
    product_id INT UNSIGNED NOT NULL --fk product_id(product)
    qty INT UNSIGNED, -- qty 0??

    PRIMARY KEY (inventory_id)
)

--
-- Create structure for table 'messages'
--

CREATE TABLE messages (
    messages_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    sender_id INT UNSIGNED NOT NULL, --fk user_id (users)
    reciever_id INT UNSIGNED NOT NULL, --fk user_id (users)
    parent BOOLEAN,

    PRIMARY KEY (messages_id) 
)