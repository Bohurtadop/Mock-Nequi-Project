DROP DATABASE IF EXISTS mock_nequi;
CREATE DATABASE mock_nequi;

CREATE TABLE IF NOT EXISTS `mock_nequi`.`Users` (
  `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(200) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mock_nequi`.`Accounts` (
  `account_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `available_balance` INT UNSIGNED NOT NULL DEFAULT 0,
  `mattress_amount` INT UNSIGNED NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`account_id`, `user_id`),
  INDEX `fk_Accounts_Users1_idx` (`user_id` ASC),
  CONSTRAINT `fk_Accounts_Users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mock_nequi`.`Users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mock_nequi`.`Pockets` (
  `pocket_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `pocket_name` VARCHAR(50) NOT NULL,
  `amount` INT NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` TINYINT(1) NOT NULL DEFAULT 1,
  `account_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`pocket_id`),
  INDEX `fk_Pockets_Accounts1_idx` (`account_id` ASC),
  CONSTRAINT `fk_Pockets_Accounts1`
    FOREIGN KEY (`account_id`)
    REFERENCES `mock_nequi`.`Accounts` (`account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mock_nequi`.`Goals` (
  `goal_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `target_amount` INT UNSIGNED NOT NULL,
  `money_saved` INT UNSIGNED NOT NULL DEFAULT 0,
  `remaining_money` INT NOT NULL,
  `status` ENUM('MET', 'BEATEN', 'IN PROGRESS') NOT NULL DEFAULT 'IN PROGRESS',
  `deadline` TIMESTAMP NULL DEFAULT '2019-12-31 23:59:59',
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` TINYINT(1) NOT NULL DEFAULT 1,
  `account_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`goal_id`),
  UNIQUE INDEX `goal_id_UNIQUE` (`goal_id` ASC),
  INDEX `fk_Goals_Accounts1_idx` (`account_id` ASC),
  CONSTRAINT `fk_Goals_Accounts1`
    FOREIGN KEY (`account_id`)
    REFERENCES `mock_nequi`.`Accounts` (`account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mock_nequi`.`Transactions` (
  `transaction_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` ENUM('withdrawal', 'recharge', 'remittance', 'reception') NOT NULL,
  `amount` INT NOT NULL,
  `transaction_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `where` VARCHAR(200) NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `account_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`transaction_id`),
  UNIQUE INDEX `transaction_id_UNIQUE` (`transaction_id` ASC),
  INDEX `fk_Transactions_Users1_idx` (`user_id` ASC),
  INDEX `fk_Transactions_Accounts1_idx` (`account_id` ASC),
  CONSTRAINT `fk_Transactions_Users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mock_nequi`.`Users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transactions_Accounts1`
    FOREIGN KEY (`account_id`)
    REFERENCES `mock_nequi`.`Accounts` (`account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
