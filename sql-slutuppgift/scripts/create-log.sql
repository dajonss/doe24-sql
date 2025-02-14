USE petshop

-- Create structure for table 'users'
CREATE TABLE users_log(
    log_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    username VARCHAR(45) NOT NULL,
    passwd VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    account_verified BOOLEAN NOT NULL,
    billing_address VARCHAR(100) NOT NULL,
    shipping_address VARCHAR(100) NOT NULL,
    modified_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    trigger_event VARCHAR(100) NOT NULL,

    PRIMARY KEY(log_id),
    CONSTRAINT trigger_event CHECK (trigger_event = 'DELETE' OR trigger_event = 'INSERT' OR trigger_event = 'UPDATE')
);

CREATE TRIGGER user_delete
    BEFORE DELETE ON users
        FOR EACH ROW
        INSERT INTO users_log (
            log_id,
            user_id,
            username,
            passwd,
            email,
            account_verified,
            billing_address,
            shipping_address,
            trigger_event) 
        VALUES (
            NULL,
            old.user_id,
            old.username,
            old.passwd,
            old.email,
            old.account_verified,
            old.billing_address,
            old.shipping_address,
            'DELETE');

CREATE TRIGGER user_insert
    AFTER INSERT ON users
        FOR EACH ROW
        INSERT INTO users_log (
            log_id,
            user_id,
            username,
            passwd,
            email,
            account_verified,
            billing_address,
            shipping_address,
            trigger_event) 
        VALUES (
            NULL,
            new.user_id,
            new.username,
            new.passwd,
            new.email,
            new.account_verified,
            new.billing_address,
            new.shipping_address,
            'INSERT');

CREATE TRIGGER user_update
    AFTER UPDATE ON users
        FOR EACH ROW
        INSERT INTO users_log (
            log_id,
            user_id,
            username,
            passwd,
            email,
            account_verified,
            billing_address,
            shipping_address,
            trigger_event) 
        VALUES (
            NULL,
            old.user_id,
            old.username,
            old.passwd,
            old.email,
            old.account_verified,
            old.billing_address,
            old.shipping_address,
            'UPDATE');

-- Create structure for table 'species'
CREATE TABLE common_species_log(
    log_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    species_id INT UNSIGNED NOT NULL,
    species_name VARCHAR(100) NOT NULL,
    trigger_event VARCHAR(100) NOT NULL,

    PRIMARY KEY(log_id),
    CONSTRAINT trigger_event CHECK (trigger_event = 'DELETE' OR trigger_event = 'INSERT' OR trigger_event = 'UPDATE')
);

CREATE TRIGGER common_species_delete
    BEFORE DELETE ON common_species
        FOR EACH ROW
        INSERT INTO common_species_log(
            log_id,
            species_id,
            species_name,
            trigger_event) 
        VALUES (
            NULL,
            old.species_id,
            old.species_name,
            'DELETE');

CREATE TRIGGER common_species_insert
    AFTER INSERT ON common_species
        FOR EACH ROW
        INSERT INTO common_species_log(
            log_id,
            species_id,
            species_name,
            trigger_event) 
        VALUES (
            NULL,
            new.species_id,
            new.species_name,
            'INSERT');

CREATE TRIGGER common_species_update
    AFTER UPDATE ON common_species
        FOR EACH ROW
        INSERT INTO common_species_log(
            log_id,
            species_id,
            species_name,
            trigger_event) 
        VALUES (
            NULL,
            old.species_id,
            old.species_name,
            'UPDATE');

-- Create structure for table 'sub_species'
CREATE TABLE sub_species_log(
    log_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    sub_species_id INT UNSIGNED NOT NULL,
    species_id INT UNSIGNED NOT NULL,
    sub_name VARCHAR(100) NOT NULL,
    trigger_event VARCHAR(100) NOT NULL,

    PRIMARY KEY(log_id),
    CONSTRAINT trigger_event CHECK (trigger_event = 'DELETE' OR trigger_event = 'INSERT' OR trigger_event = 'UPDATE')
);

CREATE TRIGGER sub_species_delete
    BEFORE DELETE ON sub_species
        FOR EACH ROW
        INSERT INTO sub_species_log (
            log_id,
            sub_species_id,
            species_id,
            sub_name,
            trigger_event) 
        VALUES (
            NULL,
            old.sub_species_id,
            old.species_id,
            old.sub_name,
            'DELETE');

