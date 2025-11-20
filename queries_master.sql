-- 01_qryToAddServiceProvider.sql
INSERT INTO
    tblServiceProvider
VALUES
    (
        '16',
        'Sophia',
        'Lee',
        '567 Willow Court',
        'Des Moines',
        '15',
        '50309',
        '1'
    );


-- 02_qryToDeleteOrderID.sql
DELETE *
FROM
    tblOrder
WHERE
    OrderID = 110;


-- 03_qryCountOfEmployeesPerPosition.sql
SELECT
    tblEmployee.Position,
    Count(tblEmployee.EmployeeID) AS CountOfEmployeeID
FROM
    tblEmployee
GROUP BY
    tblEmployee.Position;


-- 04_qryCountOfOrderID.sql
SELECT
    tblOrder.DistributorID,
    Count(tblOrder.OrderID) AS CountOfOrderID
FROM
    tblOrder
GROUP BY
    tblOrder.DistributorID;


-- 05_qryForServiceProviderDetail.sql
SELECT
    tblServiceProvider.ServiceProviderID,
    [FirstName] + " " + [LastName] AS ServiceProvoider,
    tblServiceProvider.ServiceID,
    tblService.ServiceName,
    tblState.StateNumber,
    tblState.StateName
FROM
    tblService
    INNER JOIN (
        tblState
        INNER JOIN tblServiceProvider ON tblState.StateNumber = tblServiceProvider.StateNumber
    ) ON tblService.ServiceID = tblServiceProvider.ServiceID;


-- 06_qryMaxCustomerFromState.sql
SELECT
    tblCustomer.StateNumber,
    Max(tblCustomer.CustomerID) AS MaxOfCustomerID
FROM
    tblCustomer
GROUP BY
    tblCustomer.StateNumber
ORDER BY
    Max(tblCustomer.CustomerID) DESC;


-- 07_qryPositionAndPay.sql
SELECT
    [tblEmployee].EmployeeID,
    [tblEmployee].Pay,
    [tblEmployee].Position
FROM
    tblEmployee
WHERE
    (
        (([tblEmployee].Pay) > [Enter the Pay])
        AND (([tblEmployee].Position) = [Enter the Position])
    );


-- 08_qrySumOfPay.sql
SELECT
    tblEmployee.Position,
    Sum(tblEmployee.Pay) AS SumOfPay
FROM
    tblEmployee
GROUP BY
    tblEmployee.Position;


-- 09_qryToGetDistributorID&NameForProduct.sql
SELECT
    tblProduct.ProductID,
    tblProduct.ProductName,
    tblOrder.DistributorID,
    tblDistributor.DistributorName,
    tblProduct.Quantity,
    tblProduct.Cost
FROM
    tblProduct
    INNER JOIN (
        tblDistributor
        INNER JOIN tblOrder ON tblDistributor.DistributorID = tblOrder.DistributorID
    ) ON tblProduct.ProductID = tblOrder.ProductID
WHERE
    (
        ((tblProduct.Quantity) > 20)
        AND ((tblProduct.Cost) BETWEEN 1 AND 5)
    );


-- 10_qryToGeTEmployeesStateAndPay.sql
SELECT
    tblEmployee.EmployeeID,
    tblState.StateNumber,
    tblState.StateName,
    tblEmployee.Pay
FROM
    tblState
    INNER JOIN tblEmployee ON tblState.StateNumber = tblEmployee.StateNumber
WHERE
    (((tblEmployee.Pay) > 15000));


-- 11_qryToGetTotalQuantity.sql
SELECT
    tblProduct.ProductID,
    tblProduct.ProductName,
    [Quantity] - [ReturnQuantity] AS TotalQuantity
FROM
    tblProduct
    INNER JOIN tblReturn ON tblProduct.ProductID = tblReturn.ProductID;


-- 12_qryToUpdateEmployeeName.sql
UPDATE tblEmployee
SET
    tblEmployee.FirstName = 'Cecilia',
    tblEmployee.LastName = 'Powell'
WHERE
    EmployeeID = 15;
