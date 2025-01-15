-- Active: 1736945969709@@127.0.0.1@3306
-- Task 1
DELIMITER && 
CREATE PROCEDURE `GetMaxQuantity`()
BEGIN
	select max(quantity) as 'Max Quantity in Orders' from
    Orders;
END &&
DELIMITER ;


-- Task 2
PREPARE GetOrderDetail FROM 'SELECT orderId as OrderID, orderDate as OrderDate,
quantity as OrderQuantity,
totalCost as Cost 
FROM Orders WHERE orderId = ?';


SET @id = 1;
EXECUTE GetOrderDetail USING @id;


-- Task 3
DELIMITER &&
CREATE PROCEDURE CancelOrder(IN orderId int)
BEGIN
DELETE FROM `LittleLemonDB`.`Orders`
WHERE orderId = orderId
END&&
DELIMITER ;
