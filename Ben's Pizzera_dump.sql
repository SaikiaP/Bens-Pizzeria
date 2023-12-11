

CREATE TABLE `Orders` (
    `row_id` int  NOT NULL ,
    `order_id` varchar(10)  NOT NULL ,
    `created_at` datetime  NOT NULL ,
    `customer_id` int  NOT NULL ,
    `delivery_id` int  NOT NULL ,
    `item_id` int  NOT NULL ,
    `quantity` int  NOT NULL ,
    `delivery` bool  NOT NULL ,
    PRIMARY KEY (
        `row_id`
    )
);

CREATE TABLE `Customers` (
    `customer_id` int  NOT NULL ,
    `cust_firstname` varchar(50)  NOT NULL ,
    `cust_lastname` varchar(50)  NOT NULL ,
    PRIMARY KEY (
        `customer_id`
    )
);

CREATE TABLE `Address` (
    `delivery_id` int  NOT NULL ,
    `delivery_address1` varchar(200)  NOT NULL ,
    `delivery_address2` varchar(100)  NULL ,
    `delivery_city` varchar(50)  NOT NULL ,
    `delivery_zipcode` varchar(20)  NOT NULL ,
    PRIMARY KEY (
        `delivery_id`
    )
);

CREATE TABLE `Items` (
    `item_id` int  NOT NULL ,
    `item_name` varchar(50)  NOT NULL ,
    `sku` varchar(20)  NOT NULL ,
    `item_cat` varchar(50)  NOT NULL ,
    `item_size` varchar(50)  NOT NULL ,
    `item_price` decimal(5,2)  NOT NULL ,
    PRIMARY KEY (
        `item_id`
    )
);

CREATE TABLE `Recipie` (
    `row_id` int  NOT NULL ,
    `recipie_id` int  NOT NULL ,
    `ing_id` int  NOT NULL ,
    `quantity` int  NOT NULL ,
    PRIMARY KEY (
        `row_id`
    )
);

CREATE TABLE `Inventory` (
    `inv_id` int  NOT NULL ,
    `item_id` varchar(10)  NOT NULL ,
    `quantity` int  NOT NULL ,
    PRIMARY KEY (
        `inv_id`
    )
);

CREATE TABLE `Ingrediants` (
    `ing_id` int  NOT NULL ,
    `ing_name` varchar(20)  NOT NULL ,
    `ing_weight` int  NOT NULL ,
    `ing_mass` int  NOT NULL ,
    PRIMARY KEY (
        `ing_id`
    )
);

CREATE TABLE `Rotation` (
    `rotation_id` int  NOT NULL ,
    `row_id` int  NOT NULL ,
    `date` datetime  NOT NULL ,
    `shift_id` varchar(20)  NOT NULL ,
    `staff_id` varchar(20)  NOT NULL ,
    PRIMARY KEY (
        `rotation_id`
    )
);

CREATE TABLE `Staff` (
    `staff_id` varchar(20)  NOT NULL ,
    `firstname` varchar(20)  NOT NULL ,
    `lastname` varchar(20)  NOT NULL ,
    `position` varchar(100)  NOT NULL ,
    `hourly_rate` decimal(5,2)  NOT NULL ,
    PRIMARY KEY (
        `staff_id`
    )
);

CREATE TABLE `Shift` (
    `shift_id` varchar(20)  NOT NULL ,
    `day_of_week` varchar(10)  NOT NULL ,
    `starttime` time  NOT NULL ,
    `endtime` time  NOT NULL ,
    PRIMARY KEY (
        `shift_id`
    )
);

ALTER TABLE `Customers` ADD CONSTRAINT `fk_Customers_customer_id` FOREIGN KEY(`customer_id`)
REFERENCES `Orders` (`customer_id`);

ALTER TABLE `Address` ADD CONSTRAINT `fk_Address_delivery_id` FOREIGN KEY(`delivery_id`)
REFERENCES `Orders` (`delivery_id`);

ALTER TABLE `Items` ADD CONSTRAINT `fk_Items_item_id` FOREIGN KEY(`item_id`)
REFERENCES `Orders` (`item_id`);

ALTER TABLE `Recipie` ADD CONSTRAINT `fk_Recipie_recipie_id` FOREIGN KEY(`recipie_id`)
REFERENCES `Items` (`sku`);

ALTER TABLE `Inventory` ADD CONSTRAINT `fk_Inventory_item_id` FOREIGN KEY(`item_id`)
REFERENCES `Recipie` (`ing_id`);

ALTER TABLE `Ingrediants` ADD CONSTRAINT `fk_Ingrediants_ing_id` FOREIGN KEY(`ing_id`)
REFERENCES `Recipie` (`ing_id`);

ALTER TABLE `Staff` ADD CONSTRAINT `fk_Staff_staff_id` FOREIGN KEY(`staff_id`)
REFERENCES `Rotation` (`staff_id`);

ALTER TABLE `Shift` ADD CONSTRAINT `fk_Shift_shift_id` FOREIGN KEY(`shift_id`)
REFERENCES `Rotation` (`shift_id`);