CREATE TRIGGER sub_species_insert
    BEFORE INSERT ON sub_species
        FOR EACH ROW
        INSERT INTO sub_species_log (
            log_id,
            sub_species_id,
            species_id,
            sub_name,
            trigger_event) 
        VALUES (
            NULL,
            new.sub_species_id,
            new.species_id,
            new.sub_name,
            'INSERT');

CREATE TRIGGER sub_species_update
    BEFORE UPDATE ON sub_species
        FOR EACH ROW
        INSERT INTO sub_species_log (
            log_id,
            sub_species_id,
            species_id,
            sub_name,
            trigger_event) 
        VALUES (
            NULL,
            old.sub_species_id,
            old.species_id,
            old.sub_name,
            'UPDATE');

-- Create structure for table 'pets'
CREATE TABLE pets_log(
    log_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    pet_id INT UNSIGNED NOT NULL,
    sub_species_id INT UNSIGNED NOT NULL,
    pet_name VARCHAR(100) NOT NULL,
    pet_dob DATETIME,
    pet_desc VARCHAR(350),
    pet_owner INT UNSIGNED NOT NULL,
    pet_status VARCHAR(350) NOT NULL,
    trigger_event VARCHAR(100) NOT NULL,

    PRIMARY KEY(log_id),
    CONSTRAINT trigger_event CHECK (trigger_event = 'DELETE' OR trigger_event = 'INSERT' OR trigger_event = 'UPDATE')
);

CREATE TRIGGER pets_delete
    BEFORE DELETE ON pets
        FOR EACH ROW
        INSERT INTO pets_log (
            log_id,
            pet_id,
            sub_species_id,
            pet_name,
            pet_dob,
            pet_desc,
            pet_owner,
            pet_status,
            trigger_event) 
        VALUES (
            NULL,
            old.pet_id,
            old.sub_species_id,
            old.pet_name,
            old.pet_dob,
            old.pet_desc,
            old.pet_owner,
            old.pet_status,
            'DELETE');

CREATE TRIGGER pets_insert
    BEFORE INSERT ON pets
        FOR EACH ROW
        INSERT INTO pets_log (
            log_id,
            pet_id,
            sub_species_id,
            pet_name,
            pet_dob,
            pet_desc,
            pet_owner,
            pet_status,
            trigger_event) 
        VALUES (
            NULL,
            new.pet_id,
            new.sub_species_id,
            new.pet_name,
            new.pet_dob,
            new.pet_desc,
            new.pet_owner,
            new.pet_status,
            'INSERT');

CREATE TRIGGER pets_update
    BEFORE UPDATE ON pets
        FOR EACH ROW
        INSERT INTO pets_log (
            log_id,
            pet_id,
            sub_species_id,
            pet_name,
            pet_dob,
            pet_desc,
            pet_owner,
            pet_status,
            trigger_event) 
        VALUES (
            NULL,
            old.pet_id,
            old.sub_species_id,
            old.pet_name,
            old.pet_dob,
            old.pet_desc,
            old.pet_owner,
            old.pet_status,
            'UPDATE');

-- Create structure for table 'manufacturers'
CREATE TABLE manufacturers_log(
    log_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    manufacturer_id INT UNSIGNED NOT NULL,
    company_name VARCHAR(100) NOT NULL,
    company_address VARCHAR(100) NOT NULL,
    trigger_event VARCHAR(100) NOT NULL,

    PRIMARY KEY(log_id),
    CONSTRAINT trigger_event CHECK (trigger_event = 'DELETE' OR trigger_event = 'INSERT' OR trigger_event = 'UPDATE')
);

CREATE TRIGGER manufacturers_delete
    BEFORE DELETE ON manufacturers
        FOR EACH ROW
        INSERT INTO manufacturers_log (
            log_id,
            manufacturer_id,
            company_name,
            company_address,
            trigger_event) 
        VALUES (
            NULL,
            old.manufacturer_id,
            old.company_name,
            old.company_address,
            'DELETE');

CREATE TRIGGER manufacturers_insert
    BEFORE INSERT ON manufacturers
        FOR EACH ROW
        INSERT INTO manufacturers_log (
            log_id,
            manufacturer_id,
            company_name,
            company_address,
            trigger_event) 
        VALUES (
            NULL,
            new.manufacturer_id,
            new.company_name,
            new.company_address,
            'INSERT');

