-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hopihari_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hopihari_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hopihari_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `hopihari_db` ;

-- -----------------------------------------------------
-- Table `hopihari_db`.`rides`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hopihari_db`.`rides` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `tempo_espera` INT NOT NULL,
  `status` VARCHAR(50) NOT NULL,
  `area` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hopihari_db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hopihari_db`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `birth_date` DATE NOT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `hopihari_db`.`lines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hopihari_db`.`lines` (
  `users_id` INT NOT NULL,
  `rides_id` INT NOT NULL,
  PRIMARY KEY (`users_id`, `rides_id`),
  INDEX `fk_users_has_rides_rides1_idx` (`rides_id` ASC) VISIBLE,
  INDEX `fk_users_has_rides_users_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_rides_rides1`
    FOREIGN KEY (`rides_id`)
    REFERENCES `hopihari_db`.`rides` (`id`),
  CONSTRAINT `fk_users_has_rides_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `hopihari_db`.`users` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `hopihari_db`.`Notificaçoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hopihari_db`.`Notificaçoes` (
  `id` INT NOT NULL,
  `desc` VARCHAR(45) NULL,
  `id_rides` INT NOT NULL,
  `id_users` INT NOT NULL,
  PRIMARY KEY (`id`, `id_rides`, `id_users`),
  INDEX `id_idx` (`id_rides` ASC) VISIBLE,
  INDEX `id_user_idx` (`id_users` ASC) VISIBLE,
  CONSTRAINT `id`
    FOREIGN KEY (`id_rides`)
    REFERENCES `hopihari_db`.`rides` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_user`
    FOREIGN KEY (`id_users`)
    REFERENCES `hopihari_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
