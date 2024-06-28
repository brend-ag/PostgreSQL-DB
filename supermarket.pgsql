create table Employees (
    empID integer NOT NULL PRIMARY KEY,
    empName VARCHAR(75) NOT NULL,
    email VARCHAR(60),
    salary numeric(5,2)
);
SELECT * FROM Employees;
SELECT * FROM Customers;
create table Supermarket (
    superID integer NOT NULL PRIMARY KEY,
    superName VARCHAR(65) NOT NULL,
    address VARCHAR(100) NOT NULL
);

create table Products (
    prodID integer NOT NULL PRIMARY KEY,
    prodName VARCHAR(80) NOT NULL,
    brand VARCHAR(70) NOT NULL,
    price numeric(8,2)
);

create table Customers (
    custID integer NOT NULL PRIMARY KEY,
    custName VARCHAR(80) NOT NULL
);

create table WorksAt (
    empID integer REFERENCES Employees(empID),
    superID integer REFERENCES Supermarket(superID)
);

create table Sells (
    superID integer REFERENCES Supermarket(superID),
    prodID integer REFERENCES Products(prodID)
);

create table Buys (
    custID integer REFERENCES Customers(custID),
    prodID integer REFERENCES Products(prodID)
);

/**************************************/

/*** Employees insertion ***/
insert into Employees (empID, empName, email, salary) values (1, 'Haywood Gullyes', 'hgullyes0@examiner.com', 27.45);
insert into Employees (empID, empName, email, salary) values (2, 'Cam Di Biaggi', 'cdi1@4shared.com', 93.77);
insert into Employees (empID, empName, email, salary) values (3, 'Claudina Studholme', 'cstudholme2@vkontakte.ru', 118.3);
insert into Employees (empID, empName, email, salary) values (4, 'Elbertine Broe', 'ebroe3@com.com', 29.13);
insert into Employees (empID, empName, email, salary) values (5, 'Renee Minero', 'rminero4@marketwatch.com', 17.60);
SELECT * FROM Employees;

/*** Supermarket insertion ***/
insert into Supermarket (superID, superName, address) values (1, 'SuperMart', '8 Cody Plaza');
insert into Supermarket (superID, superName, address) values (2, 'ValueMart', '1655 Sauthoff Trail');
insert into Supermarket (superID, superName, address) values (3, 'MegaGrocery', '77 Tennyson Crossing');
insert into Supermarket (superID, superName, address) values (4, 'ValueMart', '87 Hansons Road');
insert into Supermarket (superID, superName, address) values (5, 'MegaGrocery', '3 Harbort Circle');
SELECT * FROM Supermarket;

/*** Products Insertion ***/
insert into Products (prodID, prodName, brand, price) values (1, 'Cornish Hen', 'H-E-B', 33.55);
insert into Products (prodID, prodName, brand, price) values (2, 'Veal - Bones', 'H-E-B', 72.87);
insert into Products (prodID, prodName, brand, price) values (3, 'Sauce - Vodka Blush', 'Target', 13.22);
insert into Products (prodID, prodName, brand, price) values (4, 'Russian Prince', 'Kroger', 40.56);
insert into Products (prodID, prodName, brand, price) values (5, 'Flour - So Mix Cake White', 'Kroger', 12.07);
SELECT * FROM Products;

/*** Customers Insertion ***/
insert into Customers (custID, custName) values (1, 'Stacie Ricard');
insert into Customers (custID, custName) values (2, 'Kim Wilcox');
insert into Customers (custID, custName) values (3, 'Harmonia Forrestor');
insert into Customers (custID, custName) values (4, 'Abby Crowson');
insert into Customers (custID, custName) values (5, 'Robyn Clooney');
SELECT * FROM Customers;

/*** WorksAt Insertion ***/
insert into WorksAt (empID, superID) values (1, 1);
insert into WorksAt (empID, superID) values (2, 2);
insert into WorksAt (empID, superID) values (3, 3);
insert into WorksAt (empID, superID) values (4, 4);
insert into WorksAt (empID, superID) values (5, 5);
SELECT * FROM WorksAt;

/*** Sells Insertion ***/
insert into Sells (superID, prodID) values (1, 1);
insert into Sells (superID, prodID) values (2, 2);
insert into Sells (superID, prodID) values (3, 3);
insert into Sells (superID, prodID) values (4, 4);
insert into Sells (superID, prodID) values (5, 5);
SELECT * FROM Sells;

/*** Buys Insertion ***/
insert into Buys (custID, prodID) values (1, 1);
insert into Buys (custID, prodID) values (2, 2);
insert into Buys (custID, prodID) values (3, 3);
insert into Buys (custID, prodID) values (4, 4);
insert into Buys (custID, prodID) values (5, 5);
SELECT * FROM BUYS;

/****************************/
/*** Queries ***/

/*Average salary of employees*/
SELECT ROUND(AVG(salary), 2)
FROM Employees;

/*Names of employees and the supermarket they work at*/
SELECT
  Employees.empName,
  Supermarket.superName
FROM Employees
JOIN WorksAt
  ON Employees.empID = WorksAt.empID
JOIN Supermarket
  ON Supermarket.superID= WorksAt.superID;

/*Names of products sold at each supermarket*/
SELECT
  Products.prodName,
  Products.price,
  Supermarket.superName
FROM Products
JOIN Sells
  ON Products.prodID = Sells.prodID
JOIN Supermarket
  ON Supermarket.superID= Sells.superID;
