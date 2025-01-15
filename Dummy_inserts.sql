-- Insert dummy data for Customers
INSERT INTO `LittleLemonDB`.`Customers` 
(`customerId`, `firstName`, `lastName`, `email`, `phoneNumber`) 
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '1234567890'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '0987654321'),
(3, 'Alice', 'Brown', 'alice.brown@example.com', '1122334455');

INSERT INTO `LittleLemonDB`.`Staff` 
(`staffId`, `firstName`, `lastName`, `role`, `salary`, `email`, `phoneNumber`) 
VALUES
(1, 'Emily', 'Johnson', 'Manager', 60000.00, 'emily.johnson@example.com', '5566778899'),
(2, 'Michael', 'Davis', 'Chef', 45000.00, 'michael.davis@example.com', '6677889900'),
(3, 'Sarah', 'Lee', 'Waiter', 30000.00, 'sarah.lee@example.com', '7788990011');

INSERT INTO `LittleLemonDB`.`Menu` 
(`menuId`, `itemName`, `itemType`, `price`) 
VALUES
(1, 'Margherita Pizza', 'Main Course', 8.50),
(2, 'Caesar Salad', 'Starter', 6.00),
(3, 'Tiramisu', 'Dessert', 4.50),
(4, 'Latte', 'Beverage', 3.00);

INSERT INTO `LittleLemonDB`.`Bookings` 
(`bookingId`, `bookingDate`, `tableNumber`, `customerId`, `staffId`) 
VALUES
(1, '2025-01-15', 5, 1, 1),
(2, '2025-01-15', 7, 2, 2),
(3, '2025-01-16', 3, 3, 3);

INSERT INTO `LittleLemonDB`.`Orders` 
(`orderId`, `orderDate`, `quantity`, `totalCost`, `bookingId`) 
VALUES
(1, '2025-01-15', 2, 15.00, 1),
(2, '2025-01-15', 3, 18.50, 2),
(3, '2025-01-16', 1, 3.00, 3);

INSERT INTO `LittleLemonDB`.`OrderMenu` 
(`orderMenuId`, `orderId`, `menuId`, `quantity`) 
VALUES
(1, 1, 1, 1),
(2, 1, 3, 1),
(3, 2, 2, 1),
(4, 2, 4, 2),
(5, 3, 4, 1);

INSERT INTO `LittleLemonDB`.`OrderDeliveryStatus` 
(`statusId`, `orderId`, `deliveryDate`, `deliveryStatus`) 
VALUES
(1, 1, '2025-01-15', 'Delivered'),
(2, 2, '2025-01-15', 'In Progress'),
(3, 3, '2025-01-16', 'Pending');