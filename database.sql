-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cursos` (
  `curso_id` INT NOT NULL AUTO_INCREMENT,
  `curso_titulo` VARCHAR(100) NOT NULL,
  `curso_descricao` TEXT NULL,
  PRIMARY KEY (`curso_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`alunos` (
  `aluno_id` INT NOT NULL AUTO_INCREMENT,
  `aluno_nome` VARCHAR(150) NOT NULL,
  `aluno_email` VARCHAR(255) NOT NULL,
  `aluno_data_nasc` DATETIME NULL,
  PRIMARY KEY (`aluno_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`matriculas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`matriculas` (
  `matricula_id` INT NOT NULL AUTO_INCREMENT,
  `alunos_aluno_id` INT NOT NULL,
  `cursos_curso_id` INT NOT NULL,
  PRIMARY KEY (`matricula_id`, `alunos_aluno_id`, `cursos_curso_id`),
  INDEX `fk_matriculas_alunos_idx` (`alunos_aluno_id` ASC),
  INDEX `fk_matriculas_cursos_idx` (`cursos_curso_id` ASC),
  CONSTRAINT `fk_matriculas_alunos`
    FOREIGN KEY (`alunos_aluno_id`)
    REFERENCES `mydb`.`alunos` (`aluno_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_matriculas_cursos1`
    FOREIGN KEY (`cursos_curso_id`)
    REFERENCES `mydb`.`cursos` (`curso_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
