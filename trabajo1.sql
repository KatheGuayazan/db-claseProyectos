CREATE SCHEMA IF NOT EXISTS `abogados`;
USE `abogados` ;
-- -----------------------------------------------------
-- Table `Case_state`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Case_state` (
  `idCase_state` INT NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCase_state`));
-- -----------------------------------------------------
-- Table `Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cliente` (
  `idCliente` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `adress` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `phone` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `idCliente_UNIQUE` (`idCliente` ASC),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC));
-- -----------------------------------------------------
-- Table `mydb`.`Lawyer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lawyer` (
  `idLawyer` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `Professional_card` INT NOT NULL,
  `phone` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `adress` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idLawyer`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  UNIQUE INDEX `Lawercol_UNIQUE` (`Professional_card` ASC),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `adress_UNIQUE` (`adress` ASC));
-- -----------------------------------------------------
-- Table `mydb`.`Case`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Case` (
  `idCase` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `start_date` VARCHAR(45) NOT NULL,
  `finish_date` VARCHAR(45) NOT NULL,
  `Case_state_idCase_state` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idCase`),
  UNIQUE INDEX `idCase_UNIQUE` (`idCase` ASC),
  UNIQUE INDEX `start_date_UNIQUE` (`start_date` ASC),
  UNIQUE INDEX `finish_date_UNIQUE` (`finish_date` ASC),
  INDEX `fk_Case_Case_state1_idx` (`Case_state_idCase_state` ASC),
  INDEX `fk_Case_Cliente1_idx` (`Cliente_idCliente` ASC),
  CONSTRAINT `fk_Case_Case_state1`
    FOREIGN KEY (`Case_state_idCase_state`)
    REFERENCES `Case_state` (`idCase_state`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Case_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
-- -----------------------------------------------------
-- Table `mydb`.`Lawyer_has_Case`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lawyer_has_Case` (
  `Lawyer_idLawyer` INT NOT NULL,
  `Case_idCase` INT NOT NULL,
  PRIMARY KEY (`Lawyer_idLawyer`, `Case_idCase`),
  INDEX `fk_Lawyer_has_Case_Case1_idx` (`Case_idCase` ASC),
  INDEX `fk_Lawyer_has_Case_Lawyer1_idx` (`Lawyer_idLawyer` ASC),
  CONSTRAINT `fk_Lawyer_has_Case_Lawyer1`
    FOREIGN KEY (`Lawyer_idLawyer`)
    REFERENCES `Lawyer` (`idLawyer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lawyer_has_Case_Case1`
    FOREIGN KEY (`Case_idCase`)
    REFERENCES `Case` (`idCase`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
-- -----------------------------------------------------
-- Inserte en la base de datos 3 clientes, 3 abogados y llene la tabla de estado de caso con “sin iniciar”, “en trámite”, “archivado”
-- -----------------------------------------------------
-- INSERT INTO Cliente(idCliente, name, adress, email, phone) VALUES ("1", "Memo", "123456", "anarquia@gmail.com", "09876543");
-- INSERT INTO Cliente(idCliente, name, adress, email, phone) VALUES ("2", "Mimi", "654321", "paz@gmail.com", "12344567");
-- INSERT INTO Cliente(idCliente, name, adress, email, phone) VALUES ("3", "Miru", "567890", "gatos@gmail.com", "34566789");

-- INSERT INTO Lawyer(idLawyer, name, Professional_card, phone, email, adress) VALUES ("1", "Inge", "1234", "345345987", "anarquista@gmail.com", "98765");
-- INSERT INTO Lawyer(idLawyer, name, Professional_card, phone, email, adress) VALUES ("2", "nie", "4321", "987654321", "pacifista@gmail.com", "12345");
-- INSERT INTO Lawyer(idLawyer, name, Professional_card, phone, email, adress) VALUES ("3", "ros", "5678", "123456789", "gaturro@gmail.com", "54322");

-- INSERT INTO Case_state(idCase_state, State) VALUES ("1", "sin iniciar");
-- INSERT INTO Case_state(idCase_state, State) VALUES ("2", "en trámite");
-- INSERT INTO Case_state(idCase_state, State) VALUES ("3", "archivado");

-- SELECT * FROM Cliente
-- SELECT * FROM Lawyer
-- SELECT * FROM Case_state

-- -----------------------------------------------------
-- Inserte en la tabla de casos 3 casos cada uno con un cliente diferente 
-- -----------------------------------------------------
-- INSERT INTO Case(idCase, name, start_date, finish_date, Case_state_idCase_state, Cliente_idCliente) VALUES ("1", "divorcio", "12/12/12", "10/11/13", "", "1");
-- INSERT INTO Case(idCase, name, start_date, finish_date, Case_state_idCase_state, Cliente_idCliente) VALUES ("2", "robo", "13/10/13", "20/12/13", "", "2");
-- INSERT INTO Case(idCase, name, start_date, finish_date, Case_state_idCase_state, Cliente_idCliente) VALUES ("3", "herencia", "10/5/14", "25/7/14", "", "3");

-- SELECT * FROM Case

-- -----------------------------------------------------
-- Recupere un abogado mediante su cedula  
-- -----------------------------------------------------
-- SELECT * FROM Lawyer WHERE Professional_card = ;

-- -----------------------------------------------------
-- Recupere todos los casos por un estado de caso 
-- -----------------------------------------------------
-- SELECT * FROM Case WHERE Case_state = ;

-- -----------------------------------------------------
-- Actualice el registro de un caso 
-- -----------------------------------------------------
-- UPDATE Case SET columna_para_actualizar = valor_nuevo WHERE columna = condicion;

-- -----------------------------------------------------
-- Elimine un caso 
-- -----------------------------------------------------
-- DELETE FROM Case WHERE idCase = 3;