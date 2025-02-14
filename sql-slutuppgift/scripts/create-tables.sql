DROP SCHEMA IF EXISTS petshop;
CREATE SCHEMA petshop;
USE petshop;

-- Create structure for table 'users'
CREATE TABLE users(
    user_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(45) NOT NULL UNIQUE,
    passwd VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL UNIQUE,
    account_verified BOOLEAN NOT NULL,
    billing_address VARCHAR(100) NOT NULL,
    shipping_address VARCHAR(100) NOT NULL,

    PRIMARY KEY(user_id) 
); 

-- Create structure for table 'species'
CREATE TABLE common_species(
    species_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    species_name VARCHAR(100) NOT NULL UNIQUE,

    PRIMARY KEY(species_id)
);

-- Create structure for table 'sub_species'
CREATE TABLE sub_species(
    sub_species_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    species_id INT UNSIGNED,
    sub_name VARCHAR(100) NOT NULL UNIQUE,

    PRIMARY KEY(sub_species_id),
    FOREIGN KEY(species_id) REFERENCES common_species(species_id) ON DELETE SET NULL
);

-- Create structure for table 'pets'
CREATE TABLE pets(
    pet_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    sub_species_id INT UNSIGNED,
    pet_name VARCHAR(100) NOT NULL,
    pet_dob DATETIME,
    pet_desc VARCHAR(350),
    pet_owner INT UNSIGNED,
    pet_status VARCHAR(350) NOT NULL,

    PRIMARY KEY(pet_id),
    FOREIGN KEY(sub_species_id) REFERENCES sub_species(sub_species_id) ON DELETE SET NULL,
    FOREIGN KEY(pet_owner) REFERENCES users(user_id) ON DELETE SET NULL,
    CONSTRAINT alive_strings CHECK (pet_status = 'Alive' OR pet_status = 'Dead')
);

-- Create structure for table 'manufacturers'
CREATE TABLE manufacturers(
    manufacturer_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    company_name VARCHAR(100) NOT NULL,
    company_address VARCHAR(100) NOT NULL,

    PRIMARY KEY(manufacturer_id)
);

-- Create structure for table 'products'
CREATE TABLE products(
    product_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    sku VARCHAR(45) NOT NULL UNIQUE,
    product_name VARCHAR(45) NOT NULL,
    manufacturer_id INT UNSIGNED,
    buying_price INT UNSIGNED NOT NULL,
    selling_price INT UNSIGNED NOT NULL,

    PRIMARY KEY(product_id),
    FOREIGN KEY(manufacturer_id) REFERENCES manufacturers(manufacturer_id) ON DELETE SET NULL
);

-- Create structure for table 'contacts'
CREATE TABLE contacts(
    contact_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    company_id INT UNSIGNED,
    primary_contact BOOLEAN NOT NULL,
    contact_name VARCHAR(45) NOT NULL,
    contact_phone VARCHAR(45) NOT NULL,
    contact_email VARCHAR(45) NOT NULL,

    PRIMARY KEY (contact_id),
    FOREIGN KEY(company_id) REFERENCES manufacturers(manufacturer_id) ON DELETE SET NULL
);

-- Create structure for table 'warehouses'
CREATE TABLE warehouses(
    warehouse_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    warehouse_city VARCHAR(45) NOT NULL,

    PRIMARY KEY (warehouse_id)
);

-- Create structure for table 'orders'
CREATE TABLE orders(
    order_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    customer_id INT UNSIGNED,
    order_status VARCHAR(45) NOT NULL,
    warehouse_id INT UNSIGNED,

    PRIMARY KEY(order_id),
    FOREIGN KEY(customer_id) REFERENCES users(user_id) ON DELETE SET NULL,
    FOREIGN KEY(warehouse_id) REFERENCES warehouses(warehouse_id) ON DELETE SET NULL,
    CONSTRAINT status_strings CHECK (order_status = 'AWAITING' OR order_status = 'FULFILLED' OR order_status = 'CANCELLED')
);

-- Create structure for table 'ordered_products'
CREATE TABLE ordered_products(
    ordered_products_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    order_id INT UNSIGNED,
    product_id INT UNSIGNED,
    qty INT UNSIGNED NOT NULL,

    PRIMARY KEY(ordered_products_id),
    FOREIGN KEY(order_id) REFERENCES orders(order_id) ON DELETE SET NULL,
    FOREIGN KEY(product_id) REFERENCES products(product_id) ON DELETE SET NULL,
    CONSTRAINT quantity_over_zero CHECK (qty > 0)
);

-- Create structure for table 'inventory'
CREATE TABLE inventory(
    inventory_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    warehouse_id INT UNSIGNED,
    product_id INT UNSIGNED,
    qty INT UNSIGNED,

    PRIMARY KEY(inventory_id),
    FOREIGN KEY(warehouse_id) REFERENCES warehouses(warehouse_id) ON DELETE SET NULL,
    FOREIGN KEY(product_id) REFERENCES products(product_id) ON DELETE SET NULL,
    CONSTRAINT quantity_over_zero CHECK (qty >= 0)
);

-- Create structure for table 'messages'
CREATE TABLE messages(
    messages_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    sender_id INT UNSIGNED,
    reciever_id INT UNSIGNED,
    parent BOOLEAN NOT NULL,

    PRIMARY KEY (messages_id),
    FOREIGN KEY(sender_id) REFERENCES users(user_id) ON DELETE SET NULL,
    FOREIGN KEY(reciever_id) REFERENCES users(user_id) ON DELETE SET NULL
);