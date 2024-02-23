create database SyncThinkDatabase

create table UserInfo
(
UserId INT PRIMARY KEY NOT NULL,
Email VARCHAR(225) NOT NULL,
Username VARCHAR(225) NOT NULL,
Password VARCHAR(225) NOT NULL
);

create table CustomerDetails
(
CustomerId INT PRIMARY KEY NOT NULL,
CustomerName VARCHAR(225) NOT NULL,
CustomerPhoneNumber INT NOT NULL,
CustomerEmail VARCHAR(225) NOT NULL,
CustomerAddress VARCHAR(225) NOT NULL
);

create table Suppliers
(
SupplierId INT PRIMARY KEY NOT NULL,
SupplierBusinessName VARCHAR(225) NOT NULL,
SupplierEmail VARCHAR(225) NOT NULL,
SupplierPhoneNumber INT NOT NULL
);

create table ProductCategory
(
CategoryId INT PRIMARY KEY NOT NULL,
CategoryName VARCHAR(225) NOT NULL,
CategoryDescription VARCHAR(225) NOT NULL
);

create table Products
(
ProductId INT PRIMARY KEY NOT NULL,
ProductName VARCHAR(225) NOT NULL,
CategoryId INT NOT NULL,
ProductBarcode INT UNIQUE NOT NULL,
TotalOrders INT NOT NULL,
FOREIGN KEY (CategoryId) REFERENCES ProductCategory (CategoryId)
);

create table Stock
(
Quantity INT PRIMARY KEY NOT NULL,
ProductId INT NOT NULL,
ProductBarcode INT NOT NULL,
FOREIGN KEY (ProductId) REFERENCES Products (ProductId),
FOREIGN KEY (ProductBarcode) REFERENCES Products (ProductBarcode)
);

create table Orders
(
OrderId INT PRIMARY KEY NOT NULL,
CustomerId INT NOT NULL,
ProductId INT NOT NULL,
SupplierId INT NOT NULL,
ProductBarcode INT NOT NULL,
Quantity INT NOT NULL,
FOREIGN KEY (CustomerId) REFERENCES CustomerDetails (CustomerId),
FOREIGN KEY (ProductId) REFERENCES Products (ProductId),
FOREIGN KEY (SupplierId) REFERENCES Suppliers (SupplierId),
FOREIGN KEY (ProductBarcode) REFERENCES Products (ProductBarcode),
FOREIGN KEY (Quantity) REFERENCES Stock (Quantity)
);

INSERT INTO ProductCategory (CategoryId, CategoryName, CategoryDescription)
VALUES (20, 'Audio devices', 'Audio devices designed to be worn over the ears, providing a personalized and immersive listening experience.'),
(21, 'Computer hardware', 'A visual display unit that serves as an output device for computers and other electronic devices.'),
(22, 'Computer peripherals', 'A combination of input devices used in computing, consisting of a keyboard and a mouse.'),
(23, 'Presentation equipment', 'A device that projects visual content, such as images, videos, or presentations, onto a large screen or surface.'),
(24, 'Computer devices', 'A device that captures and converts physical documents, images, or objects into digital form.'),
(25, 'Networking devices', 'A network device that connects different networks together and directs data traffic between them.'),
(26, 'Computer Peripherals', 'A peripheral device that produces a physical copy or hard copy of digital content stored on a computer or other electronic devices. '),
(27, 'Computer storage', 'A storage device used in computers to store and retrieve digital data.');

INSERT INTO Products (ProductId, ProductName, CategoryId, ProductBarcode, TotalOrders)
VALUES (1, 'Headphones', 20, 100, 90),
(2, 'Monitor', 21, 101, 77),
(3, 'Keyboard set', 22, 102, 82),
(4, 'Projector', 23, 103, 100),
(5, 'Scanner', 24, 104, 99),
(6, 'Router', 25, 105, 45),
(7, 'Printer', 26, 106, 38),
(8, 'Hard drives', 27, 107, 222);