CREATE TRIGGER manufacturers_update
    BEFORE UPDATE ON manufacturers
        FOR EACH ROW
        INSERT INTO manufacturers_log (
            log_id,
            manufacturer_id,
            company_name,
            company_address,
            trigger_event) 
        VALUES (
            NULL,
            old.manufacturer_id,
            old.company_name,
            old.company_address,
            'UPDATE');

-- Create structure for table 'products'
CREATE TABLE products_log(
    log_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    product_id INT UNSIGNED NOT NULL,
    sku VARCHAR(45) NOT NULL,
    product_name VARCHAR(45) NOT NULL,
    manufacturer_id INT UNSIGNED NOT NULL,
    buying_price INT UNSIGNED NOT NULL,
    selling_price INT UNSIGNED NOT NULL,
    trigger_event VARCHAR(100) NOT NULL,

    PRIMARY KEY(log_id),
    CONSTRAINT trigger_event CHECK (trigger_event = 'DELETE' OR trigger_event = 'INSERT' OR trigger_event = 'UPDATE')
);

CREATE TRIGGER products_delete
    BEFORE DELETE ON products
        FOR EACH ROW
        INSERT INTO products_log (
            log_id,
            product_id,
            sku,
            product_name,
            manufacturer_id,
            buying_price,
            selling_price,
            trigger_event) 
        VALUES (
            NULL,
            old.product_id,
            old.sku,
            old.product_name,
            old.manufacturer_id,
            old.buying_price,
            old.selling_price,
            'DELETE');

CREATE TRIGGER products_insert
    BEFORE INSERT ON products
        FOR EACH ROW
        INSERT INTO products_log (
            log_id,
            product_id,
            sku,
            product_name,
            manufacturer_id,
            buying_price,
            selling_price,
            trigger_event) 
        VALUES (
            NULL,
            new.product_id,
            new.sku,
            new.product_name,
            new.manufacturer_id,
            new.buying_price,
            new.selling_price,
            'INSERT');

CREATE TRIGGER products_update
    BEFORE UPDATE ON products
        FOR EACH ROW
        INSERT INTO products_log (
            log_id,
            product_id,
            sku,
            product_name,
            manufacturer_id,
            buying_price,
            selling_price,
            trigger_event) 
        VALUES (
            NULL,
            old.product_id,
            old.sku,
            old.product_name,
            old.manufacturer_id,
            old.buying_price,
            old.selling_price,
            'UPDATE');

-- Create structure for table 'contacts'
CREATE TABLE contacts_log(
    log_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    contact_id INT UNSIGNED NOT NULL,
    company_id INT UNSIGNED NOT NULL,
    primary_contact BOOLEAN NOT NULL,
    contact_name VARCHAR(45) NOT NULL,
    contact_phone VARCHAR(45) NOT NULL,
    contact_email VARCHAR(45) NOT NULL,
    trigger_event VARCHAR(100) NOT NULL,

    PRIMARY KEY (log_id),
    CONSTRAINT trigger_event CHECK (trigger_event = 'DELETE' OR trigger_event = 'INSERT' OR trigger_event = 'UPDATE')
);

CREATE TRIGGER contacts_delete
    BEFORE DELETE ON contacts
        FOR EACH ROW
        INSERT INTO contacts_log (
            log_id,
            contact_id,
            company_id,
            primary_contact,
            contact_name,
            contact_phone,
            contact_email,
            trigger_event) 
        VALUES (
            NULL,
            old.contact_id,
            old.company_id,
            old.primary_contact,
            old.contact_name,
            old.contact_phone,
            old.contact_email,
            'DELETE');

 CREATE TRIGGER contacts_insert
    BEFORE INSERT ON contacts
        FOR EACH ROW
        INSERT INTO contacts_log (
            log_id,
            contact_id,
            company_id,
            primary_contact,
            contact_name,
            contact_phone,
            contact_email,
            trigger_event) 
        VALUES (
            NULL,
            new.contact_id,
            new.company_id,
            new.primary_contact,
            new.contact_name,
            new.contact_phone,
            new.contact_email,
            'INSERT');           

CREATE TRIGGER contacts_update
    BEFORE UPDATE ON contacts
        FOR EACH ROW
        INSERT INTO contacts_log (
            log_id,
            contact_id,
            company_id,
            primary_contact,
            contact_name,
            contact_phone,
            contact_email,
            trigger_event) 
        VALUES (
            NULL,
            old.contact_id,
            old.company_id,
            old.primary_contact,
            old.contact_name,
            old.contact_phone,
            old.contact_email,
            'UPDATE');

