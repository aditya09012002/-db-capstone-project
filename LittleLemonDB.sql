-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `customerId` INT NOT NULL,
  `firstName` VARCHAR(255) NOT NULL,
  `lastName` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `phoneNumber` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`customerId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staff` (
  `staffId` INT NOT NULL,
  `firstName` VARCHAR(255) NOT NULL,
  `lastName` VARCHAR(255) NOT NULL,
  `role` VARCHAR(255) NOT NULL,
  `salary` INT NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `phoneNumber` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`staffId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `bookingId` INT NOT NULL,
  `bookingDate` DATE NOT NULL,
  `tableNumber` INT NOT NULL,
  `customerId` INT NOT NULL,
  `staffId` INT NOT NULL,
  PRIMARY KEY (`bookingId`),
  INDEX `customerId_fk_booking_idx` (`customerId` ASC) VISIBLE,
  INDEX `staffId_fk_bookings_idx` (`staffId` ASC) VISIBLE,
  CONSTRAINT `customerId_fk_booking`
    FOREIGN KEY (`customerId`)
    REFERENCES `LittleLemonDB`.`Customers` (`customerId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `staffId_fk_bookings`
    FOREIGN KEY (`staffId`)
    REFERENCES `LittleLemonDB`.`Staff` (`staffId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `orderId` INT NOT NULL,
  `orderDate` DATE NOT NULL,
  `quantity` INT NOT NULL,
  `totalCost` INT NOT NULL,
  `bookingId` INT NOT NULL,
  PRIMARY KEY (`orderId`),
  INDEX `bookingId_fk_orders_idx` (`bookingId` ASC) VISIBLE,
  CONSTRAINT `bookingId_fk_orders`
    FOREIGN KEY (`bookingId`)
    REFERENCES `LittleLemonDB`.`Bookings` (`bookingId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`OrderDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`OrderDeliveryStatus` (
  `statusId` INT NOT NULL,
  `orderId` INT NOT NULL,
  `deliveryDate` INT NOT NULL,
  `deliveryStatus` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`statusId`),
  INDEX `orderId_fk_OrderDeliveryStatus_idx` (`orderId` ASC) VISIBLE,
  CONSTRAINT `orderId_fk_OrderDeliveryStatus`
    FOREIGN KEY (`orderId`)
    REFERENCES `LittleLemonDB`.`Orders` (`orderId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `menuId` INT NOT NULL,
  `itemName` VARCHAR(255) NOT NULL,
  `itemType` VARCHAR(45) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`menuId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`OrderMenu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`OrderMenu` (
  `orderMenuId` INT NOT NULL,
  `orderId` INT NOT NULL,
  `menuId` INT NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`orderMenuId`),
  INDEX `orderId_fk_OrderMenuItems_idx` (`orderId` ASC) VISIBLE,
  INDEX `menuIf_fk_Menu_idx` (`menuId` ASC) VISIBLE,
  CONSTRAINT `orderId_fk_OrderMenuItems`
    FOREIGN KEY (`orderId`)
    REFERENCES `LittleLemonDB`.`Orders` (`orderId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `menuIf_fk_Menu`
    FOREIGN KEY (`menuId`)
    REFERENCES `LittleLemonDB`.`Menu` (`menuId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
