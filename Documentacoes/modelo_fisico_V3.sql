-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema db_tcc
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_tcc
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_tcc` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `db_tcc` ;

-- -----------------------------------------------------
-- Table `db_tcc`.`administrador_restaurante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_tcc`.`administrador_restaurante` (
  `id_admin` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id_admin`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_tcc`.`ingredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_tcc`.`ingredientes` (
  `id_ingrediente` INT NOT NULL AUTO_INCREMENT,
  `arroz` TINYINT(1) NOT NULL DEFAULT '0',
  `feijao` TINYINT(1) NOT NULL DEFAULT '0',
  `batata` TINYINT(1) NOT NULL DEFAULT '0',
  `cenoura` TINYINT(1) NOT NULL DEFAULT '0',
  `cebola` TINYINT(1) NOT NULL DEFAULT '0',
  `alho` TINYINT(1) NOT NULL DEFAULT '0',
  `tomate` TINYINT(1) NOT NULL DEFAULT '0',
  `pimentao` TINYINT(1) NOT NULL DEFAULT '0',
  `brocolis` TINYINT(1) NOT NULL DEFAULT '0',
  `couve_flor` TINYINT(1) NOT NULL DEFAULT '0',
  `espinafre` TINYINT(1) NOT NULL DEFAULT '0',
  `abobrinha` TINYINT(1) NOT NULL DEFAULT '0',
  `berinjela` TINYINT(1) NOT NULL DEFAULT '0',
  `pepino` TINYINT(1) NOT NULL DEFAULT '0',
  `alface` TINYINT(1) NOT NULL DEFAULT '0',
  `rucula` TINYINT(1) NOT NULL DEFAULT '0',
  `frango` TINYINT(1) NOT NULL DEFAULT '0',
  `carne_bovina` TINYINT(1) NOT NULL DEFAULT '0',
  `peixe` TINYINT(1) NOT NULL DEFAULT '0',
  `ovo` TINYINT(1) NOT NULL DEFAULT '0',
  `leite` TINYINT(1) NOT NULL DEFAULT '0',
  `queijo` TINYINT(1) NOT NULL DEFAULT '0',
  `creme_de_leite` TINYINT(1) NOT NULL DEFAULT '0',
  `manteiga` TINYINT(1) NOT NULL DEFAULT '0',
  `azeite` TINYINT(1) NOT NULL DEFAULT '0',
  `oleo_soja` TINYINT(1) NOT NULL DEFAULT '0',
  `sal` TINYINT(1) NOT NULL DEFAULT '0',
  `pimenta` TINYINT(1) NOT NULL DEFAULT '0',
  `oregano` TINYINT(1) NOT NULL DEFAULT '0',
  `salsinha` TINYINT(1) NOT NULL DEFAULT '0',
  `cebolinha` TINYINT(1) NOT NULL DEFAULT '0',
  `limao` TINYINT(1) NOT NULL DEFAULT '0',
  `laranja` TINYINT(1) NOT NULL DEFAULT '0',
  `maca` TINYINT(1) NOT NULL DEFAULT '0',
  `banana` TINYINT(1) NOT NULL DEFAULT '0',
  `aveia` TINYINT(1) NOT NULL DEFAULT '0',
  `lentilha` TINYINT(1) NOT NULL DEFAULT '0',
  `grao_de_bico` TINYINT(1) NOT NULL DEFAULT '0',
  `tomilho` TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_ingrediente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_tcc`.`preferencias_alimentares`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_tcc`.`preferencias_alimentares` (
  `id_preferencia` INT NOT NULL AUTO_INCREMENT,
  `celíaco` TINYINT(1) NOT NULL,
  `intolerante` TINYINT(1) NOT NULL,
  `vegano` TINYINT(1) NOT NULL,
  `vegetariano` TINYINT(1) NOT NULL,
  `low_carb` TINYINT(1) NOT NULL,
  `outros` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_preferencia`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_tcc`.`restaurante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_tcc`.`restaurante` (
  `id_restaurante` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(120) NOT NULL,
  `localizacao` VARCHAR(200) NOT NULL,
  `tipo_comida` VARCHAR(100) NOT NULL,
  `aberto` TINYINT(1) NOT NULL,
  `id_admin` INT NOT NULL,
  PRIMARY KEY (`id_restaurante`),
  INDEX `id_admin` (`id_admin` ASC) VISIBLE,
  CONSTRAINT `restaurante_ibfk_1`
    FOREIGN KEY (`id_admin`)
    REFERENCES `db_tcc`.`administrador_restaurante` (`id_admin`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_tcc`.`refeicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_tcc`.`refeicao` (
  `id_refeicao` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(120) NOT NULL,
  `descricao` TEXT NOT NULL,
  `tipo` VARCHAR(100) NOT NULL,
  `preco` DECIMAL(10,2) NOT NULL,
  `id_restaurante` INT NOT NULL,
  PRIMARY KEY (`id_refeicao`),
  INDEX `id_restaurante` (`id_restaurante` ASC) VISIBLE,
  CONSTRAINT `refeicao_ibfk_1`
    FOREIGN KEY (`id_restaurante`)
    REFERENCES `db_tcc`.`restaurante` (`id_restaurante`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_tcc`.`refeicao_ingrediente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_tcc`.`refeicao_ingrediente` (
  `id_refeicao` INT NOT NULL,
  `id_ingrediente` INT NOT NULL,
  PRIMARY KEY (`id_refeicao`, `id_ingrediente`),
  INDEX `id_ingrediente` (`id_ingrediente` ASC) VISIBLE,
  CONSTRAINT `refeicao_ingrediente_ibfk_1`
    FOREIGN KEY (`id_refeicao`)
    REFERENCES `db_tcc`.`refeicao` (`id_refeicao`),
  CONSTRAINT `refeicao_ingrediente_ibfk_2`
    FOREIGN KEY (`id_ingrediente`)
    REFERENCES `db_tcc`.`ingredientes` (`id_ingrediente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_tcc`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_tcc`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(200) NOT NULL,
  `localizacao` VARCHAR(200) NOT NULL,
  `tempo_dispo` INT NULL DEFAULT NULL,
  `data_nascimento` DATE NOT NULL,
  `id_preferencia` INT NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE,
  INDEX `id_preferencia` (`id_preferencia` ASC) VISIBLE,
  CONSTRAINT `usuario_ibfk_1`
    FOREIGN KEY (`id_preferencia`)
    REFERENCES `db_tcc`.`preferencias_alimentares` (`id_preferencia`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_tcc`.`usuario_avalia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_tcc`.`usuario_avalia` (
  `id_usuario` INT NOT NULL,
  `id_restaurante` INT NOT NULL,
  `nota` INT NOT NULL,
  `comentario` TEXT NULL DEFAULT NULL,
  `data_avaliacao` DATE NOT NULL,
  PRIMARY KEY (`id_usuario`, `id_restaurante`, `data_avaliacao`),
  INDEX `id_restaurante` (`id_restaurante` ASC) VISIBLE,
  CONSTRAINT `usuario_avalia_ibfk_1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `db_tcc`.`usuario` (`id_usuario`),
  CONSTRAINT `usuario_avalia_ibfk_2`
    FOREIGN KEY (`id_restaurante`)
    REFERENCES `db_tcc`.`restaurante` (`id_restaurante`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_tcc`.`usuario_favorita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_tcc`.`usuario_favorita` (
  `id_usuario` INT NOT NULL,
  `id_restaurante` INT NOT NULL,
  `data_favorito` DATE NOT NULL,
  PRIMARY KEY (`id_usuario`, `id_restaurante`),
  INDEX `id_restaurante` (`id_restaurante` ASC) VISIBLE,
  CONSTRAINT `usuario_favorita_ibfk_1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `db_tcc`.`usuario` (`id_usuario`),
  CONSTRAINT `usuario_favorita_ibfk_2`
    FOREIGN KEY (`id_restaurante`)
    REFERENCES `db_tcc`.`restaurante` (`id_restaurante`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_tcc`.`usuario_pesquisa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_tcc`.`usuario_pesquisa` (
  `id_usuario` INT NOT NULL,
  `id_restaurante` INT NOT NULL,
  `termo` VARCHAR(255) NOT NULL,
  `data_pesquisa` DATE NOT NULL,
  PRIMARY KEY (`id_usuario`, `id_restaurante`, `data_pesquisa`),
  INDEX `id_restaurante` (`id_restaurante` ASC) VISIBLE,
  CONSTRAINT `usuario_pesquisa_ibfk_1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `db_tcc`.`usuario` (`id_usuario`),
  CONSTRAINT `usuario_pesquisa_ibfk_2`
    FOREIGN KEY (`id_restaurante`)
    REFERENCES `db_tcc`.`restaurante` (`id_restaurante`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