-- Create structure for table 'warehouses'
CREATE TABLE warehouses_log(
    log_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    warehouse_id INT UNSIGNED NOT NULL,
    warehouse_city VARCHAR(45) NOT NULL,
    trigger_event VARCHAR(100) NOT NULL,

    PRIMARY KEY (log_id),
    CONSTRAINT trigger_event CHECK (trigger_event = 'DELETE' OR trigger_event = 'INSERT' OR trigger_event = 'UPDATE')
);

CREATE TRIGGER warehouses_delete
    BEFORE DELETE ON warehouses
        FOR EACH ROW
        INSERT INTO warehouses_log (
            log_id,
            warehouse_id,
            warehouse_city,
            trigger_event) 
        VALUES (
            NULL,
            old.warehouse_id,
            old.warehouse_city,
            'DELETE');

CREATE TRIGGER warehouses_insert
    BEFORE INSERT ON warehouses
        FOR EACH ROW
        INSERT INTO warehouses_log (
            log_id,
            warehouse_id,
            warehouse_city,
            trigger_event) 
        VALUES (
            NULL,
            new.warehouse_id,
            new.warehouse_city,
            'INSERT');

CREATE TRIGGER warehouses_update
    BEFORE UPDATE ON warehouses
        FOR EACH ROW
        INSERT INTO warehouses_log (
            log_id,
            warehouse_id,
            warehouse_city,
            trigger_event) 
        VALUES (
            NULL,
            old.warehouse_id,
            old.warehouse_city,
            'UPDATE');

-- Create structure for table 'orders'
CREATE TABLE orders_log(
    log_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    order_id INT UNSIGNED NOT NULL,
    customer_id INT UNSIGNED NOT NULL,
    order_status VARCHAR(45) NOT NULL,
    warehouse_id INT UNSIGNED NOT NULL,
    trigger_event VARCHAR(100) NOT NULL,

    PRIMARY KEY(log_id),
    CONSTRAINT trigger_event CHECK (trigger_event = 'DELETE' OR trigger_event = 'INSERT' OR trigger_event = 'UPDATE')
);

CREATE TRIGGER orders_delete
    BEFORE DELETE ON orders
        FOR EACH ROW
        INSERT INTO orders_log (
            log_id,
            order_id,
            customer_id,
            order_status,
            warehouse_id,
            trigger_event) 
        VALUES (
            NULL,
            old.order_id,
            old.customer_id,
            old.order_status,
            old.warehouse_id,
            'DELETE');

CREATE TRIGGER orders_insert
    BEFORE INSERT ON orders
        FOR EACH ROW
        INSERT INTO orders_log (
            log_id,
            order_id,
            customer_id,
            order_status,
            warehouse_id,
            trigger_event) 
        VALUES (
            NULL,
            new.order_id,
            new.customer_id,
            new.order_status,
            new.warehouse_id,
            'INSERT');

CREATE TRIGGER orders_update
    BEFORE UPDATE ON orders
        FOR EACH ROW
        INSERT INTO orders_log (
            log_id,
            order_id,
            customer_id,
            order_status,
            warehouse_id,
            trigger_event) 
        VALUES (
            NULL,
            old.order_id,
            old.customer_id,
            old.order_status,
            old.warehouse_id,
            'UPDATE');

-- Create structure for table 'ordered_products'
CREATE TABLE ordered_products_log(
    log_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    ordered_products_id INT UNSIGNED NOT NULL,
    order_id INT UNSIGNED NOT NULL,
    product_id INT UNSIGNED NOT NULL,
    qty INT UNSIGNED NOT NULL,
    trigger_event VARCHAR(100) NOT NULL,

    PRIMARY KEY(log_id),
    CONSTRAINT trigger_event CHECK (trigger_event = 'DELETE' OR trigger_event = 'INSERT' OR trigger_event = 'UPDATE')
);

CREATE TRIGGER ordered_products_delete
    BEFORE DELETE ON ordered_products
        FOR EACH ROW
        INSERT INTO ordered_products_log (
            log_id,
            ordered_products_id,
            order_id,
            product_id,
            qty,
            trigger_event) 
        VALUES (
            NULL,
            old.ordered_products_id,
            old.order_id,
            old.product_id,
            old.qty,
            'DELETE');

