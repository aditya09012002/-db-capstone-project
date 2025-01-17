-- Get MaxQuantity from Orders
DELIMITER && 
CREATE PROCEDURE `GetMaxQuantity`()
BEGIN
	select max(quantity) as 'Max Quantity in Orders' from
    Orders;
END &&
DELIMITER ;


-- Get Order Detail prepared Statement
PREPARE GetOrderDetail FROM 'SELECT orderId as OrderID, orderDate as OrderDate,
quantity as OrderQuantity,
totalCost as Cost 
FROM Orders WHERE orderId = ?';


SET @id = 1;
EXECUTE GetOrderDetail USING @id;

-- Delete Orders by OrderId
DELIMITER &&
CREATE PROCEDURE CancelOrder(IN orderId int)
BEGIN
DELETE FROM `LittleLemonDB`.`Orders`
WHERE orderId = orderId
END&&
DELIMITER ;



-- Get Order Info
 select 
 c.customerId as CustomerID,
 concat(c.firstName,' ',lastName) as 'FullName', 
 o.orderId as OrderID, 
 o.totalCost as Cost,
 m.itemName as MenuName,
 m.itemType as CourseName 
 from Orders o 
 join Bookings b 
 on b.bookingId = o.bookingId 
 join Customers c 
 on c.customerId = b.customerId 
 join OrderMenu om  
 on om.orderId = o.orderId 
 join Menu m 
 on m.menuId = om.menuId;

-- Select menu item name where that item is ordered more then 1.
 select m.itemName as MenuName
from Menu m
where m.menuId in (
select om.menuId 
from Menu m
join OrderMenu om
on m.menuId = om.menuId
group by om.menuId
having count(*) > 1
);


-- Booking System
-- Create a procedure to add a booking
CREATE PROCEDURE `AddBooking`(
IN p_bookingId int,
IN p_bookingDate date,
IN p_tableNumber int,
IN p_customerId int,
IN p_staffId int
)
BEGIN
 INSERT into Bookings(bookingId,bookingDate,tableNumber,customerId,staffId) values
 (
	p_bookingId,
	p_bookingDate,
    p_tableNumber,
    p_customerId,
    p_staffId
 );
 
SELECT 'Booking added successfully.' AS Confirmation;
END

-- Create a procedure to update date of booking by booking id
CREATE PROCEDURE `UpdateBookingDate`(
IN p_bookingId int,
IN p_bookingDate date
)
BEGIN
	UPDATE Bookings
    SET bookingDate = p_bookingDate
    WHERE bookingId = p_bookingId;
    
    SELECT concat('Booking ',p_bookingId,'  Updated.') as Confirmation;
END

-- Delete booking by bookingId
CREATE PROCEDURE `DeleteByBookingId`(IN _orderId int)
BEGIN
delete from Orders
where orderId = _orderId;
SELECT concat('Booking ',p_bookingId,'  Cancelled.') as Confirmation; 
END