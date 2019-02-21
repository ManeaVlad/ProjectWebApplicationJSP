-- MySQL Script generated by MySQL Workbench
-- Sun Jan 13 17:12:54 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Factory
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Factory
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Factory` DEFAULT CHARACTER SET utf8 ;
USE `Factory` ;

-- -----------------------------------------------------
-- Table `Factory`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Factory`.`Products` (
  `idProducts` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Code` VARCHAR(45) NOT NULL,
  `Date` DATE NULL DEFAULT NULL,
  `Price` INT NOT NULL,
  PRIMARY KEY (`idProducts`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Factory`.`Components`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Factory`.`Components` (
  `idComponents` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Model` VARCHAR(45) NOT NULL,
  `Manufacturer` VARCHAR(45) NOT NULL,
  `Costs` INT NOT NULL,
  `Parameters` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idComponents`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Factory`.`Assemblyline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Factory`.`Assemblyline` (
  `idAssemblyline` INT NOT NULL AUTO_INCREMENT,
  `idProducts` INT NOT NULL,
  `idComponents` INT NOT NULL,
  `Validation` INT NOT NULL,
  PRIMARY KEY (`idAssemblyline`),
  INDEX `Fk_Assemblyline_1_idx` (`idProducts` ASC),
  INDEX `Fk_Assemblyline_2_idx` (`idComponents` ASC),
  CONSTRAINT `Fk_Assemblyline_1`
    FOREIGN KEY (`idProducts`)
    REFERENCES `Factory`.`Products` (`idProducts`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Fk_Assemblyline_2`
    FOREIGN KEY (`idComponents`)
    REFERENCES `Factory`.`Components` (`idComponents`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
