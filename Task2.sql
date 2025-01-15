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