create table person (
    name VARCHAR(75) NOT NULL,
    email VARCHAR(100) NOT NULL
);

create table employee (
    empID integer NOT NULL PRIMARY KEY,
    salary numeric(5,2)
)INHERITS(person);

create table customer (
    custID integer NOT NULL PRIMARY KEY
)INHERITS(person);

/* Note: In this DB, customer has an email */

create table supermarket (
    superID integer NOT NULL PRIMARY KEY,
    superName VARCHAR(65) NOT NULL,
    address VARCHAR(100) NOT NULL
);

create table product (
    prodID integer NOT NULL PRIMARY KEY,
    prodName VARCHAR(80) NOT NULL,
    brand VARCHAR(70) NOT NULL,
    price numeric(8,2)
);
create table works_at (
    empID integer REFERENCES Employees(empID),
    superID integer REFERENCES Supermarket(superID )
);

create table sells_ (
    superID integer REFERENCES Supermarket(superID),
    prodID integer REFERENCES Products(prodID)
);

create table buys_ (
    custID integer REFERENCES Customers(custID),
    prodID integer REFERENCES Products(prodID)
);
/*************************************/


/*** employee insertion ***/
insert into employee (empID, name, email, salary) values (1, 'Pluto Rolls', 'prolls@gmail.com', 27.45);
insert into employee (empID, name, email, salary) values (2, 'Daniel Abreu', 'abreu.d@aol.com', 80.20);
insert into employee (empID, name, email, salary) values (3, 'Mohammed Dridi', 'mdri@gmail.com', 12.38);
insert into employee (empID, name, email, salary) values (4, 'Yasmine Santos', 'santos@yahoo.com', 22.00);
insert into employee (empID, name, email, salary) values (5, 'Kacey Love', 'recall.love@aol.com', 18.90);

SELECT * FROM employee;

/*** supermarket insertion ***/
insert into supermarket (superID, superName, address) values (1, 'SuperMart', '8 Cody Plaza');
insert into supermarket (superID, superName, address) values (2, 'ValueMart', '1655 Sauthoff Trail');
insert into supermarket (superID, superName, address) values (3, 'MegaGrocery', '77 Tennyson Crossing');
insert into supermarket (superID, superName, address) values (4, 'ValueMart', '87 Hansons Road');
insert into supermarket (superID, superName, address) values (5, 'MegaGrocery', '3 Harbort Circle');
SELECT * FROM supermarket;

/*** product Insertion ***/
insert into product (prodID, prodName, brand, price) values (1, 'Cornish Hen', 'H-E-B', 33.55);
insert into product (prodID, prodName, brand, price) values (2, 'Veal - Bones', 'H-E-B', 72.87);
insert into product (prodID, prodName, brand, price) values (3, 'Sauce - Vodka Blush', 'Target', 13.22);
insert into product (prodID, prodName, brand, price) values (4, 'Russian Prince', 'Kroger', 40.56);
insert into product (prodID, prodName, brand, price) values (5, 'Flour - So Mix Cake White', 'Kroger', 12.07);
SELECT * FROM product;

/*** customer Insertion ***/
insert into customer (custID, name, email) values (1, 'Flor Andrews', 'flor@aol.com');
insert into customer (custID, name, email) values (2, 'Emmanuel Plast', 'plast.e@gmail.com');
insert into customer (custID, name, email) values (3, 'Rosa Cantu', 'rosallini@gar.com');
insert into customer (custID, name, email) values (4, 'Jovan Nikolic', 'jojo@flounder.com');
insert into customer (custID, name, email) values (5, 'Dawn Nicholas', 'nichnich@karm.com');
SELECT * FROM customer;

/*** works_at Insertion ***/
insert into works_at (empID, superID) values (1, 1);
insert into works_at (empID, superID) values (2, 2);
insert into works_at (empID, superID) values (3, 3);
insert into works_at (empID, superID) values (4, 4);
insert into works_at (empID, superID) values (5, 5);
SELECT * FROM works_at;

/*** sells_  Insertion ***/
insert into sells_  (superID, prodID) values (1, 1);
insert into sells_  (superID, prodID) values (2, 2);
insert into sells_  (superID, prodID) values (3, 3);
insert into sells_  (superID, prodID) values (4, 4);
insert into sells_  (superID, prodID) values (5, 5);
SELECT * FROM sells_ ;

/*** buys_ Insertion ***/
insert into buys_(custID, prodID) values (1, 1);
insert into buys_ (custID, prodID) values (2, 2);
insert into buys_ (custID, prodID) values (3, 3);
insert into buys_ (custID, prodID) values (4, 4);
insert into buys_ (custID, prodID) values (5, 5);
SELECT * FROM buys_;

/*******************************/

/*Names of employees and the supermarket they work at*/
SELECT
  employee.name,
  supermarket.superName
FROM employee
JOIN works_at
  ON employee.empID = works_at.empID
JOIN supermarket
  ON supermarket.superID= works_at.superID;

/*Names of products sold at each supermarket */
SELECT
  product.prodName,
  product.price,
  supermarket.superName
FROM product
JOIN sells_
  ON product.prodID = sells_.prodID
JOIN supermarket
  ON supermarket.superID= sells_.superID;

/*Custom composite TYPE structure */

/*create TYPE Person AS (
    name text,
    email text
);

create table employee (
    empID integer NOT NULL PRIMARY KEY,
    properties Person
  
);
insert into employee (empID, properties) 
values (1, ('Ruby Smith'::Person), ('ruby.smith@gmail.com'::Person));

SELECT * FROM employee; */