CREATE TRIGGER ordered_products_insert
    BEFORE INSERT ON ordered_products
        FOR EACH ROW
        INSERT INTO ordered_products_log (
            log_id,
            ordered_products_id,
            order_id,
            product_id,
            qty,
            trigger_event) 
        VALUES (
            NULL,
            new.ordered_products_id,
            new.order_id,
            new.product_id,
            new.qty,
            'INSERT');

CREATE TRIGGER ordered_products_update
    BEFORE UPDATE ON ordered_products
        FOR EACH ROW
        INSERT INTO ordered_products_log (
            log_id,
            ordered_products_id,
            order_id,
            product_id,
            qty,
            trigger_event) 
        VALUES (
            NULL,
            old.ordered_products_id,
            old.order_id,
            old.product_id,
            old.qty,
            'UPDATE');

-- Create structure for table 'inventory'
CREATE TABLE inventory_log(
    log_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    inventory_id INT UNSIGNED NOT NULL,
    warehouse_id INT UNSIGNED NOT NULL,
    product_id INT UNSIGNED NOT NULL,
    qty INT UNSIGNED,
    trigger_event VARCHAR(100) NOT NULL,

    PRIMARY KEY(log_id),
    CONSTRAINT trigger_event CHECK (trigger_event = 'DELETE' OR trigger_event = 'INSERT' OR trigger_event = 'UPDATE')
);

CREATE TRIGGER inventory_delete
    BEFORE DELETE ON inventory
        FOR EACH ROW
        INSERT INTO inventory_log (
            log_id,
            inventory_id,
            warehouse_id,
            product_id,
            qty,
            trigger_event) 
        VALUES (
            NULL,
            old.inventory_id,
            old.warehouse_id,
            old.product_id,
            old.qty,
            'DELETE');

CREATE TRIGGER inventory_insert
    BEFORE INSERT ON inventory
        FOR EACH ROW
        INSERT INTO inventory_log (
            log_id,
            inventory_id,
            warehouse_id,
            product_id,
            qty,
            trigger_event) 
        VALUES (
            NULL,
            new.inventory_id,
            new.warehouse_id,
            new.product_id,
            new.qty,
            'INSERT');

CREATE TRIGGER inventory_update
    BEFORE UPDATE ON inventory
        FOR EACH ROW
        INSERT INTO inventory_log (
            log_id,
            inventory_id,
            warehouse_id,
            product_id,
            qty,
            trigger_event) 
        VALUES (
            NULL,
            old.inventory_id,
            old.warehouse_id,
            old.product_id,
            old.qty,
            'UPDATE');

-- Create structure for table 'messages'
CREATE TABLE messages_log(
    log_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    messages_id INT UNSIGNED NOT NULL,
    sender_id INT UNSIGNED NOT NULL,
    reciever_id INT UNSIGNED NOT NULL,
    parent BOOLEAN NOT NULL,
    trigger_event VARCHAR(100) NOT NULL,

    PRIMARY KEY (log_id),
    CONSTRAINT trigger_event CHECK (trigger_event = 'DELETE' OR trigger_event = 'INSERT' OR trigger_event = 'UPDATE')
);

CREATE TRIGGER messages_delete
    BEFORE DELETE ON messages
        FOR EACH ROW
        INSERT INTO messages_log (
            log_id,
            messages_id,
            sender_id,
            reciever_id,
            parent,
            trigger_event) 
        VALUES (
            NULL,
            old.messages_id,
            old.sender_id,
            old.reciever_id,
            old.parent,
            'DELETE');

CREATE TRIGGER messages_insert
    BEFORE INSERT ON messages
        FOR EACH ROW
        INSERT INTO messages_log (
            log_id,
            messages_id,
            sender_id,
            reciever_id,
            parent,
            trigger_event) 
        VALUES (
            NULL,
            new.messages_id,
            new.sender_id,
            new.reciever_id,
            new.parent,
            'INSERT');

CREATE TRIGGER messages_update
    BEFORE UPDATE ON messages
        FOR EACH ROW
        INSERT INTO messages_log (
            log_id,
            messages_id,
            sender_id,
            reciever_id,
            parent,
            trigger_event) 
        VALUES (
            NULL,
            old.messages_id,
            old.sender_id,
            old.reciever_id,
            old.parent,
            'UPDATE');