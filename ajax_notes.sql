-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema quotes
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema quotes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ajax_notes` DEFAULT CHARACTER SET latin1 ;
USE `ajax_notes` ;

-- -----------------------------------------------------
-- Table `quotes`.`quotes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ajax_notes`.`notes` (
        `id` INT(11) NOT NULL AUTO_INCREMENT,
        `title` VARCHAR(255) NULL DEFAULT NULL,
        `description` TEXT NULL DEFAULT NULL,
        `created_at` datetime NULL DEFAULT NULL,
        `updated_at` datetime NULL DEFAULT NULL,
          PRIMARY KEY (`id`))
          ENGINE = InnoDB
          AUTO_INCREMENT = 11
          DEFAULT CHARACTER SET = latin1;


          SET SQL_MODE=@OLD_SQL_MODE;
          SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
          SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

          INSERT INTO `notes` (`id`,`title`,`description`, `created_at`, `updated_at`) VALUES (1,'Django','Computers are good at following instructions, but not at reading your mind.', Now(), Now());
          INSERT INTO `notes` (`id`,`title`,`description`, `created_at`, `updated_at`) VALUES (2, 'Python', 'If debugging is the process of removing software bugs, then programming must be the process of putting them in.', Now(), Now());
