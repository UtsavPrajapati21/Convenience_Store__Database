-- 01_tblState.sql
CREATE TABLE tblState (
  StateNumber INT NOT NULL,
  StateName VARCHAR(255),
  PRIMARY KEY (StateNumber)
) ENGINE=InnoDB;


-- 02_tblStore.sql
CREATE TABLE tblStore (
  StoreID INT AUTO_INCREMENT,
  StoreName VARCHAR(255),
  PRIMARY KEY (StoreID)
) ENGINE=InnoDB;


-- 03_tblDistributor.sql
CREATE TABLE tblDistributor (
  DistributorID INT NOT NULL,
  DistributorName VARCHAR(255),
  Street VARCHAR(255),
  City VARCHAR(50),
  StateNumber INT,
  Zip VARCHAR(15),
  PRIMARY KEY (DistributorID),
  INDEX (StateNumber),
  CONSTRAINT fk_distributor_state
    FOREIGN KEY (StateNumber) REFERENCES tblState(StateNumber)
    ON UPDATE CASCADE
    ON DELETE SET NULL
) ENGINE=InnoDB;


-- 04_tblProduct.sql
CREATE TABLE tblProduct (
  ProductID INT NOT NULL,
  ProductName VARCHAR(255),
  Quantity INT,
  Cost DECIMAL(10,2),
  Price DECIMAL(10,2),
  PRIMARY KEY (ProductID)
) ENGINE=InnoDB;


-- 05_tblService.sql
CREATE TABLE tblService (
  ServiceID INT NOT NULL,
  ServiceName VARCHAR(255),
  Cost DECIMAL(10,2),
  IssueSolved BOOLEAN,
  ServiceDate DATETIME,
  PRIMARY KEY (ServiceID)
) ENGINE=InnoDB;


-- 06_tblServiceProvider.sql
CREATE TABLE tblServiceProvider (
  ServiceProviderID INT NOT NULL,
  LastName VARCHAR(255),
  FirstName VARCHAR(255),
  Street VARCHAR(255),
  City VARCHAR(50),
  StateNumber INT,
  Zip VARCHAR(15),
  ServiceID INT,
  PRIMARY KEY (ServiceProviderID),
  INDEX (StateNumber),
  INDEX (ServiceID),
  CONSTRAINT fk_serviceprovider_state
    FOREIGN KEY (StateNumber) REFERENCES tblState(StateNumber)
    ON UPDATE CASCADE
    ON DELETE SET NULL,
  CONSTRAINT fk_serviceprovider_service
    FOREIGN KEY (ServiceID) REFERENCES tblService(ServiceID)
    ON UPDATE CASCADE
    ON DELETE SET NULL
) ENGINE=InnoDB;


-- 07_tblCustomer.sql
CREATE TABLE tblCustomer (
  CustomerID INT NOT NULL,
  FirstName VARCHAR(255),
  LastName VARCHAR(255),
  Street VARCHAR(255),
  City VARCHAR(50),
  StateNumber INT,
  Zip VARCHAR(15),
  StoreID INT,
  PRIMARY KEY (CustomerID),
  INDEX (StateNumber),
  INDEX (StoreID),
  CONSTRAINT fk_customer_state
    FOREIGN KEY (StateNumber) REFERENCES tblState(StateNumber)
    ON UPDATE CASCADE
    ON DELETE SET NULL,
  CONSTRAINT fk_customer_store
    FOREIGN KEY (StoreID) REFERENCES tblStore(StoreID)
    ON UPDATE CASCADE
    ON DELETE SET NULL
) ENGINE=InnoDB;


-- 08_tblEmployee.sql
CREATE TABLE tblEmployee (
  EmployeeID INT NOT NULL,
  LastName VARCHAR(255),
  FirstName VARCHAR(255),
  Street VARCHAR(255),
  City VARCHAR(50),
  StateNumber INT,
  Zip VARCHAR(15),
  Pay DECIMAL(10,2),
  Position VARCHAR(50),
  StoreID INT,
  PRIMARY KEY (EmployeeID),
  INDEX (StateNumber),
  INDEX (StoreID),
  CONSTRAINT fk_employee_state
    FOREIGN KEY (StateNumber) REFERENCES tblState(StateNumber)
    ON UPDATE CASCADE
    ON DELETE SET NULL,
  CONSTRAINT fk_employee_store
    FOREIGN KEY (StoreID) REFERENCES tblStore(StoreID)
    ON UPDATE CASCADE
    ON DELETE SET NULL
) ENGINE=InnoDB;


-- 09_tblOrder.sql
CREATE TABLE tblOrder (
  OrderID INT AUTO_INCREMENT,
  ProductID INT,
  DistributorID INT,
  PRIMARY KEY (OrderID),
  INDEX (ProductID),
  INDEX (DistributorID),
  CONSTRAINT fk_order_product
    FOREIGN KEY (ProductID) REFERENCES tblProduct(ProductID)
    ON UPDATE CASCADE
    ON DELETE SET NULL,
  CONSTRAINT fk_order_distributor
    FOREIGN KEY (DistributorID) REFERENCES tblDistributor(DistributorID)
    ON UPDATE CASCADE
    ON DELETE SET NULL
) ENGINE=InnoDB;


-- 10_tblReturn.sql
CREATE TABLE tblReturn (
  ReturnID INT NOT NULL,
  ProductID INT,
  ReturnQuantity INT,
  ReturnDate DATETIME,
  PRIMARY KEY (ReturnID),
  INDEX (ProductID),
  CONSTRAINT fk_return_product
    FOREIGN KEY (ProductID) REFERENCES tblProduct(ProductID)
    ON UPDATE CASCADE
    ON DELETE SET NULL
) ENGINE=InnoDB;


-- 11_tblQuery.sql
CREATE TABLE tblQuery (
  QueryName VARCHAR(255),
  QueryType VARCHAR(255)
) ENGINE=InnoDB;
