DROP DATABASE IF EXISTS flight_cs306;
CREATE DATABASE IF NOT EXISTS flight_cs306;
USE flight_cs306;

--
-- MARK: CREATE ENTITY SETS
--

CREATE TABLE IF NOT EXISTS `flights` (
	`flight_number`CHAR(7) NOT NULL,
	`plane_model` CHAR(20) NOT NULL,
	`tail_number` CHAR(6) NOT NULL,
	`gate/park` CHAR(5) NOT NULL,
	`departure_time` TIMESTAMP NOT NULL,
	`isDomestic` BOOLEAN NOT NULL,
	`destination` CHAR(3) NOT NULL,
	`departure` CHAR(3) NOT NULL,
	`runway` CHAR(5),
	`is_canceled` BOOLEAN NOT NULL DEFAULT FALSE,
	PRIMARY KEY (`flight_number`)
);

CREATE TABLE IF NOT EXISTS `airlines` (
	`airline_code` CHAR(4), -- IATA states that airlines ID's consist of 4 chars
	`airline_name` CHAR(20),
	PRIMARY KEY (`airline_code`)
);

CREATE TABLE IF NOT EXISTS `employees` (
	`ssn` INTEGER NOT NULL,
	`name` CHAR(20) NOT NULL,
	`service_type` CHAR(20),
	PRIMARY KEY (`ssn`)
);

CREATE TABLE IF NOT EXISTS `passengers` (
	`class` CHAR(11), NOT NULL -- since max length is 11 with "first class"
	`name` CHAR(20) NOT NULL,
	`customer_no` VARCHAR(11) NOT NULL,
	`age` INTEGER,
	`isFemale` BOOLEAN,
	PRIMARY KEY (`customer_no`)
);

--
-- MARK: CREATE RELATIONSHIPS
--

CREATE TABLE IF NOT EXISTS `belongs` (
	`airline_code` CHAR(4) NOT NULL,
	`flight_number` CHAR(7) NOT NULL,
	FOREIGN KEY (`airline_code`) REFERENCES `airlines`(`airline_code`) ON DELETE NO ACTION,
	FOREIGN KEY (`flight_number`) REFERENCES `flights`(`flight_number`) ON DELETE NO ACTION,
	PRIMARY KEY (`airline_code`, `flight_number`)
);

CREATE TABLE IF NOT EXISTS `works_in` (
	`since` DATE,
	`airline_code` CHAR(4) NOT NULL,
	`ssn` INTEGER NOT NULL,
	FOREIGN KEY (`airline_code`) REFERENCES `airlines`(`airline_code`) ON DELETE NO ACTION,
	FOREIGN KEY (`ssn`) REFERENCES `employees`(`ssn`) ON DELETE CASCADE,
	PRIMARY KEY (`ssn`, `airline_code`)
);

CREATE TABLE IF NOT EXISTS `flies` (
	`customer_no` VARCHAR(11) NOT NULL,
	`flight_number` CHAR(7) NOT NULL,
	FOREIGN KEY (`flight_number`) REFERENCES flights(`flight_number`) ON DELETE NO ACTION,
	FOREIGN KEY (`customer_no`) REFERENCES `passengers`(`customer_no`) ON DELETE CASCADE,
	PRIMARY KEY (`flight_number`, `customer_no`)
);

--
-- MARK: CREATE CHILD CLASSES
--

CREATE TABLE IF NOT EXISTS `contracted` (
	`contract_ID` INTEGER NOT NULL,
	`employee_ssn` INTEGER NOT NULL,
	FOREIGN KEY (`employee_ssn`) REFERENCES `employees`(`ssn`) ON DELETE CASCADE,
	PRIMARY KEY (`employee_ssn`)
);

CREATE TABLE IF NOT EXISTS `hourly` (
	`hourly_wages` INTEGER NOT NULL,
	`hours_worked` INTEGER NOT NULL,
	`employee_ssn` INTEGER NOT NULL,
	FOREIGN KEY (`employee_ssn`) REFERENCES `employees`(`ssn`) ON DELETE CASCADE,
	PRIMARY KEY (`employee_ssn`)
);

CREATE TABLE IF NOT EXISTS `passaport_entry` (
	`passaport_ID` VARCHAR(11) NOT NULL,
	`country_code` CHAR(2) NOT NULL, -- eg. TR, EN...
	FOREIGN KEY (`passaport_ID`) REFERENCES `passengers`(`customer_no`) ON DELETE CASCADE,
	PRIMARY KEY (`passaport_ID`)
);

CREATE TABLE IF NOT EXISTS `turkish_entry` (
	`turkish_ID` VARCHAR(11) NOT NULL,
	FOREIGN KEY (`turkish_ID`) REFERENCES `passengers`(`customer_no`) ON DELETE CASCADE,
	PRIMARY KEY (`turkish_ID`)
);
