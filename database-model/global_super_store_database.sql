-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema global_super_store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema global_super_store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `global_super_store` DEFAULT CHARACTER SET utf8 ;
USE `global_super_store` ;

-- -----------------------------------------------------
-- Table `global_super_store`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store`.`Customers` (
  `CustomerID` VARCHAR(100) NOT NULL,
  `FullName` VARCHAR(255) NOT NULL,
  `Segment` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global_super_store`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store`.`Products` (
  `ProductID` VARCHAR(100) NOT NULL,
  `ProductName` VARCHAR(255) NOT NULL,
  `Category` VARCHAR(100) NOT NULL,
  `Sub-category` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ProductID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global_super_store`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store`.`Orders` (
  `OrderID` VARCHAR(100) NOT NULL,
  `ProductID` VARCHAR(100) NOT NULL,
  `CustomerID` VARCHAR(100) NOT NULL,
  `OrderDate` DATE NOT NULL,
  `Market` VARCHAR(100) NOT NULL,
  `OrderPriority` VARCHAR(50) NOT NULL,
  `Quantity` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `ProductID_idx` (`ProductID` ASC) VISIBLE,
  CONSTRAINT `customerId_fk_orders`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `global_super_store`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `productId_fk_orders`
    FOREIGN KEY (`ProductID`)
    REFERENCES `global_super_store`.`Products` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global_super_store`.`Sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store`.`Sales` (
  `OrderID` VARCHAR(100) NOT NULL,
  `Slaes` DECIMAL NOT NULL,
  `Discount` DECIMAL NOT NULL,
  `Profit` DECIMAL NOT NULL,
  `ShippingCost` DECIMAL NOT NULL,
  PRIMARY KEY (`OrderID`),
  CONSTRAINT `orderId_fk_sales`
    FOREIGN KEY (`OrderID`)
    REFERENCES `global_super_store`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global_super_store`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store`.`Address` (
  `AddressID` INT NOT NULL,
  `City` VARCHAR(100) NOT NULL,
  `State` VARCHAR(100) NOT NULL,
  `Country` VARCHAR(100) NOT NULL,
  `PostalCode` INT NOT NULL,
  `Region` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global_super_store`.`Shipping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store`.`Shipping` (
  `OrderID` VARCHAR(100) NOT NULL,
  `AddressID` INT NOT NULL,
  `ShippingDate` DATE NOT NULL,
  `ShippingMode` VARCHAR(100) NOT NULL,
  `ShippingCost` DECIMAL NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `AddressID_idx` (`AddressID` ASC) VISIBLE,
  CONSTRAINT `orderId_fk_shipping`
    FOREIGN KEY (`OrderID`)
    REFERENCES `global_super_store`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `addressId_fk`
    FOREIGN KEY (`AddressID`)
    REFERENCES `global_super_store`.`Address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global_super_store`.`Sales_`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store`.`Sales_` (
  `SalesID` INT NOT NULL,
  `Price` DECIMAL NOT NULL,
  `Cost` DECIMAL NOT NULL,
  `Discount` DECIMAL NOT NULL,
  `ShippingCost` DECIMAL NOT NULL,
  `Quantity` INT NOT NULL,
  `LocationID` INT NULL,
  `TimeID` INT NULL,
  `ProductID` INT NULL,
  PRIMARY KEY (`SalesID`),
  INDEX `locationId_fk_idx` (`LocationID` ASC) VISIBLE,
  INDEX `timeId_fk_idx` (`TimeID` ASC) VISIBLE,
  INDEX `productId_fk_idx` (`ProductID` ASC) VISIBLE,
  CONSTRAINT `locationId_fk`
    FOREIGN KEY (`LocationID`)
    REFERENCES `global_super_store`.`Location` (`LocationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `timeId_fk`
    FOREIGN KEY (`TimeID`)
    REFERENCES `global_super_store`.`Time` (`TimeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `productId_fk`
    FOREIGN KEY (`ProductID`)
    REFERENCES `global_super_store`.`Products_` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
