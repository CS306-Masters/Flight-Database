-- ORAN CAN
DELIMITER ;
DELIMITER $$

CREATE PROCEDURE departureTimeUpdate(t TIMESTAMP, num CHAR(7))
BEGIN
 	UPDATE `flights` SET `departure_time` = t WHERE `flight_number` = num;
END $$

CREATE PROCEDURE buyTicket(class CHAR(11), name CHAR(20), customer_no VARCHAR(11), age INT, isFemale BOOLEAN, cost INT, flight_number CHAR(7))
BEGIN
	INSERT INTO `passengers`(`class`, `name`, `customer_no`, `age`, `isFemale`)
		VALUES (class, name, customer_no, age, isFemale, cost);
	INSERT INTO `flies`(`cost`, `customer_no`, `flight_number`)
		VALUES (cost, customer_no, flight_number);
END $$ 

CREATE PROCEDURE newAirline(airline_code CHAR(4), airline_name CHAR(20))
BEGIN
	INSERT INTO `airlines`(`airline_code`, `airline_name`)
		VALUES (airline_code, airline_name);
END $$
-- ORAN CAN END

-- berkyaglioglu start
CREATE PROCEDURE addHourlyEmployee(`since` DATE, `airline_code` CHAR(4), `ssn` INTEGER, `name` CHAR(20), `service_type` CHAR(20), `hourly_wages` INTEGER, `hours_worked` INTEGER)
BEGIN
	INSERT INTO `works_in`(`since`, `airline_code`, `ssn`)
	VALUES (since, airline_code, ssn);
	INSERT INTO `employees`(`ssn`, `name`, `service_type`)
	VALUES (ssn, name, service_type);
	INSERT INTO `hourly`(`hourly_wages`, `hours_worked`, `employee_ssn`)
	VALUES (hourly_wages, hours_worked, ssn);
END $$

CREATE PROCEDURE addContractedEmployee(`since` DATE, `airline_code` CHAR(4), `ssn` INTEGER, `name` CHAR(20), `service_type` CHAR(20), `contract_ID` INTEGER)
BEGIN
	INSERT INTO `works_in`(`since`, `airline_code`, `ssn`)
	VALUES (since, airline_code, ssn);
	INSERT INTO `employees`(`ssn`, `name`, `service_type`)
	VALUES (ssn, name, service_type);
	INSERT INTO `contracted`(`contract_ID`, `employee_ssn`)
	VALUES (contract_ID, ssn);
END $$

CREATE PROCEDURE removingEmployee(`ssn` INTEGER)
BEGIN
	DELETE FROM `employees` WHERE `ssn` = ssn;
END $$
-- berkyaglioglu end
