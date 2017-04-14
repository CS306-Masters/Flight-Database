DROP DATABASE IF EXISTS flight_cs306;
CREATE DATABASE IF NOT EXISTS flight_cs306;
USE flight_cs306;

--
-- MARK: CREATE ENTITY SETS
--

CREATE TABLE IF NOT EXISTS `flights` (
	`flight_number`CHAR(7),
	`plane_model` CHAR(20),
	`tail_number` CHAR(6),
	`gate/park` CHAR(5),
	`departure_time` TIMESTAMP,
	`isDomestic` BOOLEAN,
	`destination` CHAR(3),
	`departure` CHAR(3),
	`runway` CHAR(5),
	`is_canceled` BOOLEAN,
	PRIMARY KEY (`flight_number`)
);

CREATE TABLE IF NOT EXISTS `airlines` (
	`airline_code` CHAR(4), -- IATA states that airlines ID's consist of 4 chars
	`airline_name` CHAR(20),
	PRIMARY KEY (`airline_code`)
);

CREATE TABLE IF NOT EXISTS `employees` (
	`ssn` INTEGER,
	`name` CHAR(20),
	`service_type` CHAR(20),
	PRIMARY KEY (`ssn`)
);

CREATE TABLE IF NOT EXISTS `passengers` (
	`class` CHAR(11), -- since max length is 11 with "first class"
	`name` CHAR(20),
	`customer_no` VARCHAR(11),
	`age` INTEGER,
	`isFemale` BOOLEAN,
	PRIMARY KEY (`customer_no`)
);

--
-- MARK: CREATE RELATIONSHIPS
--

CREATE TABLE IF NOT EXISTS `belongs` (
	`airline_code` CHAR(4),
	`flight_number` CHAR(7),
	FOREIGN KEY (`airline_code`) REFERENCES `airlines`(`airline_code`) ON DELETE NO ACTION,
	FOREIGN KEY (`flight_number`) REFERENCES `flights`(`flight_number`) ON DELETE NO ACTION,
	PRIMARY KEY (`airline_code`, `flight_number`)
);

CREATE TABLE IF NOT EXISTS `works_in` (
	`since` DATE,
	`airline_code` CHAR(4),
	`ssn` INTEGER,
	FOREIGN KEY (`airline_code`) REFERENCES `airlines`(`airline_code`) ON DELETE NO ACTION,
	FOREIGN KEY (`ssn`) REFERENCES `employees`(`ssn`) ON DELETE CASCADE,
	PRIMARY KEY (`ssn`, `airline_code`)
);

CREATE TABLE IF NOT EXISTS `flies` (
	`customer_no` VARCHAR(11),
	`flight_number` CHAR(7),
	FOREIGN KEY (`flight_number`) REFERENCES flights(`flight_number`) ON DELETE NO ACTION,
	FOREIGN KEY (`customer_no`) REFERENCES `passengers`(`customer_no`) ON DELETE CASCADE,
	PRIMARY KEY (`flight_number`, `customer_no`)
);

--
-- MARK: CREATE CHILD CLASSES
--

CREATE TABLE IF NOT EXISTS `contracted` (
	`contract_ID` INTEGER,
	`employee_ssn` INTEGER,
	FOREIGN KEY (`employee_ssn`) REFERENCES `employees`(`ssn`) ON DELETE CASCADE,
	PRIMARY KEY (`employee_ssn`)
);

CREATE TABLE IF NOT EXISTS `hourly` (
	`hourly_wages` INTEGER,
	`hours_worked` INTEGER,
	`employee_ssn` INTEGER,
	FOREIGN KEY (`employee_ssn`) REFERENCES `employees`(`ssn`) ON DELETE CASCADE,
	PRIMARY KEY (`employee_ssn`)
);

CREATE TABLE IF NOT EXISTS `passaport_entry` (
	`passaport_ID` VARCHAR(11),
	`country_code` CHAR(2), -- eg. TR, EN...
	FOREIGN KEY (`passaport_ID`) REFERENCES `passengers`(`customer_no`) ON DELETE CASCADE,
	PRIMARY KEY (`passaport_ID`)
);

CREATE TABLE IF NOT EXISTS `turkish_entry` (
	`turkish_ID` VARCHAR(11),
	FOREIGN KEY (`turkish_ID`) REFERENCES `passengers`(`customer_no`) ON DELETE CASCADE,
	PRIMARY KEY (`turkish_ID`)
);
